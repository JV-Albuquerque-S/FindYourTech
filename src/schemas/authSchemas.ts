import Joi from "joi";

export const signUpSchema = Joi.object({
    firstName: Joi.string().required().label("firstName must be a valid string"),
    lastName: Joi.string().required().label("lastName must be a valid string"),
    email: Joi.string().email().required().label("email must have a valid format"),
    password: Joi.string().required().label("password must be a valid string"),
    confirmPassword: Joi.string().valid(Joi.ref("password")).required().label("confirmPassword must be same as 'password'")
})

export const signInSchema = Joi.object({
    email: Joi.string().email().required().label("email must have a valid format"),
    password: Joi.string().required().label("password must be a valid string")
})