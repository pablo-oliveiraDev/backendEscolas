/*
  Warnings:

  - Made the column `id_aluno` on table `alunos_dados_pessoais` required. This step will fail if there are existing NULL values in that column.
  - Made the column `id_pessoa` on table `alunos_dados_pessoais` required. This step will fail if there are existing NULL values in that column.
  - Made the column `id_endereco` on table `alunos_dados_pessoais` required. This step will fail if there are existing NULL values in that column.
  - Made the column `id_pagto_mes` on table `alunos_dados_pessoais` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_id_aluno_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_id_endereco_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_id_pagto_mes_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_id_pessoa_fkey";

-- AlterTable
ALTER TABLE "alunos_dados_pessoais" ALTER COLUMN "id_aluno" SET NOT NULL,
ALTER COLUMN "id_aluno" DROP DEFAULT,
ALTER COLUMN "id_pessoa" SET NOT NULL,
ALTER COLUMN "id_pessoa" DROP DEFAULT,
ALTER COLUMN "id_endereco" SET NOT NULL,
ALTER COLUMN "id_endereco" DROP DEFAULT,
ALTER COLUMN "id_responsavel" DROP DEFAULT,
ALTER COLUMN "id_pagto_mes" SET NOT NULL,
ALTER COLUMN "id_pagto_mes" DROP DEFAULT;
DROP SEQUENCE "alunos_dados_pessoais_id_aluno_seq";
DROP SEQUENCE "alunos_dados_pessoais_id_pessoa_seq";
DROP SEQUENCE "alunos_dados_pessoais_id_endereco_seq";
DROP SEQUENCE "alunos_dados_pessoais_id_responsavel_seq";
DROP SEQUENCE "alunos_dados_pessoais_id_pagto_mes_seq";

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_id_aluno_fkey" FOREIGN KEY ("id_aluno") REFERENCES "alunos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_id_pessoa_fkey" FOREIGN KEY ("id_pessoa") REFERENCES "pessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_id_endereco_fkey" FOREIGN KEY ("id_endereco") REFERENCES "enderecos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_id_pagto_mes_fkey" FOREIGN KEY ("id_pagto_mes") REFERENCES "pagtos_mes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
