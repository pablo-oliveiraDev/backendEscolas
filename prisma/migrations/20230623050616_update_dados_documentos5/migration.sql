/*
  Warnings:

  - You are about to drop the column `idDadosDocumentos` on the `aluno_dados_pessoais` table. All the data in the column will be lost.
  - You are about to drop the column `idPessoa` on the `aluno_dados_pessoais` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "aluno_dados_pessoais" DROP CONSTRAINT "aluno_dados_pessoais_idDadosDocumentos_fkey";

-- DropForeignKey
ALTER TABLE "aluno_dados_pessoais" DROP CONSTRAINT "aluno_dados_pessoais_idPessoa_fkey";

-- AlterTable
ALTER TABLE "aluno_dados_pessoais" DROP COLUMN "idDadosDocumentos",
DROP COLUMN "idPessoa",
ADD COLUMN     "dadosDocumentosId" INTEGER,
ADD COLUMN     "tipoDePessoaId" INTEGER;

-- AddForeignKey
ALTER TABLE "aluno_dados_pessoais" ADD CONSTRAINT "aluno_dados_pessoais_tipoDePessoaId_fkey" FOREIGN KEY ("tipoDePessoaId") REFERENCES "tipos_de_pessoas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "aluno_dados_pessoais" ADD CONSTRAINT "aluno_dados_pessoais_dadosDocumentosId_fkey" FOREIGN KEY ("dadosDocumentosId") REFERENCES "Dados_documentos"("id") ON DELETE SET NULL ON UPDATE CASCADE;
