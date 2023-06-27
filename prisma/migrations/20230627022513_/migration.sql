/*
  Warnings:

  - The primary key for the `pessoasDadosEscolares` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "pessoasDadosEscolares" DROP CONSTRAINT "pessoasDadosEscolares_idDadosDocumentos_fkey";

-- AlterTable
ALTER TABLE "pessoasDadosEscolares" DROP CONSTRAINT "pessoasDadosEscolares_pkey",
ALTER COLUMN "idDadosDocumentos" DROP NOT NULL,
ADD CONSTRAINT "pessoasDadosEscolares_pkey" PRIMARY KEY ("id", "tipoDePessoaId");

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_idDadosDocumentos_fkey" FOREIGN KEY ("idDadosDocumentos") REFERENCES "dadosDocumentos"("id") ON DELETE SET NULL ON UPDATE CASCADE;
