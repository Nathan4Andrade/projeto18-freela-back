import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";

import {
  insertSection,
  insertUser,
  selectCpf,
  selectEmail,
  selectTelephone,
} from "../repository/user.repository.js";

export async function signup(req, res) {
  const { name, email, cpf, telephone, image, password, confirmPassword } =
    req.body;
  /*   const image = req.file.buffer; */
  const hashPass = bcrypt.hashSync(password, 10);

  try {
    if (confirmPassword !== password)
      return res.status(422).send("As senhas estão diferentes!");
    const existingEmail = await selectEmail(email);
    if (existingEmail.rowCount > 0)
      return res.status(409).send("E-mail já cadastrado");
    const existingCpf = await selectCpf(cpf);
    if (existingCpf.rowCount > 0)
      return res.status(409).send("CPF já cadastrado");
    const existingTelephone = await selectTelephone(telephone);
    if (existingTelephone.rowCount > 0)
      return res.status(409).send("Telephone já cadastrado");

    await insertUser(name, image, email, cpf, telephone, hashPass);

    res.sendStatus(201);
  } catch (error) {
    res.status(500).send(error.message);
  }
}

export async function signin(req, res) {
  const { email, password } = req.body;
  const token = uuid();

  try {
    const user = (await selectEmail(email)).rows[0];

    if (!user || !bcrypt.compareSync(password, user.password))
      return res.sendStatus(401);

    await insertSection(user.id, token);
    res.status(200).send({ token: token });
  } catch (error) {
    res.status(500).send(error.message);
  }
}
