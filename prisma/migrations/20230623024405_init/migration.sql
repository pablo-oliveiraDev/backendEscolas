/*
  Warnings:

  - The primary key for the `alunos_dados_pessoais` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Made the column `idDadosDocumentos` on table `alunos_dados_pessoais` required. This step will fail if there are existing NULL values in that column.
  - Made the column `idEndereco` on table `alunos_dados_pessoais` required. This step will fail if there are existing NULL values in that column.
  - Made the column `idPessoa` on table `alunos_dados_pessoais` required. This step will fail if there are existing NULL values in that column.
  - Made the column `idPagto` on table `alunos_dados_pessoais` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_idDadosDocumentos_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_idEndereco_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_idPagto_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_idPessoa_fkey";

-- AlterTable
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_pkey",
ALTER COLUMN "idDadosDocumentos" SET NOT NULL,
ALTER COLUMN "idEndereco" SET NOT NULL,
ALTER COLUMN "idPessoa" SET NOT NULL,
ALTER COLUMN "idPagto" SET NOT NULL,
ADD CONSTRAINT "alunos_dados_pessoais_pkey" PRIMARY KEY ("idPessoa", "idDadosDocumentos", "idEndereco", "idPagto");

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_idPessoa_fkey" FOREIGN KEY ("idPessoa") REFERENCES "tipos_de_pessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_idDadosDocumentos_fkey" FOREIGN KEY ("idDadosDocumentos") REFERENCES "Dados_documentos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_idEndereco_fkey" FOREIGN KEY ("idEndereco") REFERENCES "enderecos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_idPagto_fkey" FOREIGN KEY ("idPagto") REFERENCES "pagtos_mes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
