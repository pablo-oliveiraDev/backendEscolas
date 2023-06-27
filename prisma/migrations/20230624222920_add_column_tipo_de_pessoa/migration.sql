/*
  Warnings:

  - Added the required column `tipoDePessoaId` to the `disciplinas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tipoDePessoaId` to the `enderecos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tipoDePessoaId` to the `especialidades` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tipoDePessoaId` to the `horarios` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tipoDePessoaId` to the `notas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tipoDePessoaId` to the `pagtosMes` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tipoDePessoaId` to the `presencas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tipoDePessoaId` to the `turmas` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "disciplinas" ADD COLUMN     "tipoDePessoaId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "enderecos" ADD COLUMN     "tipoDePessoaId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "especialidades" ADD COLUMN     "tipoDePessoaId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "horarios" ADD COLUMN     "tipoDePessoaId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "notas" ADD COLUMN     "tipoDePessoaId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "pagtosMes" ADD COLUMN     "tipoDePessoaId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "presencas" ADD COLUMN     "tipoDePessoaId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "turmas" ADD COLUMN     "tipoDePessoaId" INTEGER NOT NULL;
