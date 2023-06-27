/*
  Warnings:

  - Changed the type of `bimMod` on the `notas` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "notas" DROP COLUMN "bimMod",
ADD COLUMN     "bimMod" INTEGER NOT NULL;
