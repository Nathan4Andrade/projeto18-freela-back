import { Router } from "express";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { validateAuth } from "../middlewares/validateAuth.middleware.js";
import { schemaCat } from "../schemas/cat.schema.js";
import {
  getCatById,
  getCats,
  getMyCats,
  postCat,
  updateAvailability,
} from "../controllers/cat.controller.js";

const catRouter = Router();

catRouter.post("/cats/new", validateAuth, validateSchema(schemaCat), postCat);
catRouter.get("/cats", validateAuth, getCats);
catRouter.get("/cats/me", validateAuth, getMyCats);
catRouter.get("/cats/:id", validateAuth, getCatById);
catRouter.put("/cats/:id", validateAuth, updateAvailability);

export default catRouter;
