/*
  Warnings:

  - Added the required column `dadosDocumentosId` to the `pessoasDadosEscolares` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idEndereco` to the `pessoasDadosEscolares` table without a default value. This is not possible if the table is not empty.
  - Made the column `tipoDePessoaId` on table `pessoasDadosEscolares` required. This step will fail if there are existing NULL values in that column.
  - Made the column `idDisciplina` on table `pessoasDadosEscolares` required. This step will fail if there are existing NULL values in that column.
  - Made the column `idTurma` on table `pessoasDadosEscolares` required. This step will fail if there are existing NULL values in that column.
  - Made the column `idHorario` on table `pessoasDadosEscolares` required. This step will fail if there are existing NULL values in that column.
  - Made the column `idPresenca` on table `pessoasDadosEscolares` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "pessoasDadosEscolares" DROP CONSTRAINT "pessoasDadosEscolares_idDisciplina_fkey";

-- DropForeignKey
ALTER TABLE "pessoasDadosEscolares" DROP CONSTRAINT "pessoasDadosEscolares_idHorario_fkey";

-- DropForeignKey
ALTER TABLE "pessoasDadosEscolares" DROP CONSTRAINT "pessoasDadosEscolares_idPresenca_fkey";

-- DropForeignKey
ALTER TABLE "pessoasDadosEscolares" DROP CONSTRAINT "pessoasDadosEscolares_idTurma_fkey";

-- DropForeignKey
ALTER TABLE "pessoasDadosEscolares" DROP CONSTRAINT "pessoasDadosEscolares_tipoDePessoaId_fkey";

-- AlterTable
ALTER TABLE "pessoasDadosEscolares" ADD COLUMN     "dadosDocumentosId" INTEGER NOT NULL,
ADD COLUMN     "idEndereco" INTEGER NOT NULL,
ALTER COLUMN "tipoDePessoaId" SET NOT NULL,
ALTER COLUMN "idDisciplina" SET NOT NULL,
ALTER COLUMN "idTurma" SET NOT NULL,
ALTER COLUMN "idHorario" SET NOT NULL,
ALTER COLUMN "idPresenca" SET NOT NULL;

-- CreateTable
CREATE TABLE "PessoaDados" (
    "id" SERIAL NOT NULL,
    "tipoDePessoaId" INTEGER,
    "idEndereco" INTEGER,

    CONSTRAINT "PessoaDados_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "PessoaDados" ADD CONSTRAINT "PessoaDados_tipoDePessoaId_fkey" FOREIGN KEY ("tipoDePessoaId") REFERENCES "tipoDePessoas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PessoaDados" ADD CONSTRAINT "PessoaDados_idEndereco_fkey" FOREIGN KEY ("idEndereco") REFERENCES "enderecos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_tipoDePessoaId_fkey" FOREIGN KEY ("tipoDePessoaId") REFERENCES "tipoDePessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_idEndereco_fkey" FOREIGN KEY ("idEndereco") REFERENCES "enderecos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_dadosDocumentosId_fkey" FOREIGN KEY ("dadosDocumentosId") REFERENCES "dadosDocumentos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_idDisciplina_fkey" FOREIGN KEY ("idDisciplina") REFERENCES "disciplinas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_idTurma_fkey" FOREIGN KEY ("idTurma") REFERENCES "turmas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_idHorario_fkey" FOREIGN KEY ("idHorario") REFERENCES "horarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_idPresenca_fkey" FOREIGN KEY ("idPresenca") REFERENCES "presencas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
