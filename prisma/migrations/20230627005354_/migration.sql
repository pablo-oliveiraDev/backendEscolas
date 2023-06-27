/*
  Warnings:

  - The primary key for the `pessoasDadosEscolares` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the `PessoaDados` table. If the table is not empty, all the data it contains will be lost.
  - Made the column `tipoDePessoaId` on table `pessoasDadosEscolares` required. This step will fail if there are existing NULL values in that column.
  - Made the column `idEndereco` on table `pessoasDadosEscolares` required. This step will fail if there are existing NULL values in that column.
  - Made the column `idDadosDocumentos` on table `pessoasDadosEscolares` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "PessoaDados" DROP CONSTRAINT "PessoaDados_idEndereco_fkey";

-- DropForeignKey
ALTER TABLE "PessoaDados" DROP CONSTRAINT "PessoaDados_tipoDePessoaId_fkey";

-- DropForeignKey
ALTER TABLE "pessoasDadosEscolares" DROP CONSTRAINT "pessoasDadosEscolares_idDadosDocumentos_fkey";

-- DropForeignKey
ALTER TABLE "pessoasDadosEscolares" DROP CONSTRAINT "pessoasDadosEscolares_idEndereco_fkey";

-- DropForeignKey
ALTER TABLE "pessoasDadosEscolares" DROP CONSTRAINT "pessoasDadosEscolares_tipoDePessoaId_fkey";

-- AlterTable
ALTER TABLE "pessoasDadosEscolares" DROP CONSTRAINT "pessoasDadosEscolares_pkey",
ALTER COLUMN "tipoDePessoaId" SET NOT NULL,
ALTER COLUMN "idEndereco" SET NOT NULL,
ALTER COLUMN "idDadosDocumentos" SET NOT NULL,
ADD CONSTRAINT "pessoasDadosEscolares_pkey" PRIMARY KEY ("id", "tipoDePessoaId", "idDadosDocumentos");

-- DropTable
DROP TABLE "PessoaDados";

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_tipoDePessoaId_fkey" FOREIGN KEY ("tipoDePessoaId") REFERENCES "tipoDePessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_idEndereco_fkey" FOREIGN KEY ("idEndereco") REFERENCES "enderecos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_idDadosDocumentos_fkey" FOREIGN KEY ("idDadosDocumentos") REFERENCES "dadosDocumentos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
