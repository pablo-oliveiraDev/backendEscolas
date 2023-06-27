/*
  Warnings:

  - You are about to drop the column `email` on the `professores` table. All the data in the column will be lost.
  - You are about to drop the column `nome` on the `professores` table. All the data in the column will be lost.
  - You are about to drop the column `tel` on the `professores` table. All the data in the column will be lost.
  - You are about to drop the column `nome` on the `responsaveis` table. All the data in the column will be lost.
  - You are about to drop the column `sobrenome` on the `responsaveis` table. All the data in the column will be lost.
  - You are about to drop the column `tel` on the `responsaveis` table. All the data in the column will be lost.
  - You are about to drop the column `tipo_pessoa` on the `tipos_pessoas` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "professores" DROP COLUMN "email",
DROP COLUMN "nome",
DROP COLUMN "tel";

-- AlterTable
ALTER TABLE "responsaveis" DROP COLUMN "nome",
DROP COLUMN "sobrenome",
DROP COLUMN "tel";

-- AlterTable
ALTER TABLE "tipos_pessoas" DROP COLUMN "tipo_pessoa";

-- CreateTable
CREATE TABLE "Aluno_pessoa" (
    "id" SERIAL NOT NULL,
    "id_aluno" INTEGER NOT NULL,
    "id_pessoa" INTEGER NOT NULL,

    CONSTRAINT "Aluno_pessoa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pessoa_responsavel" (
    "id" SERIAL NOT NULL,
    "id_aluno" INTEGER NOT NULL,
    "id_responsavel" INTEGER,

    CONSTRAINT "pessoa_responsavel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pessoa_pagto_mes" (
    "id" SERIAL NOT NULL,
    "id_aluno" INTEGER NOT NULL,
    "id_pagto_mes" INTEGER,

    CONSTRAINT "pessoa_pagto_mes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pessoa_endereco" (
    "id" SERIAL NOT NULL,
    "id_aluno" INTEGER NOT NULL,
    "id_endereco" INTEGER NOT NULL,

    CONSTRAINT "pessoa_endereco_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Aluno_pessoa" ADD CONSTRAINT "Aluno_pessoa_id_aluno_fkey" FOREIGN KEY ("id_aluno") REFERENCES "tipos_pessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Aluno_pessoa" ADD CONSTRAINT "Aluno_pessoa_id_pessoa_fkey" FOREIGN KEY ("id_pessoa") REFERENCES "alunos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoa_responsavel" ADD CONSTRAINT "pessoa_responsavel_id_aluno_fkey" FOREIGN KEY ("id_aluno") REFERENCES "tipos_pessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoa_responsavel" ADD CONSTRAINT "pessoa_responsavel_id_responsavel_fkey" FOREIGN KEY ("id_responsavel") REFERENCES "responsaveis"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoa_pagto_mes" ADD CONSTRAINT "pessoa_pagto_mes_id_aluno_fkey" FOREIGN KEY ("id_aluno") REFERENCES "tipos_pessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoa_pagto_mes" ADD CONSTRAINT "pessoa_pagto_mes_id_pagto_mes_fkey" FOREIGN KEY ("id_pagto_mes") REFERENCES "pagtos_mes"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoa_endereco" ADD CONSTRAINT "pessoa_endereco_id_aluno_fkey" FOREIGN KEY ("id_aluno") REFERENCES "tipos_pessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoa_endereco" ADD CONSTRAINT "pessoa_endereco_id_endereco_fkey" FOREIGN KEY ("id_endereco") REFERENCES "enderecos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
