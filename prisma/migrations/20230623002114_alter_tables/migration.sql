/*
  Warnings:

  - You are about to drop the column `idPagtoMes` on the `alunos_dados_pessoais` table. All the data in the column will be lost.
  - You are about to drop the column `idPagtoMes` on the `pagtos_mes` table. All the data in the column will be lost.
  - Added the required column `idPagto` to the `pagtos_mes` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_idPagtoMes_fkey";

-- AlterTable
ALTER TABLE "alunos_dados_pessoais" DROP COLUMN "idPagtoMes",
ADD COLUMN     "idPagto" INTEGER;

-- AlterTable
ALTER TABLE "pagtos_mes" DROP COLUMN "idPagtoMes",
ADD COLUMN     "idPagto" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_idPagto_fkey" FOREIGN KEY ("idPagto") REFERENCES "pagtos_mes"("id") ON DELETE SET NULL ON UPDATE CASCADE;
