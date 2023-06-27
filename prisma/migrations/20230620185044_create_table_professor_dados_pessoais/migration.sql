/*
  Warnings:

  - You are about to drop the column `Cpf` on the `alunos` table. All the data in the column will be lost.
  - You are about to drop the column `Rg` on the `alunos` table. All the data in the column will be lost.
  - You are about to drop the column `Sobrenome` on the `alunos` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `alunos` table. All the data in the column will be lost.
  - You are about to drop the column `data_nascimento` on the `alunos` table. All the data in the column will be lost.
  - You are about to drop the column `deleted_at` on the `alunos` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `alunos` table. All the data in the column will be lost.
  - You are about to drop the column `idade` on the `alunos` table. All the data in the column will be lost.
  - You are about to drop the column `nome` on the `alunos` table. All the data in the column will be lost.
  - You are about to drop the column `status_cadastro` on the `alunos` table. All the data in the column will be lost.
  - You are about to drop the column `tel` on the `alunos` table. All the data in the column will be lost.
  - You are about to drop the `tipos_pessoas` table. If the table is not empty, all the data it contains will be lost.
  - Made the column `id_pagto_mes` on table `alunos_dados_pessoais` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_id_aluno_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_id_pagto_mes_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_id_pessoa_fkey";

-- AlterTable
ALTER TABLE "alunos" DROP COLUMN "Cpf",
DROP COLUMN "Rg",
DROP COLUMN "Sobrenome",
DROP COLUMN "created_at",
DROP COLUMN "data_nascimento",
DROP COLUMN "deleted_at",
DROP COLUMN "email",
DROP COLUMN "idade",
DROP COLUMN "nome",
DROP COLUMN "status_cadastro",
DROP COLUMN "tel";

-- AlterTable
ALTER TABLE "alunos_dados_pessoais" ALTER COLUMN "id_pagto_mes" SET NOT NULL;

-- DropTable
DROP TABLE "tipos_pessoas";

-- CreateTable
CREATE TABLE "pessoas" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "Sobrenome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "Cpf" TEXT NOT NULL,
    "Rg" TEXT NOT NULL,
    "idade" INTEGER NOT NULL,
    "data_nascimento" TIMESTAMP(3) NOT NULL,
    "status_cadastro" BOOLEAN NOT NULL,
    "tel" BIGINT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "pessoas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProfessorDadosPessorais" (
    "id" SERIAL NOT NULL,
    "id_professor" INTEGER NOT NULL,
    "id_pessoa" INTEGER NOT NULL,
    "id_endereco" INTEGER NOT NULL,

    CONSTRAINT "ProfessorDadosPessorais_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_id_aluno_fkey" FOREIGN KEY ("id_aluno") REFERENCES "alunos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_id_pessoa_fkey" FOREIGN KEY ("id_pessoa") REFERENCES "pessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_id_pagto_mes_fkey" FOREIGN KEY ("id_pagto_mes") REFERENCES "pagtos_mes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProfessorDadosPessorais" ADD CONSTRAINT "ProfessorDadosPessorais_id_professor_fkey" FOREIGN KEY ("id_professor") REFERENCES "professores"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProfessorDadosPessorais" ADD CONSTRAINT "ProfessorDadosPessorais_id_pessoa_fkey" FOREIGN KEY ("id_pessoa") REFERENCES "pessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProfessorDadosPessorais" ADD CONSTRAINT "ProfessorDadosPessorais_id_endereco_fkey" FOREIGN KEY ("id_endereco") REFERENCES "enderecos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
