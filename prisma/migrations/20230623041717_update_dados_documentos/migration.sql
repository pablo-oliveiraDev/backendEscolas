/*
  Warnings:

  - You are about to drop the column `idDadosDocumentos` on the `Dados_documentos` table. All the data in the column will be lost.
  - You are about to drop the column `idPagto` on the `pagtos_mes` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Dados_documentos" DROP COLUMN "idDadosDocumentos";

-- AlterTable
ALTER TABLE "pagtos_mes" DROP COLUMN "idPagto";
