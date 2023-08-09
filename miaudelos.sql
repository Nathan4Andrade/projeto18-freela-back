CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"cpf" TEXT NOT NULL UNIQUE,
	"email" TEXT NOT NULL UNIQUE,
	"telephone" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	"createdAt" TIMESTAMP NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cats" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"age" integer NOT NULL,
	"breed" integer NOT NULL,
	"specialties" integer NOT NULL,
	"picture" TEXT NOT NULL,
	"agenciyId" integer NOT NULL,
	"available" BOOLEAN NOT NULL DEFAULT 'true',
	CONSTRAINT "cats_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sessions" (
	"id" serial NOT NULL,
	"userId" serial NOT NULL,
	"token" TEXT NOT NULL,
	CONSTRAINT "sessions_pk" PRIMARY KEY ("id","userId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.favorites" (
	"id" serial NOT NULL,
	"catId" integer NOT NULL,
	"userId" integer NOT NULL,
	"favoritedAt" serial NOT NULL,
	CONSTRAINT "favorites_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.agencies" (
	"id" serial NOT NULL,
	"userId" integer NOT NULL,
	"name" TEXT NOT NULL,
	"logoUrl" TEXT NOT NULL,
	"createdAt" TIMESTAMP NOT NULL,
	CONSTRAINT "agencies_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "cats" ADD CONSTRAINT "cats_fk0" FOREIGN KEY ("agenciyId") REFERENCES "agencies"("id");

ALTER TABLE "sessions" ADD CONSTRAINT "sessions_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");

ALTER TABLE "favorites" ADD CONSTRAINT "favorites_fk0" FOREIGN KEY ("catId") REFERENCES "cats"("id");
ALTER TABLE "favorites" ADD CONSTRAINT "favorites_fk1" FOREIGN KEY ("userId") REFERENCES "users"("id");

ALTER TABLE "agencies" ADD CONSTRAINT "agencies_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");






