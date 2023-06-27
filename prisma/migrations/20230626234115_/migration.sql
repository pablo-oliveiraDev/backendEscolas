/*
  Warnings:

  - You are about to drop the column `dadosDomentosId` on the `disciplinas` table. All the data in the column will be lost.
  - You are about to drop the column `dadosDomentosId` on the `especialidades` table. All the data in the column will be lost.
  - You are about to drop the column `dadosDomentosId` on the `horarios` table. All the data in the column will be lost.
  - You are about to drop the column `dadosDomentosId` on the `notas` table. All the data in the column will be lost.
  - You are about to drop the column `dadosDomentosId` on the `presencas` table. All the data in the column will be lost.
  - You are about to drop the column `dadosDomentosId` on the `turmas` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "disciplinas" DROP COLUMN "dadosDomentosId";

-- AlterTable
ALTER TABLE "especialidades" DROP COLUMN "dadosDomentosId";

-- AlterTable
ALTER TABLE "horarios" DROP COLUMN "dadosDomentosId";

-- AlterTable
ALTER TABLE "notas" DROP COLUMN "dadosDomentosId";

-- AlterTable
ALTER TABLE "presencas" DROP COLUMN "dadosDomentosId";

-- AlterTable
ALTER TABLE "turmas" DROP COLUMN "dadosDomentosId";
