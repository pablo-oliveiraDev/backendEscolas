/*
  Warnings:

  - The primary key for the `alunos_pagtos` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `idPessoa` on the `alunos_pagtos` table. All the data in the column will be lost.
  - You are about to drop the column `idEndereco` on the `enderecos` table. All the data in the column will be lost.
  - Added the required column `tipoDePessoaId` to the `alunos_pagtos` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "alunos_pagtos" DROP CONSTRAINT "alunos_pagtos_idPessoa_fkey";

-- AlterTable
ALTER TABLE "alunos_pagtos" DROP CONSTRAINT "alunos_pagtos_pkey",
DROP COLUMN "idPessoa",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD COLUMN     "tipoDePessoaId" INTEGER NOT NULL,
ADD CONSTRAINT "alunos_pagtos_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "enderecos" DROP COLUMN "idEndereco",
ALTER COLUMN "cep" SET DATA TYPE TEXT;

-- AddForeignKey
ALTER TABLE "alunos_pagtos" ADD CONSTRAINT "alunos_pagtos_tipoDePessoaId_fkey" FOREIGN KEY ("tipoDePessoaId") REFERENCES "tipoDePessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
