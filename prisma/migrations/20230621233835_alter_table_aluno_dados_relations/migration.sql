-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_id_aluno_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_id_endereco_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_id_pagto_mes_fkey";

-- DropForeignKey
ALTER TABLE "alunos_dados_pessoais" DROP CONSTRAINT "alunos_dados_pessoais_id_pessoa_fkey";

-- AlterTable
ALTER TABLE "alunos_dados_pessoais" ALTER COLUMN "id_aluno" DROP NOT NULL,
ALTER COLUMN "id_pessoa" DROP NOT NULL,
ALTER COLUMN "id_endereco" DROP NOT NULL,
ALTER COLUMN "id_pagto_mes" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_id_aluno_fkey" FOREIGN KEY ("id_aluno") REFERENCES "alunos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_id_pessoa_fkey" FOREIGN KEY ("id_pessoa") REFERENCES "pessoas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_id_endereco_fkey" FOREIGN KEY ("id_endereco") REFERENCES "enderecos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_pessoais" ADD CONSTRAINT "alunos_dados_pessoais_id_pagto_mes_fkey" FOREIGN KEY ("id_pagto_mes") REFERENCES "pagtos_mes"("id") ON DELETE SET NULL ON UPDATE CASCADE;
