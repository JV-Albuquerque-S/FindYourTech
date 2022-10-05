import { Router } from "express";
import { validateSchema } from "../middlewares/validateSchema";
import {signInSchema, signUpSchema} from "../schemas/authSchemas";
import {signIn, signUp} from "../controllers/authController";

const authRouter = Router();

authRouter.post("/sign-up", validateSchema(signUpSchema), signUp);
authRouter.post("/sign-in", validateSchema(signInSchema), signIn);

export default authRouter;