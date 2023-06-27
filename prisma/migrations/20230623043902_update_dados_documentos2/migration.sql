/*
  Warnings:

  - The primary key for the `aluno_dados_pessoais` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `enderecoId` on the `aluno_dados_pessoais` table. All the data in the column will be lost.
  - You are about to drop the column `pagtoMesId` on the `aluno_dados_pessoais` table. All the data in the column will be lost.
  - The primary key for the `aluno_endereco` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `idDadosDocumentos` on the `aluno_endereco` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "aluno_dados_pessoais" DROP CONSTRAINT "aluno_dados_pessoais_enderecoId_fkey";

-- DropForeignKey
ALTER TABLE "aluno_dados_pessoais" DROP CONSTRAINT "aluno_dados_pessoais_idDadosDocumentos_fkey";

-- DropForeignKey
ALTER TABLE "aluno_dados_pessoais" DROP CONSTRAINT "aluno_dados_pessoais_idPessoa_fkey";

-- DropForeignKey
ALTER TABLE "aluno_dados_pessoais" DROP CONSTRAINT "aluno_dados_pessoais_pagtoMesId_fkey";

-- DropForeignKey
ALTER TABLE "aluno_endereco" DROP CONSTRAINT "aluno_endereco_idDadosDocumentos_fkey";

-- DropForeignKey
ALTER TABLE "aluno_endereco" DROP CONSTRAINT "aluno_endereco_idPessoa_fkey";

-- AlterTable
ALTER TABLE "aluno_dados_pessoais" DROP CONSTRAINT "aluno_dados_pessoais_pkey",
DROP COLUMN "enderecoId",
DROP COLUMN "pagtoMesId",
ALTER COLUMN "idPessoa" DROP NOT NULL,
ALTER COLUMN "idDadosDocumentos" DROP NOT NULL,
ADD CONSTRAINT "aluno_dados_pessoais_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "aluno_endereco" DROP CONSTRAINT "aluno_endereco_pkey",
DROP COLUMN "idDadosDocumentos",
ADD COLUMN     "idEndereco" INTEGER,
ALTER COLUMN "idPessoa" DROP NOT NULL,
ADD CONSTRAINT "aluno_endereco_pkey" PRIMARY KEY ("id");

-- AddForeignKey
ALTER TABLE "aluno_endereco" ADD CONSTRAINT "aluno_endereco_idPessoa_fkey" FOREIGN KEY ("idPessoa") REFERENCES "tipos_de_pessoas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "aluno_endereco" ADD CONSTRAINT "aluno_endereco_idEndereco_fkey" FOREIGN KEY ("idEndereco") REFERENCES "Dados_documentos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "aluno_dados_pessoais" ADD CONSTRAINT "aluno_dados_pessoais_idPessoa_fkey" FOREIGN KEY ("idPessoa") REFERENCES "tipos_de_pessoas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "aluno_dados_pessoais" ADD CONSTRAINT "aluno_dados_pessoais_idDadosDocumentos_fkey" FOREIGN KEY ("idDadosDocumentos") REFERENCES "Dados_documentos"("id") ON DELETE SET NULL ON UPDATE CASCADE;
