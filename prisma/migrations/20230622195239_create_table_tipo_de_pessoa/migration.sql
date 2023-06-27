/*
  Warnings:

  - You are about to drop the column `id_aluno` on the `alunos_dados_escolares` table. All the data in the column will be lost.
  - You are about to drop the column `id_professor` on the `alunos_dados_escolares` table. All the data in the column will be lost.
  - You are about to drop the column `id_aluno` on the `alunos_dados_pessoais` table. All the data in the column will be lost.
  - You are about to drop the column `id_responsavel` on the `alunos_dados_pessoais` table. All the data in the column will be lost.
  - You are about to drop the column `id_professor` on the `professores_dados_escolares` table. All the data in the column will be lost.
  - You are about to drop the `alunos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `pessoas` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `professores` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `professores_dados_pessoais` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `responsaveis` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `responsaveis_dados_pessoais` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `id_pessoa` to the `alunos_dados_escolares` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_dadosDocumentos` to the `alunos_dados_pessoais` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_pessoa` to the `professores_dados_escolares` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "alunos_dados_escolares" DROP CONSTRAINT "alunos_dados_escolares_id_aluno_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_escolares" DROP CONSTRAINT "alunos_dados_escolares_id_professor_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_id_aluno_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_id_pessoa_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_id_responsavel_fkey";

-- DropForeignKey
ALTER TABLE "professores_dados_escolares" DROP CONSTRAINT "professores_dados_escolares_id_professor_fkey";

-- DropForeignKey
ALTER TABLE "professores_dados_pessoais" DROP CONSTRAINT "professores_dados_pessoais_id_endereco_fkey";

-- DropForeignKey
ALTER TABLE "professores_dados_pessoais" DROP CONSTRAINT "professores_dados_pessoais_id_pessoa_fkey";

-- DropForeignKey
ALTER TABLE "professores_dados_pessoais" DROP CONSTRAINT "professores_dados_pessoais_id_professor_fkey";

-- DropForeignKey
ALTER TABLE "responsaveis_dados_pessoais" DROP CONSTRAINT "responsaveis_dados_pessoais_id_pessoa_fkey";

-- DropForeignKey
ALTER TABLE "responsaveis_dados_pessoais" DROP CONSTRAINT "responsaveis_dados_pessoais_id_responsavel_fkey";

-- AlterTable
ALTER TABLE "alunos_dados_escolares" DROP COLUMN "id_aluno",
DROP COLUMN "id_professor",
ADD COLUMN     "id_pessoa" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "alunos_dados_pessoais" DROP COLUMN "id_aluno",
DROP COLUMN "id_responsavel",
ADD COLUMN     "id_dadosDocumentos" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "professores_dados_escolares" DROP COLUMN "id_professor",
ADD COLUMN     "id_pessoa" INTEGER NOT NULL;

-- DropTable
DROP TABLE "alunos";

-- DropTable
DROP TABLE "pessoas";

-- DropTable
DROP TABLE "professores";

-- DropTable
DROP TABLE "professores_dados_pessoais";

-- DropTable
DROP TABLE "responsaveis";

-- DropTable
DROP TABLE "responsaveis_dados_pessoais";

-- CreateTable
CREATE TABLE "tipos_de_pessoas" (
    "id" SERIAL NOT NULL,
    "pessoa" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "tipos_de_pessoas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Dados_documentos" (
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

    CONSTRAINT "Dados_documentos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "especialidades" (
    "id" SERIAL NOT NULL,
    "especialidade" TEXT NOT NULL,

    CONSTRAINT "especialidades_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_id_pessoa_fkey" FOREIGN KEY ("id_pessoa") REFERENCES "tipos_de_pessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_id_dadosDocumentos_fkey" FOREIGN KEY ("id_dadosDocumentos") REFERENCES "Dados_documentos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_escolares" ADD CONSTRAINT "alunos_dados_escolares_id_pessoa_fkey" FOREIGN KEY ("id_pessoa") REFERENCES "tipos_de_pessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professores_dados_escolares" ADD CONSTRAINT "professores_dados_escolares_id_pessoa_fkey" FOREIGN KEY ("id_pessoa") REFERENCES "tipos_de_pessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
