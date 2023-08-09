import joi from "joi";

export const schemaSignup = joi.object({
  name: joi.string().required(),
  email: joi.string().email().required(),
  telephone: joi.string().min(10).max(11).required(),
  cpf: joi
    .string()
    .pattern(/^[0-9]{11}$/)
    .required(),
  password: joi.string().required(),
  confirmPassword: joi.string().required(),
});

export const schemaSignin = joi.object({
  email: joi.string().email().required(),
  password: joi.string().required(),
});
