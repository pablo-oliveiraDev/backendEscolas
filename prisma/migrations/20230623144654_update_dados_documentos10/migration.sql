/*
  Warnings:

  - You are about to drop the `Dados_documentos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `aluno_dados_pessoais` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `aluno_endereco` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `alunos_dados_escolares` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `pagtos_mes` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `professores_dados_escolares` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `tipos_de_pessoas` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "aluno_dados_pessoais" DROP CONSTRAINT "aluno_dados_pessoais_dadosDocumentosId_fkey";

-- DropForeignKey
ALTER TABLE "aluno_dados_pessoais" DROP CONSTRAINT "aluno_dados_pessoais_tipoDePessoaId_fkey";

-- DropForeignKey
ALTER TABLE "aluno_endereco" DROP CONSTRAINT "aluno_endereco_idEndereco_fkey";

-- DropForeignKey
ALTER TABLE "aluno_endereco" DROP CONSTRAINT "aluno_endereco_idPessoa_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_escolares" DROP CONSTRAINT "alunos_dados_escolares_idDisciplina_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_escolares" DROP CONSTRAINT "alunos_dados_escolares_idHorario_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_escolares" DROP CONSTRAINT "alunos_dados_escolares_idNota_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_escolares" DROP CONSTRAINT "alunos_dados_escolares_idPessoa_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_escolares" DROP CONSTRAINT "alunos_dados_escolares_idPresenca_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_escolares" DROP CONSTRAINT "alunos_dados_escolares_idTurma_fkey";

-- DropForeignKey
ALTER TABLE "alunos_pagtos" DROP CONSTRAINT "alunos_pagtos_idPagto_fkey";

-- DropForeignKey
ALTER TABLE "alunos_pagtos" DROP CONSTRAINT "alunos_pagtos_idPessoa_fkey";

-- DropForeignKey
ALTER TABLE "professores_dados_escolares" DROP CONSTRAINT "professores_dados_escolares_idDisciplina_fkey";

-- DropForeignKey
ALTER TABLE "professores_dados_escolares" DROP CONSTRAINT "professores_dados_escolares_idHorario_fkey";

-- DropForeignKey
ALTER TABLE "professores_dados_escolares" DROP CONSTRAINT "professores_dados_escolares_idNota_fkey";

-- DropForeignKey
ALTER TABLE "professores_dados_escolares" DROP CONSTRAINT "professores_dados_escolares_idPessoa_fkey";

-- DropForeignKey
ALTER TABLE "professores_dados_escolares" DROP CONSTRAINT "professores_dados_escolares_idPresenca_fkey";

-- DropForeignKey
ALTER TABLE "professores_dados_escolares" DROP CONSTRAINT "professores_dados_escolares_idTurma_fkey";

-- DropTable
DROP TABLE "Dados_documentos";

-- DropTable
DROP TABLE "aluno_dados_pessoais";

-- DropTable
DROP TABLE "aluno_endereco";

-- DropTable
DROP TABLE "alunos_dados_escolares";

-- DropTable
DROP TABLE "pagtos_mes";

-- DropTable
DROP TABLE "professores_dados_escolares";

-- DropTable
DROP TABLE "tipos_de_pessoas";

-- CreateTable
CREATE TABLE "tipoDePessoas" (
    "id" SERIAL NOT NULL,
    "pessoa" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "tipoDePessoas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dadosDocumentos" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "Sobrenome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "Cpf" TEXT NOT NULL,
    "Rg" TEXT NOT NULL,
    "idade" INTEGER NOT NULL,
    "dataNascimento" TIMESTAMP(3) NOT NULL,
    "statusCadastro" BOOLEAN NOT NULL,
    "tel" BIGINT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3) NOT NULL,
    "tipoDePessoaId" INTEGER NOT NULL,

    CONSTRAINT "dadosDocumentos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pagtosMes" (
    "id" SERIAL NOT NULL,
    "valor" DECIMAL(10,2) NOT NULL,
    "dataPagto" TEXT,
    "dataVencimento" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "pagtosMes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "alunoEndereco" (
    "id" SERIAL NOT NULL,
    "idPessoa" INTEGER,
    "idEndereco" INTEGER,

    CONSTRAINT "alunoEndereco_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "alunoDadosPessoais" (
    "id" SERIAL NOT NULL,
    "tipoDePessoaId" INTEGER,
    "dadosDocumentosId" INTEGER,

    CONSTRAINT "alunoDadosPessoais_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "alunoDadosEscolares" (
    "id" SERIAL NOT NULL,
    "idPessoa" INTEGER NOT NULL,
    "idDisciplina" INTEGER NOT NULL,
    "idTurma" INTEGER NOT NULL,
    "idHorario" INTEGER NOT NULL,
    "idPresenca" INTEGER,
    "idNota" INTEGER,

    CONSTRAINT "alunoDadosEscolares_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "professorDadosEscolares" (
    "id" SERIAL NOT NULL,
    "idPessoa" INTEGER NOT NULL,
    "idDisciplina" INTEGER NOT NULL,
    "idTurma" INTEGER NOT NULL,
    "idHorario" INTEGER NOT NULL,
    "idPresenca" INTEGER,
    "idNota" INTEGER,

    CONSTRAINT "professorDadosEscolares_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "alunoEndereco" ADD CONSTRAINT "alunoEndereco_idPessoa_fkey" FOREIGN KEY ("idPessoa") REFERENCES "tipoDePessoas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunoEndereco" ADD CONSTRAINT "alunoEndereco_idEndereco_fkey" FOREIGN KEY ("idEndereco") REFERENCES "enderecos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunoDadosPessoais" ADD CONSTRAINT "alunoDadosPessoais_tipoDePessoaId_fkey" FOREIGN KEY ("tipoDePessoaId") REFERENCES "tipoDePessoas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunoDadosPessoais" ADD CONSTRAINT "alunoDadosPessoais_dadosDocumentosId_fkey" FOREIGN KEY ("dadosDocumentosId") REFERENCES "dadosDocumentos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_pagtos" ADD CONSTRAINT "alunos_pagtos_idPessoa_fkey" FOREIGN KEY ("idPessoa") REFERENCES "tipoDePessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_pagtos" ADD CONSTRAINT "alunos_pagtos_idPagto_fkey" FOREIGN KEY ("idPagto") REFERENCES "pagtosMes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunoDadosEscolares" ADD CONSTRAINT "alunoDadosEscolares_idPessoa_fkey" FOREIGN KEY ("idPessoa") REFERENCES "tipoDePessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunoDadosEscolares" ADD CONSTRAINT "alunoDadosEscolares_idDisciplina_fkey" FOREIGN KEY ("idDisciplina") REFERENCES "disciplinas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunoDadosEscolares" ADD CONSTRAINT "alunoDadosEscolares_idTurma_fkey" FOREIGN KEY ("idTurma") REFERENCES "turmas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunoDadosEscolares" ADD CONSTRAINT "alunoDadosEscolares_idHorario_fkey" FOREIGN KEY ("idHorario") REFERENCES "horarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunoDadosEscolares" ADD CONSTRAINT "alunoDadosEscolares_idPresenca_fkey" FOREIGN KEY ("idPresenca") REFERENCES "presencas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunoDadosEscolares" ADD CONSTRAINT "alunoDadosEscolares_idNota_fkey" FOREIGN KEY ("idNota") REFERENCES "notas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professorDadosEscolares" ADD CONSTRAINT "professorDadosEscolares_idPessoa_fkey" FOREIGN KEY ("idPessoa") REFERENCES "tipoDePessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professorDadosEscolares" ADD CONSTRAINT "professorDadosEscolares_idDisciplina_fkey" FOREIGN KEY ("idDisciplina") REFERENCES "disciplinas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professorDadosEscolares" ADD CONSTRAINT "professorDadosEscolares_idTurma_fkey" FOREIGN KEY ("idTurma") REFERENCES "turmas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professorDadosEscolares" ADD CONSTRAINT "professorDadosEscolares_idHorario_fkey" FOREIGN KEY ("idHorario") REFERENCES "horarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professorDadosEscolares" ADD CONSTRAINT "professorDadosEscolares_idPresenca_fkey" FOREIGN KEY ("idPresenca") REFERENCES "presencas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professorDadosEscolares" ADD CONSTRAINT "professorDadosEscolares_idNota_fkey" FOREIGN KEY ("idNota") REFERENCES "notas"("id") ON DELETE SET NULL ON UPDATE CASCADE;
