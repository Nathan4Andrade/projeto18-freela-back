import { Router } from "express";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { schemaSignin, schemaSignup } from "../schemas/user.schemas.js";
import { signin, signup } from "../controllers/user.controller.js";
import { upload } from "../middlewares/uploadFile.middleware.js";

const userRouter = Router();

userRouter.post(
  "/signup",
  upload.single("image"),
  validateSchema(schemaSignup),
  signup
);

/* userRouter.post("/upload-image", , (req, res) => {
  const { nome, site } = req.body;
  res.send({ nome, site });
}); */

userRouter.post("/signin", validateSchema(schemaSignin), signin);

export default userRouter;
