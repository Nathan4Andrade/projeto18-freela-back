import { db } from "../database/database.connection.js";

export function selectCatByName(name) {
  return db.query(`SELECT * FROM cats WHERE name = $1`, [name]);
}

export function selectCat(id) {
  return db.query(
    `SELECT cats.*, users.name as "owner" FROM cats JOIN users ON users.id = cats."userId" WHERE cats.id=$1`,
    [id]
  );
}

export function selectUserCats(user) {
  return db.query(`SELECT * FROM cats WHERE "userId"=$1`, [user.id]);
}

export function selectAllCats() {
  return db.query(`SELECT * FROM cats WHERE available=$1`, [true]);
}

export function insertCat(name, image, breed, age, description, user) {
  return db.query(
    `INSERT INTO cats (name, description, image, breed, age, "userId") VALUES ($1, $2, $3, $4, $5, $6)`,
    [name, description, image, breed, age, user.id]
  );
}

export function updateCatAvailability(id, available) {
  return db.query(`UPDATE cats SET available=$1 WHERE id=$2;`, [
    !available,
    id,
  ]);
}
