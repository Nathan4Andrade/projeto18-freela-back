import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";
import { db } from "../database/database.connection.js";

export async function signup(req, res) {
  const { name, email, cpf, telephone, password, confirmPassword } = req.body;
  const hashPass = bcrypt.hashSync(password, 10);

  try {
    if (confirmPassword !== password)
      return res.status(422).send("As senhas estão diferentes!");
    const existingEmail = await db.query(`SELECT * from users WHERE email=$1`, [
      email,
    ]);
    if (existingEmail.rowCount > 0)
      return res.status(409).send("E-mail já cadastrado");
    const existingCpf = await db.query(`SELECT * from users WHERE cpf=$1`, [
      cpf,
    ]);
    if (existingCpf.rowCount > 0)
      return res.status(409).send("CPF já cadastrado");
    const existingTelephone = await db.query(
      `SELECT * from users WHERE telephone=$1`,
      [telephone]
    );
    if (existingTelephone.rowCount > 0)
      return res.status(409).send("Telephone já cadastrado");
    const imageBuffer = req.file.buffer;
    console.log(imageBuffer);

    await db.query(
      `INSERT INTO users (name, image, email, cpf, telephone, password) VALUES ($1, $2, $3, $4, $5, $6)`,
      [name, imageBuffer, email, cpf, telephone, hashPass]
    );
    res.sendStatus(201);
  } catch (error) {
    res.status(500).send(error.message);
  }
}

export async function signin(req, res) {
  const { email, password } = req.body;
  const token = uuid();

  try {
    const user = (await db.query(`SELECT * from users WHERE email=$1`, [email]))
      .rows[0];

    if (!user || !bcrypt.compareSync(password, user.password))
      return res.sendStatus(401);

    await db.query(`INSERT INTO sessions ("userId", token) VALUES ($1, $2)`, [
      user.id,
      token,
    ]);
    res.status(200).send({ token: token });
  } catch (error) {
    res.status(500).send(error.message);
  }
}
