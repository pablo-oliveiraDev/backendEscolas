/*
  Warnings:

  - The primary key for the `aluno_dados_pessoais` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `aluno_dados_pessoais` table. All the data in the column will be lost.
  - You are about to drop the column `id` on the `alunos_pagtos` table. All the data in the column will be lost.
  - Made the column `dadosDocumentosId` on table `aluno_dados_pessoais` required. This step will fail if there are existing NULL values in that column.
  - Made the column `tipoDePessoaId` on table `aluno_dados_pessoais` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "aluno_dados_pessoais" DROP CONSTRAINT "aluno_dados_pessoais_dadosDocumentosId_fkey";

-- DropForeignKey
ALTER TABLE "aluno_dados_pessoais" DROP CONSTRAINT "aluno_dados_pessoais_tipoDePessoaId_fkey";

-- AlterTable
ALTER TABLE "aluno_dados_pessoais" DROP CONSTRAINT "aluno_dados_pessoais_pkey",
DROP COLUMN "id",
ALTER COLUMN "dadosDocumentosId" SET NOT NULL,
ALTER COLUMN "tipoDePessoaId" SET NOT NULL,
ADD CONSTRAINT "aluno_dados_pessoais_pkey" PRIMARY KEY ("tipoDePessoaId", "dadosDocumentosId");

-- AlterTable
ALTER TABLE "alunos_pagtos" DROP COLUMN "id";

-- AddForeignKey
ALTER TABLE "aluno_dados_pessoais" ADD CONSTRAINT "aluno_dados_pessoais_tipoDePessoaId_fkey" FOREIGN KEY ("tipoDePessoaId") REFERENCES "tipos_de_pessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "aluno_dados_pessoais" ADD CONSTRAINT "aluno_dados_pessoais_dadosDocumentosId_fkey" FOREIGN KEY ("dadosDocumentosId") REFERENCES "Dados_documentos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
