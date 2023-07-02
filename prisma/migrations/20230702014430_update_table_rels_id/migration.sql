/*
  Warnings:

  - The primary key for the `pessoasDadosEscolares` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE "pessoasDadosEscolares" DROP CONSTRAINT "pessoasDadosEscolares_pkey",
ADD CONSTRAINT "pessoasDadosEscolares_pkey" PRIMARY KEY ("id");
