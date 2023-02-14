import User from "@prisma/client";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import dotenv from "dotenv";

import * as authRepository from "../repositories/authRepository.js";
import * as userService from "./userService.js"
import { conflictError } from "../utils/errorUtils.js";
import { CreateUserData } from "../repositories/authRepository.js";

dotenv.config();

export async function signIn(loginData: CreateUserData) {
    const user = await userService.getUserOrFail(loginData);
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