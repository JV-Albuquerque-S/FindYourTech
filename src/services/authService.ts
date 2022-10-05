import User from "@prisma/client";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import dotenv from "dotenv";

import * as authRepository from "../repositories/authRepository";
import { conflictError, notFoundError, unauthorizedError } from "../utils/errorUtils";
import { CreateUserData } from "../repositories/authRepository";

dotenv.config();

export async function signIn(loginData: CreateUserData) {
    const user = await getUserOrFail(loginData);
    const token = jwt.sign({ userId: user }, process.env.JWT_SECRET);

    return token;
}

export async function signUp(createUserData: CreateUserData) {
    const existingUser = await authRepository.findByEmail(createUserData.email);
    if (existingUser) throw conflictError("Email must be unique");
  
    const SALT = 12;
    const hashedPassword = bcrypt.hashSync(createUserData.password, SALT);
  
    await authRepository.insert({ ...createUserData, password: hashedPassword });
}

export async function getUserOrFail(loginData: CreateUserData) {
    const user = await authRepository.findByEmail(loginData.email);
    if (!user) throw unauthorizedError("Invalid credentials");
  
    const isPasswordValid = bcrypt.compareSync(loginData.password, user.password);
    if (!isPasswordValid) throw unauthorizedError("Invalid credentials");
  
    return user;
}