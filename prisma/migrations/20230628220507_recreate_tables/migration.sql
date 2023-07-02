/*
  Warnings:

  - You are about to drop the `alunoDadosPessoais` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `alunoEndereco` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `idEndereco` to the `dadosDocumentos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idPagto` to the `dadosDocumentos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idDadosPessoais` to the `enderecos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idPagto` to the `enderecos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idDadosPessoais` to the `pagtosMes` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idEndereco` to the `pagtosMes` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "alunoDadosPessoais" DROP CONSTRAINT "alunoDadosPessoais_dadosDocumentosId_fkey";

-- DropForeignKey
ALTER TABLE "alunoDadosPessoais" DROP CONSTRAINT "alunoDadosPessoais_tipoDePessoaId_fkey";

-- DropForeignKey
ALTER TABLE "alunoEndereco" DROP CONSTRAINT "alunoEndereco_idEndereco_fkey";

-- DropForeignKey
ALTER TABLE "alunoEndereco" DROP CONSTRAINT "alunoEndereco_idPessoa_fkey";

-- AlterTable
ALTER TABLE "dadosDocumentos" ADD COLUMN     "idEndereco" INTEGER NOT NULL,
ADD COLUMN     "idPagto" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "enderecos" ADD COLUMN     "idDadosPessoais" INTEGER NOT NULL,
ADD COLUMN     "idPagto" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "pagtosMes" ADD COLUMN     "idDadosPessoais" INTEGER NOT NULL,
ADD COLUMN     "idEndereco" INTEGER NOT NULL;

-- DropTable
DROP TABLE "alunoDadosPessoais";

-- DropTable
DROP TABLE "alunoEndereco";

-- CreateTable
CREATE TABLE "pessoasDadosPessoais" (
    "id" SERIAL NOT NULL,
    "idPessoa" INTEGER NOT NULL,
    "idEndereco" INTEGER NOT NULL,
    "dadosDocumentosId" INTEGER NOT NULL,
    "idPagto" INTEGER NOT NULL,

    CONSTRAINT "pessoasDadosPessoais_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "pessoasDadosPessoais" ADD CONSTRAINT "pessoasDadosPessoais_idPessoa_fkey" FOREIGN KEY ("idPessoa") REFERENCES "tipoDePessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosPessoais" ADD CONSTRAINT "pessoasDadosPessoais_idEndereco_fkey" FOREIGN KEY ("idEndereco") REFERENCES "enderecos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosPessoais" ADD CONSTRAINT "pessoasDadosPessoais_dadosDocumentosId_fkey" FOREIGN KEY ("dadosDocumentosId") REFERENCES "dadosDocumentos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosPessoais" ADD CONSTRAINT "pessoasDadosPessoais_idPagto_fkey" FOREIGN KEY ("idPagto") REFERENCES "pagtosMes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
