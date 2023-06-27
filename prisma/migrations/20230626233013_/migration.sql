/*
  Warnings:

  - You are about to drop the column `dadosDocumentosId` on the `pessoasDadosEscolares` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "pessoasDadosEscolares" DROP CONSTRAINT "pessoasDadosEscolares_dadosDocumentosId_fkey";

-- AlterTable
ALTER TABLE "pessoasDadosEscolares" DROP COLUMN "dadosDocumentosId",
ADD COLUMN     "idDadosDocumentos" INTEGER;

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_idDadosDocumentos_fkey" FOREIGN KEY ("idDadosDocumentos") REFERENCES "dadosDocumentos"("id") ON DELETE SET NULL ON UPDATE CASCADE;
