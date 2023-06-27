/*
  Warnings:

  - You are about to drop the `alunos_dados_pessoais` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_idDadosDocumentos_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_idEndereco_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_idPagto_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_idPessoa_fkey";

-- DropTable
DROP TABLE "alunos_dados_pessoais";

-- CreateTable
CREATE TABLE "aluno_endereco" (
    "id" SERIAL NOT NULL,
    "idPessoa" INTEGER NOT NULL,
    "idDadosDocumentos" INTEGER NOT NULL,

    CONSTRAINT "aluno_endereco_pkey" PRIMARY KEY ("idPessoa","idDadosDocumentos")
);

-- CreateTable
CREATE TABLE "aluno_dados_pessoais" (
    "id" SERIAL NOT NULL,
    "idPessoa" INTEGER NOT NULL,
    "idDadosDocumentos" INTEGER NOT NULL,
    "enderecoId" INTEGER,
    "pagtoMesId" INTEGER,

    CONSTRAINT "aluno_dados_pessoais_pkey" PRIMARY KEY ("idPessoa","idDadosDocumentos")
);

-- CreateTable
CREATE TABLE "alunos_pagtos" (
    "id" SERIAL NOT NULL,
    "idPessoa" INTEGER NOT NULL,
    "idPagto" INTEGER NOT NULL,

    CONSTRAINT "alunos_pagtos_pkey" PRIMARY KEY ("idPessoa","idPagto")
);

-- AddForeignKey
ALTER TABLE "aluno_endereco" ADD CONSTRAINT "aluno_endereco_idPessoa_fkey" FOREIGN KEY ("idPessoa") REFERENCES "tipos_de_pessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "aluno_endereco" ADD CONSTRAINT "aluno_endereco_idDadosDocumentos_fkey" FOREIGN KEY ("idDadosDocumentos") REFERENCES "Dados_documentos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "aluno_dados_pessoais" ADD CONSTRAINT "aluno_dados_pessoais_idPessoa_fkey" FOREIGN KEY ("idPessoa") REFERENCES "tipos_de_pessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "aluno_dados_pessoais" ADD CONSTRAINT "aluno_dados_pessoais_idDadosDocumentos_fkey" FOREIGN KEY ("idDadosDocumentos") REFERENCES "Dados_documentos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "aluno_dados_pessoais" ADD CONSTRAINT "aluno_dados_pessoais_enderecoId_fkey" FOREIGN KEY ("enderecoId") REFERENCES "enderecos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "aluno_dados_pessoais" ADD CONSTRAINT "aluno_dados_pessoais_pagtoMesId_fkey" FOREIGN KEY ("pagtoMesId") REFERENCES "pagtos_mes"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_pagtos" ADD CONSTRAINT "alunos_pagtos_idPessoa_fkey" FOREIGN KEY ("idPessoa") REFERENCES "tipos_de_pessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_pagtos" ADD CONSTRAINT "alunos_pagtos_idPagto_fkey" FOREIGN KEY ("idPagto") REFERENCES "pagtos_mes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
