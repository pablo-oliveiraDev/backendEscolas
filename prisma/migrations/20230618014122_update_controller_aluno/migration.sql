/*
  Warnings:

  - Made the column `deleted_at` on table `alunos` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "alunos" ALTER COLUMN "deleted_at" SET NOT NULL;
