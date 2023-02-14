import bcrypt from "bcrypt";
import * as authRepository from "../repositories/authRepository.js";
import { notFoundError, unauthorizedError } from "../utils/errorUtils.js";
import { CreateUserData } from "../repositories/authRepository.js";


export async function getUserOrFail(loginData: CreateUserData) {
    const user = await authRepository.findByEmail(loginData.email);
    if (!user) throw unauthorizedError("Invalid credentials");
  
    const isPasswordValid = bcrypt.compareSync(loginData.password, user.password);
    if (!isPasswordValid) throw unauthorizedError("Invalid credentials");
  
    return user;
}

export async function findById(id: number) {
    const user = await authRepository.findById(id);
    if (!user) throw notFoundError("User not found");
  
    return user;
  }