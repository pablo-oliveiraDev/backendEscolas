/*
  Warnings:

  - You are about to drop the `Aluno_pessoa` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `pessoa_endereco` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `pessoa_pagto_mes` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `pessoa_responsavel` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Aluno_pessoa" DROP CONSTRAINT "Aluno_pessoa_id_aluno_fkey";

-- DropForeignKey
ALTER TABLE "Aluno_pessoa" DROP CONSTRAINT "Aluno_pessoa_id_pessoa_fkey";

-- DropForeignKey
ALTER TABLE "pessoa_endereco" DROP CONSTRAINT "pessoa_endereco_id_aluno_fkey";

-- DropForeignKey
ALTER TABLE "pessoa_endereco" DROP CONSTRAINT "pessoa_endereco_id_endereco_fkey";

-- DropForeignKey
ALTER TABLE "pessoa_pagto_mes" DROP CONSTRAINT "pessoa_pagto_mes_id_aluno_fkey";

-- DropForeignKey
ALTER TABLE "pessoa_pagto_mes" DROP CONSTRAINT "pessoa_pagto_mes_id_pagto_mes_fkey";

-- DropForeignKey
ALTER TABLE "pessoa_responsavel" DROP CONSTRAINT "pessoa_responsavel_id_aluno_fkey";

-- DropForeignKey
ALTER TABLE "pessoa_responsavel" DROP CONSTRAINT "pessoa_responsavel_id_responsavel_fkey";

-- DropTable
DROP TABLE "Aluno_pessoa";

-- DropTable
DROP TABLE "pessoa_endereco";

-- DropTable
DROP TABLE "pessoa_pagto_mes";

-- DropTable
DROP TABLE "pessoa_responsavel";

-- CreateTable
CREATE TABLE "alunos_dados_pessoais" (
    "id" SERIAL NOT NULL,
    "id_aluno" INTEGER NOT NULL,
    "id_pessoa" INTEGER NOT NULL,
    "id_endereco" INTEGER NOT NULL,
    "id_responsavel" INTEGER,
    "id_pagto_mes" INTEGER,

    CONSTRAINT "alunos_dados_pessoais_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_id_aluno_fkey" FOREIGN KEY ("id_aluno") REFERENCES "tipos_pessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_id_pessoa_fkey" FOREIGN KEY ("id_pessoa") REFERENCES "alunos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_id_endereco_fkey" FOREIGN KEY ("id_endereco") REFERENCES "enderecos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_id_responsavel_fkey" FOREIGN KEY ("id_responsavel") REFERENCES "responsaveis"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_id_pagto_mes_fkey" FOREIGN KEY ("id_pagto_mes") REFERENCES "pagtos_mes"("id") ON DELETE SET NULL ON UPDATE CASCADE;
