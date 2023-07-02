/*
  Warnings:

  - The primary key for the `pessoasDadosEscolares` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the `alunos_pagtos` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "alunos_pagtos" DROP CONSTRAINT "alunos_pagtos_idPagto_fkey";

-- DropForeignKey
ALTER TABLE "alunos_pagtos" DROP CONSTRAINT "alunos_pagtos_tipoDePessoaId_fkey";

-- AlterTable
ALTER TABLE "pessoasDadosEscolares" DROP CONSTRAINT "pessoasDadosEscolares_pkey",
ADD CONSTRAINT "pessoasDadosEscolares_pkey" PRIMARY KEY ("id", "idDadosDocumento");

-- DropTable
DROP TABLE "alunos_pagtos";
