/*
  Warnings:

  - The primary key for the `pessoasDadosEscolares` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `idDadosDocumentos` on the `pessoasDadosEscolares` table. All the data in the column will be lost.
  - Added the required column `idDadosPessoais` to the `disciplinas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idDadosPessoais` to the `especialidades` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idDadosPessoais` to the `horarios` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idDadosPessoais` to the `notas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idDadosDocumento` to the `pessoasDadosEscolares` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idDadosPessoais` to the `presencas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idDadosPessoais` to the `turmas` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "pessoasDadosEscolares" DROP CONSTRAINT "pessoasDadosEscolares_idDadosDocumentos_fkey";

-- AlterTable
ALTER TABLE "disciplinas" ADD COLUMN     "idDadosPessoais" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "especialidades" ADD COLUMN     "idDadosPessoais" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "horarios" ADD COLUMN     "idDadosPessoais" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "notas" ADD COLUMN     "idDadosPessoais" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "pessoasDadosEscolares" DROP CONSTRAINT "pessoasDadosEscolares_pkey",
DROP COLUMN "idDadosDocumentos",
ADD COLUMN     "idDadosDocumento" INTEGER NOT NULL,
ADD CONSTRAINT "pessoasDadosEscolares_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "presencas" ADD COLUMN     "idDadosPessoais" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "turmas" ADD COLUMN     "idDadosPessoais" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_idDadosDocumento_fkey" FOREIGN KEY ("idDadosDocumento") REFERENCES "dadosDocumentos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
