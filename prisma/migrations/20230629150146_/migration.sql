/*
  Warnings:

  - You are about to drop the column `idEndereco` on the `dadosDocumentos` table. All the data in the column will be lost.
  - You are about to drop the column `idPagto` on the `dadosDocumentos` table. All the data in the column will be lost.
  - You are about to drop the column `tipoDePessoaId` on the `dadosDocumentos` table. All the data in the column will be lost.
  - You are about to drop the column `idDadosPessoais` on the `enderecos` table. All the data in the column will be lost.
  - You are about to drop the column `idPagto` on the `enderecos` table. All the data in the column will be lost.
  - You are about to drop the column `tipoDePessoaId` on the `enderecos` table. All the data in the column will be lost.
  - You are about to drop the column `idDadosPessoais` on the `pagtosMes` table. All the data in the column will be lost.
  - You are about to drop the column `idEndereco` on the `pagtosMes` table. All the data in the column will be lost.
  - You are about to drop the column `tipoDePessoaId` on the `pagtosMes` table. All the data in the column will be lost.
  - You are about to drop the `alunoDadosEscolares` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "alunoDadosEscolares" DROP CONSTRAINT "alunoDadosEscolares_idDisciplina_fkey";

-- DropForeignKey
ALTER TABLE "alunoDadosEscolares" DROP CONSTRAINT "alunoDadosEscolares_idHorario_fkey";

-- DropForeignKey
ALTER TABLE "alunoDadosEscolares" DROP CONSTRAINT "alunoDadosEscolares_idNota_fkey";

-- DropForeignKey
ALTER TABLE "alunoDadosEscolares" DROP CONSTRAINT "alunoDadosEscolares_idPessoa_fkey";

-- DropForeignKey
ALTER TABLE "alunoDadosEscolares" DROP CONSTRAINT "alunoDadosEscolares_idPresenca_fkey";

-- DropForeignKey
ALTER TABLE "alunoDadosEscolares" DROP CONSTRAINT "alunoDadosEscolares_idTurma_fkey";

-- AlterTable
ALTER TABLE "dadosDocumentos" DROP COLUMN "idEndereco",
DROP COLUMN "idPagto",
DROP COLUMN "tipoDePessoaId";

-- AlterTable
ALTER TABLE "enderecos" DROP COLUMN "idDadosPessoais",
DROP COLUMN "idPagto",
DROP COLUMN "tipoDePessoaId";

-- AlterTable
ALTER TABLE "pagtosMes" DROP COLUMN "idDadosPessoais",
DROP COLUMN "idEndereco",
DROP COLUMN "tipoDePessoaId";

-- DropTable
DROP TABLE "alunoDadosEscolares";
