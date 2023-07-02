-- DropForeignKey
ALTER TABLE "pessoasDadosPessoais" DROP CONSTRAINT "pessoasDadosPessoais_dadosDocumentosId_fkey";

-- DropForeignKey
ALTER TABLE "pessoasDadosPessoais" DROP CONSTRAINT "pessoasDadosPessoais_idEndereco_fkey";

-- DropForeignKey
ALTER TABLE "pessoasDadosPessoais" DROP CONSTRAINT "pessoasDadosPessoais_idPagto_fkey";

-- DropForeignKey
ALTER TABLE "pessoasDadosPessoais" DROP CONSTRAINT "pessoasDadosPessoais_tipoDePessoaId_fkey";

-- AlterTable
ALTER TABLE "pessoasDadosPessoais" ALTER COLUMN "idEndereco" DROP NOT NULL,
ALTER COLUMN "dadosDocumentosId" DROP NOT NULL,
ALTER COLUMN "idPagto" DROP NOT NULL,
ALTER COLUMN "tipoDePessoaId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "pessoasDadosPessoais" ADD CONSTRAINT "pessoasDadosPessoais_tipoDePessoaId_fkey" FOREIGN KEY ("tipoDePessoaId") REFERENCES "tipoDePessoas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosPessoais" ADD CONSTRAINT "pessoasDadosPessoais_idEndereco_fkey" FOREIGN KEY ("idEndereco") REFERENCES "enderecos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosPessoais" ADD CONSTRAINT "pessoasDadosPessoais_dadosDocumentosId_fkey" FOREIGN KEY ("dadosDocumentosId") REFERENCES "dadosDocumentos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosPessoais" ADD CONSTRAINT "pessoasDadosPessoais_idPagto_fkey" FOREIGN KEY ("idPagto") REFERENCES "pagtosMes"("id") ON DELETE SET NULL ON UPDATE CASCADE;
