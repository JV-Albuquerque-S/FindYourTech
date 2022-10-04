import { Router } from "express";
import { validateSchema } from "../middlewares/validateSchema";
import {signInSchema, signUpSchema} from "../schemas/authSchemas";
//import controller from "../controllers/authController";

const authRouter = Router();

//authRouter.post("/sign-up", validateSchema(signUpSchema), signUpController);
//authRouter.post("/sign-in", validateSchema(signInSchema), signInController);

export default authRouter;