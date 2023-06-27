/*
  Warnings:

  - You are about to drop the column `data_nascimento` on the `Dados_documentos` table. All the data in the column will be lost.
  - You are about to drop the column `id_dadosDocumentos` on the `Dados_documentos` table. All the data in the column will be lost.
  - You are about to drop the column `status_cadastro` on the `Dados_documentos` table. All the data in the column will be lost.
  - You are about to drop the column `id_disciplina` on the `alunos_dados_escolares` table. All the data in the column will be lost.
  - You are about to drop the column `id_horario` on the `alunos_dados_escolares` table. All the data in the column will be lost.
  - You are about to drop the column `id_nota` on the `alunos_dados_escolares` table. All the data in the column will be lost.
  - You are about to drop the column `id_pessoa` on the `alunos_dados_escolares` table. All the data in the column will be lost.
  - You are about to drop the column `id_presenca` on the `alunos_dados_escolares` table. All the data in the column will be lost.
  - You are about to drop the column `id_turma` on the `alunos_dados_escolares` table. All the data in the column will be lost.
  - You are about to drop the column `id_dadosDocumentos` on the `alunos_dados_pessoais` table. All the data in the column will be lost.
  - You are about to drop the column `id_endereco` on the `alunos_dados_pessoais` table. All the data in the column will be lost.
  - You are about to drop the column `id_pagto_mes` on the `alunos_dados_pessoais` table. All the data in the column will be lost.
  - You are about to drop the column `id_pessoa` on the `alunos_dados_pessoais` table. All the data in the column will be lost.
  - You are about to drop the column `id_endereco` on the `enderecos` table. All the data in the column will be lost.
  - You are about to drop the column `dias_semana` on the `horarios` table. All the data in the column will be lost.
  - You are about to drop the column `hora_fim` on the `horarios` table. All the data in the column will be lost.
  - You are about to drop the column `hora_inicio` on the `horarios` table. All the data in the column will be lost.
  - You are about to drop the column `data_pagto` on the `pagtos_mes` table. All the data in the column will be lost.
  - You are about to drop the column `data_vencimento` on the `pagtos_mes` table. All the data in the column will be lost.
  - You are about to drop the column `id_pagto_mes` on the `pagtos_mes` table. All the data in the column will be lost.
  - You are about to drop the column `id_disciplina` on the `professores_dados_escolares` table. All the data in the column will be lost.
  - You are about to drop the column `id_horario` on the `professores_dados_escolares` table. All the data in the column will be lost.
  - You are about to drop the column `id_nota` on the `professores_dados_escolares` table. All the data in the column will be lost.
  - You are about to drop the column `id_pessoa` on the `professores_dados_escolares` table. All the data in the column will be lost.
  - You are about to drop the column `id_presenca` on the `professores_dados_escolares` table. All the data in the column will be lost.
  - You are about to drop the column `id_turma` on the `professores_dados_escolares` table. All the data in the column will be lost.
  - You are about to drop the column `id_pessoa` on the `tipos_de_pessoas` table. All the data in the column will be lost.
  - Added the required column `dataNascimento` to the `Dados_documentos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idDadosDocumentos` to the `Dados_documentos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `statusCadastro` to the `Dados_documentos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idDisciplina` to the `alunos_dados_escolares` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idHorario` to the `alunos_dados_escolares` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idPessoa` to the `alunos_dados_escolares` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idTurma` to the `alunos_dados_escolares` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idEndereco` to the `enderecos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `diasSemana` to the `horarios` table without a default value. This is not possible if the table is not empty.
  - Added the required column `horaFim` to the `horarios` table without a default value. This is not possible if the table is not empty.
  - Added the required column `horaInicio` to the `horarios` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dataVencimento` to the `pagtos_mes` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idPagtoMes` to the `pagtos_mes` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idDisciplina` to the `professores_dados_escolares` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idHorario` to the `professores_dados_escolares` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idPessoa` to the `professores_dados_escolares` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idTurma` to the `professores_dados_escolares` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idPessoa` to the `tipos_de_pessoas` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "alunos_dados_escolares" DROP CONSTRAINT "alunos_dados_escolares_id_disciplina_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_escolares" DROP CONSTRAINT "alunos_dados_escolares_id_horario_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_escolares" DROP CONSTRAINT "alunos_dados_escolares_id_nota_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_escolares" DROP CONSTRAINT "alunos_dados_escolares_id_pessoa_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_escolares" DROP CONSTRAINT "alunos_dados_escolares_id_presenca_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_escolares" DROP CONSTRAINT "alunos_dados_escolares_id_turma_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_id_dadosDocumentos_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_id_endereco_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_id_pagto_mes_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_id_pessoa_fkey";

-- DropForeignKey
ALTER TABLE "professores_dados_escolares" DROP CONSTRAINT "professores_dados_escolares_id_disciplina_fkey";

-- DropForeignKey
ALTER TABLE "professores_dados_escolares" DROP CONSTRAINT "professores_dados_escolares_id_horario_fkey";

-- DropForeignKey
ALTER TABLE "professores_dados_escolares" DROP CONSTRAINT "professores_dados_escolares_id_nota_fkey";

-- DropForeignKey
ALTER TABLE "professores_dados_escolares" DROP CONSTRAINT "professores_dados_escolares_id_pessoa_fkey";

-- DropForeignKey
ALTER TABLE "professores_dados_escolares" DROP CONSTRAINT "professores_dados_escolares_id_presenca_fkey";

-- DropForeignKey
ALTER TABLE "professores_dados_escolares" DROP CONSTRAINT "professores_dados_escolares_id_turma_fkey";

-- AlterTable
ALTER TABLE "Dados_documentos" DROP COLUMN "data_nascimento",
DROP COLUMN "id_dadosDocumentos",
DROP COLUMN "status_cadastro",
ADD COLUMN     "dataNascimento" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "idDadosDocumentos" INTEGER NOT NULL,
ADD COLUMN     "statusCadastro" BOOLEAN NOT NULL;

-- AlterTable
ALTER TABLE "alunos_dados_escolares" DROP COLUMN "id_disciplina",
DROP COLUMN "id_horario",
DROP COLUMN "id_nota",
DROP COLUMN "id_pessoa",
DROP COLUMN "id_presenca",
DROP COLUMN "id_turma",
ADD COLUMN     "idDisciplina" INTEGER NOT NULL,
ADD COLUMN     "idHorario" INTEGER NOT NULL,
ADD COLUMN     "idNota" INTEGER,
ADD COLUMN     "idPessoa" INTEGER NOT NULL,
ADD COLUMN     "idPresenca" INTEGER,
ADD COLUMN     "idTurma" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "alunos_dados_pessoais" DROP COLUMN "id_dadosDocumentos",
DROP COLUMN "id_endereco",
DROP COLUMN "id_pagto_mes",
DROP COLUMN "id_pessoa",
ADD COLUMN     "idDadosDocumentos" INTEGER,
ADD COLUMN     "idEndereco" INTEGER,
ADD COLUMN     "idPagtoMes" INTEGER,
ADD COLUMN     "idPessoa" INTEGER;

-- AlterTable
ALTER TABLE "enderecos" DROP COLUMN "id_endereco",
ADD COLUMN     "idEndereco" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "horarios" DROP COLUMN "dias_semana",
DROP COLUMN "hora_fim",
DROP COLUMN "hora_inicio",
ADD COLUMN     "diasSemana" TEXT NOT NULL,
ADD COLUMN     "horaFim" TEXT NOT NULL,
ADD COLUMN     "horaInicio" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "pagtos_mes" DROP COLUMN "data_pagto",
DROP COLUMN "data_vencimento",
DROP COLUMN "id_pagto_mes",
ADD COLUMN     "dataPagto" TEXT,
ADD COLUMN     "dataVencimento" TEXT NOT NULL,
ADD COLUMN     "idPagtoMes" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "professores_dados_escolares" DROP COLUMN "id_disciplina",
DROP COLUMN "id_horario",
DROP COLUMN "id_nota",
DROP COLUMN "id_pessoa",
DROP COLUMN "id_presenca",
DROP COLUMN "id_turma",
ADD COLUMN     "idDisciplina" INTEGER NOT NULL,
ADD COLUMN     "idHorario" INTEGER NOT NULL,
ADD COLUMN     "idNota" INTEGER,
ADD COLUMN     "idPessoa" INTEGER NOT NULL,
ADD COLUMN     "idPresenca" INTEGER,
ADD COLUMN     "idTurma" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "tipos_de_pessoas" DROP COLUMN "id_pessoa",
ADD COLUMN     "idPessoa" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_idPessoa_fkey" FOREIGN KEY ("idPessoa") REFERENCES "tipos_de_pessoas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_idDadosDocumentos_fkey" FOREIGN KEY ("idDadosDocumentos") REFERENCES "Dados_documentos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_idEndereco_fkey" FOREIGN KEY ("idEndereco") REFERENCES "enderecos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_idPagtoMes_fkey" FOREIGN KEY ("idPagtoMes") REFERENCES "pagtos_mes"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_escolares" ADD CONSTRAINT "alunos_dados_escolares_idPessoa_fkey" FOREIGN KEY ("idPessoa") REFERENCES "tipos_de_pessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_escolares" ADD CONSTRAINT "alunos_dados_escolares_idDisciplina_fkey" FOREIGN KEY ("idDisciplina") REFERENCES "disciplinas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_escolares" ADD CONSTRAINT "alunos_dados_escolares_idTurma_fkey" FOREIGN KEY ("idTurma") REFERENCES "turmas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_escolares" ADD CONSTRAINT "alunos_dados_escolares_idHorario_fkey" FOREIGN KEY ("idHorario") REFERENCES "horarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_escolares" ADD CONSTRAINT "alunos_dados_escolares_idPresenca_fkey" FOREIGN KEY ("idPresenca") REFERENCES "presencas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_escolares" ADD CONSTRAINT "alunos_dados_escolares_idNota_fkey" FOREIGN KEY ("idNota") REFERENCES "notas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professores_dados_escolares" ADD CONSTRAINT "professores_dados_escolares_idPessoa_fkey" FOREIGN KEY ("idPessoa") REFERENCES "tipos_de_pessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professores_dados_escolares" ADD CONSTRAINT "professores_dados_escolares_idDisciplina_fkey" FOREIGN KEY ("idDisciplina") REFERENCES "disciplinas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professores_dados_escolares" ADD CONSTRAINT "professores_dados_escolares_idTurma_fkey" FOREIGN KEY ("idTurma") REFERENCES "turmas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professores_dados_escolares" ADD CONSTRAINT "professores_dados_escolares_idHorario_fkey" FOREIGN KEY ("idHorario") REFERENCES "horarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professores_dados_escolares" ADD CONSTRAINT "professores_dados_escolares_idPresenca_fkey" FOREIGN KEY ("idPresenca") REFERENCES "presencas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professores_dados_escolares" ADD CONSTRAINT "professores_dados_escolares_idNota_fkey" FOREIGN KEY ("idNota") REFERENCES "notas"("id") ON DELETE SET NULL ON UPDATE CASCADE;
