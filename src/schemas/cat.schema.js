import joi from "joi";

export const schemaCat = joi.object({
  name: joi.string().required(),
  age: joi.number().required(),
  breed: joi.string().required(),
  description: joi.string().required(),
  image: joi.string().required(),
});
