/*
  Warnings:

  - You are about to drop the `ProfessorDadosPessorais` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "ProfessorDadosPessorais" DROP CONSTRAINT "ProfessorDadosPessorais_id_endereco_fkey";

-- DropForeignKey
ALTER TABLE "ProfessorDadosPessorais" DROP CONSTRAINT "ProfessorDadosPessorais_id_pessoa_fkey";

-- DropForeignKey
ALTER TABLE "ProfessorDadosPessorais" DROP CONSTRAINT "ProfessorDadosPessorais_id_professor_fkey";

-- DropTable
DROP TABLE "ProfessorDadosPessorais";

-- CreateTable
CREATE TABLE "professores_dados_pessoais" (
    "id" SERIAL NOT NULL,
    "id_professor" INTEGER NOT NULL,
    "id_pessoa" INTEGER NOT NULL,
    "id_endereco" INTEGER NOT NULL,

    CONSTRAINT "professores_dados_pessoais_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "responsaveis_dados_pessoais" (
    "id" SERIAL NOT NULL,
    "id_responsavel" INTEGER NOT NULL,
    "id_pessoa" INTEGER NOT NULL,

    CONSTRAINT "responsaveis_dados_pessoais_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "professores_dados_pessoais" ADD CONSTRAINT "professores_dados_pessoais_id_professor_fkey" FOREIGN KEY ("id_professor") REFERENCES "professores"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professores_dados_pessoais" ADD CONSTRAINT "professores_dados_pessoais_id_pessoa_fkey" FOREIGN KEY ("id_pessoa") REFERENCES "pessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professores_dados_pessoais" ADD CONSTRAINT "professores_dados_pessoais_id_endereco_fkey" FOREIGN KEY ("id_endereco") REFERENCES "enderecos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "responsaveis_dados_pessoais" ADD CONSTRAINT "responsaveis_dados_pessoais_id_responsavel_fkey" FOREIGN KEY ("id_responsavel") REFERENCES "responsaveis"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "responsaveis_dados_pessoais" ADD CONSTRAINT "responsaveis_dados_pessoais_id_pessoa_fkey" FOREIGN KEY ("id_pessoa") REFERENCES "pessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
