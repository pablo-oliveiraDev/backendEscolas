/*
  Warnings:

  - Added the required column `valor` to the `pagtos_mes` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "pagtos_mes" ADD COLUMN     "valor" DECIMAL(10,2) NOT NULL;
