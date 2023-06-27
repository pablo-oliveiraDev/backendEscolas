/*
  Warnings:

  - You are about to drop the `disciplina` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "disciplina";

-- CreateTable
CREATE TABLE "disciplinas" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,

    CONSTRAINT "disciplinas_pkey" PRIMARY KEY ("id")
);
