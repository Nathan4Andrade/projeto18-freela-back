import { Router } from "express";
import userRouter from "./user.routes.js";
import catRouter from "./cat.routes.js";

const router = Router();

router.use(userRouter);
router.use(catRouter);

export default router;
