/*
  Warnings:

  - You are about to drop the column `idPessoa` on the `pessoasDadosPessoais` table. All the data in the column will be lost.
  - Added the required column `tipoDePessoaId` to the `pessoasDadosPessoais` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "pessoasDadosPessoais" DROP CONSTRAINT "pessoasDadosPessoais_idPessoa_fkey";

-- AlterTable
ALTER TABLE "pessoasDadosPessoais" DROP COLUMN "idPessoa",
ADD COLUMN     "tipoDePessoaId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "pessoasDadosPessoais" ADD CONSTRAINT "pessoasDadosPessoais_tipoDePessoaId_fkey" FOREIGN KEY ("tipoDePessoaId") REFERENCES "tipoDePessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
