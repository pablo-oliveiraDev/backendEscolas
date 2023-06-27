/*
  Warnings:

  - Added the required column `tipoDePessoaId` to the `Dados_documentos` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Dados_documentos" ADD COLUMN     "tipoDePessoaId" INTEGER NOT NULL;
