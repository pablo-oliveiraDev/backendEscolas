-- DropForeignKey
ALTER TABLE "aluno_endereco" DROP CONSTRAINT "aluno_endereco_idEndereco_fkey";

-- AddForeignKey
ALTER TABLE "aluno_endereco" ADD CONSTRAINT "aluno_endereco_idEndereco_fkey" FOREIGN KEY ("idEndereco") REFERENCES "enderecos"("id") ON DELETE SET NULL ON UPDATE CASCADE;
