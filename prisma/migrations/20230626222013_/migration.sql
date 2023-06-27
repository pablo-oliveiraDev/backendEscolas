/*
  Warnings:

  - Added the required column `dadosDomentosId` to the `disciplinas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idEndereco` to the `disciplinas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dadosDomentosId` to the `especialidades` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idEndereco` to the `especialidades` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dadosDomentosId` to the `horarios` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idEndereco` to the `horarios` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dadosDomentosId` to the `notas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idEndereco` to the `notas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dadosDomentosId` to the `presencas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idEndereco` to the `presencas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dadosDomentosId` to the `turmas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idEndereco` to the `turmas` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "pessoasDadosEscolares" DROP CONSTRAINT "pessoasDadosEscolares_dadosDocumentosId_fkey";

-- DropForeignKey
ALTER TABLE "pessoasDadosEscolares" DROP CONSTRAINT "pessoasDadosEscolares_idDisciplina_fkey";

-- DropForeignKey
ALTER TABLE "pessoasDadosEscolares" DROP CONSTRAINT "pessoasDadosEscolares_idEndereco_fkey";

-- DropForeignKey
ALTER TABLE "pessoasDadosEscolares" DROP CONSTRAINT "pessoasDadosEscolares_idHorario_fkey";

-- DropForeignKey
ALTER TABLE "pessoasDadosEscolares" DROP CONSTRAINT "pessoasDadosEscolares_idPresenca_fkey";

-- DropForeignKey
ALTER TABLE "pessoasDadosEscolares" DROP CONSTRAINT "pessoasDadosEscolares_idTurma_fkey";

-- DropForeignKey
ALTER TABLE "pessoasDadosEscolares" DROP CONSTRAINT "pessoasDadosEscolares_tipoDePessoaId_fkey";

-- AlterTable
ALTER TABLE "disciplinas" ADD COLUMN     "dadosDomentosId" INTEGER NOT NULL,
ADD COLUMN     "idEndereco" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "especialidades" ADD COLUMN     "dadosDomentosId" INTEGER NOT NULL,
ADD COLUMN     "idEndereco" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "horarios" ADD COLUMN     "dadosDomentosId" INTEGER NOT NULL,
ADD COLUMN     "idEndereco" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "notas" ADD COLUMN     "dadosDomentosId" INTEGER NOT NULL,
ADD COLUMN     "idEndereco" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "pessoasDadosEscolares" ALTER COLUMN "tipoDePessoaId" DROP NOT NULL,
ALTER COLUMN "idDisciplina" DROP NOT NULL,
ALTER COLUMN "idTurma" DROP NOT NULL,
ALTER COLUMN "idHorario" DROP NOT NULL,
ALTER COLUMN "idPresenca" DROP NOT NULL,
ALTER COLUMN "dadosDocumentosId" DROP NOT NULL,
ALTER COLUMN "idEndereco" DROP NOT NULL;

-- AlterTable
ALTER TABLE "presencas" ADD COLUMN     "dadosDomentosId" INTEGER NOT NULL,
ADD COLUMN     "idEndereco" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "turmas" ADD COLUMN     "dadosDomentosId" INTEGER NOT NULL,
ADD COLUMN     "idEndereco" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_tipoDePessoaId_fkey" FOREIGN KEY ("tipoDePessoaId") REFERENCES "tipoDePessoas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_idEndereco_fkey" FOREIGN KEY ("idEndereco") REFERENCES "enderecos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_dadosDocumentosId_fkey" FOREIGN KEY ("dadosDocumentosId") REFERENCES "dadosDocumentos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_idDisciplina_fkey" FOREIGN KEY ("idDisciplina") REFERENCES "disciplinas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_idTurma_fkey" FOREIGN KEY ("idTurma") REFERENCES "turmas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_idHorario_fkey" FOREIGN KEY ("idHorario") REFERENCES "horarios"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_idPresenca_fkey" FOREIGN KEY ("idPresenca") REFERENCES "presencas"("id") ON DELETE SET NULL ON UPDATE CASCADE;
