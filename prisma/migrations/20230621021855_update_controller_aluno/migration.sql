/*
  Warnings:

  - Added the required column `created_at` to the `alunos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `created_at` to the `responsaveis` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "alunos" ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "responsaveis" ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL;
