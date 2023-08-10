import { db } from "../database/database.connection.js";

export function selectEmail(email) {
  return db.query(`SELECT * from users WHERE email=$1`, [email]);
}

export function selectCpf(cpf) {
  return db.query(`SELECT * from users WHERE cpf=$1`, [cpf]);
}

export function selectTelephone(telephone) {
  return db.query(`SELECT * from users WHERE telephone=$1`, [telephone]);
}

export function insertUser(name, image, email, cpf, telephone, hashPass) {
  return db.query(
    `INSERT INTO users (name, image, email, cpf, telephone, password) VALUES ($1, $2, $3, $4, $5, $6)`,
    [name, image, email, cpf, telephone, hashPass]
  );
}

export function insertSection(userId, token) {
  return db.query(`INSERT INTO sessions ("userId", token) VALUES ($1, $2)`, [
    userId,
    token,
  ]);
}
