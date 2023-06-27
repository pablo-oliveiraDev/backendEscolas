/*
  Warnings:

  - You are about to drop the `professorDadosEscolares` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "professorDadosEscolares" DROP CONSTRAINT "professorDadosEscolares_idDisciplina_fkey";

-- DropForeignKey
ALTER TABLE "professorDadosEscolares" DROP CONSTRAINT "professorDadosEscolares_idHorario_fkey";

-- DropForeignKey
ALTER TABLE "professorDadosEscolares" DROP CONSTRAINT "professorDadosEscolares_idNota_fkey";

-- DropForeignKey
ALTER TABLE "professorDadosEscolares" DROP CONSTRAINT "professorDadosEscolares_idPessoa_fkey";

-- DropForeignKey
ALTER TABLE "professorDadosEscolares" DROP CONSTRAINT "professorDadosEscolares_idPresenca_fkey";

-- DropForeignKey
ALTER TABLE "professorDadosEscolares" DROP CONSTRAINT "professorDadosEscolares_idTurma_fkey";

-- DropTable
DROP TABLE "professorDadosEscolares";

-- CreateTable
CREATE TABLE "pessoasDadosEscolares" (
    "id" SERIAL NOT NULL,
    "tipoDePessoaId" INTEGER NOT NULL,
    "idDisciplina" INTEGER NOT NULL,
    "idTurma" INTEGER NOT NULL,
    "idHorario" INTEGER NOT NULL,
    "idPresenca" INTEGER,
    "idNota" INTEGER,
    "idEspecialidade" INTEGER,

    CONSTRAINT "pessoasDadosEscolares_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_tipoDePessoaId_fkey" FOREIGN KEY ("tipoDePessoaId") REFERENCES "tipoDePessoas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_idDisciplina_fkey" FOREIGN KEY ("idDisciplina") REFERENCES "disciplinas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_idTurma_fkey" FOREIGN KEY ("idTurma") REFERENCES "turmas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_idHorario_fkey" FOREIGN KEY ("idHorario") REFERENCES "horarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_idPresenca_fkey" FOREIGN KEY ("idPresenca") REFERENCES "presencas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_idNota_fkey" FOREIGN KEY ("idNota") REFERENCES "notas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pessoasDadosEscolares" ADD CONSTRAINT "pessoasDadosEscolares_idEspecialidade_fkey" FOREIGN KEY ("idEspecialidade") REFERENCES "especialidades"("id") ON DELETE SET NULL ON UPDATE CASCADE;
