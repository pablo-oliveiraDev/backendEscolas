/*
  Warnings:

  - You are about to alter the column `tel` on the `dadosDocumentos` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.

*/
-- AlterTable
ALTER TABLE "dadosDocumentos" ALTER COLUMN "tel" SET DATA TYPE INTEGER;
