import { Request, Response } from "express";
import { CreateUserData } from "../repositories/authRepository";
import * as authService from "../services/authService"

export async function signIn(req: Request, res: Response) {
    const user:CreateUserData = req.body;
    const token = await authService.signIn(user);

    res.send({token});
}

export async function signUp(req: Request, res: Response) {
    const {firstName, lastName, email, password}:CreateUserData = req.body;
    await authService.signUp({firstName, lastName, email, password});
    res.sendStatus(201);
}