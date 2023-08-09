import { Router } from "express";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { schemaSignin, schemaSignup } from "../schemas/user.schemas.js";
import { signin, signup } from "../controllers/user.controller.js";

const userRouter = Router();

userRouter.post("/signup", validateSchema(schemaSignup), signup);

userRouter.post("/signin", validateSchema(schemaSignin), signin);

export default userRouter;
