import {
  insertCat,
  selectAllCats,
  selectCat,
  selectCatByName,
  selectUserCats,
  updateCatAvailability,
} from "../repository/cat.repository.js";

export async function postCat(req, res) {
  const { name, breed, age, description, image } = req.body;
  /* const image = req.file.buffer; */
  const { user } = res.locals;
  try {
    const existingCat = await selectCatByName(name);
    if (existingCat.rowCount > 0)
      return res
        .status(409)
        .send({ message: "Você já cadastrou um gato com esse nome!" });
    const cat = await insertCat(name, image, breed, age, description, user);
    res.status(200).send("Seu gato foi adicionado!");
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getCats(req, res) {
  try {
    const cats = await selectAllCats();
    res.send(cats.rows);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getCatById(req, res) {
  const { id } = req.params;
  try {
    const cat = await selectCat(id);
    if (!cat.rows[0])
      return res.status(404).send({ message: "Gato não existe" });
    res.send(cat.rows[0]);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getMyCats(req, res) {
  const { user } = res.locals;
  try {
    const cats = await selectUserCats(user);
    console.log(user);
    res.send(cats.rows);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function updateAvailability(req, res) {
  const { id } = req.params;

  const available = (await selectCat(id)).rows[0].available;

  try {
    const cat = await updateCatAvailability(id, available);
    res.send("Atualizado");
  } catch (err) {
    res.status(500).send(err.message);
  }
}
