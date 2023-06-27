/*
  Warnings:

  - Added the required column `id_dadosDocumentos` to the `Dados_documentos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_endereco` to the `enderecos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_pagto_mes` to the `pagtos_mes` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_pessoa` to the `tipos_de_pessoas` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Dados_documentos" ADD COLUMN     "id_dadosDocumentos" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "enderecos" ADD COLUMN     "id_endereco" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "pagtos_mes" ADD COLUMN     "id_pagto_mes" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "tipos_de_pessoas" ADD COLUMN     "id_pessoa" INTEGER NOT NULL;
