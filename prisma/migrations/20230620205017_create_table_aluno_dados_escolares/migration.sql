-- CreateTable
CREATE TABLE "alunos_dados_escolares" (
    "id" SERIAL NOT NULL,
    "id_aluno" INTEGER NOT NULL,
    "id_professor" INTEGER NOT NULL,
    "id_disciplina" INTEGER NOT NULL,
    "id_turma" INTEGER NOT NULL,
    "id_horario" INTEGER NOT NULL,
    "id_presenca" INTEGER,
    "id_nota" INTEGER,

    CONSTRAINT "alunos_dados_escolares_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "alunos_dados_escolares" ADD CONSTRAINT "alunos_dados_escolares_id_aluno_fkey" FOREIGN KEY ("id_aluno") REFERENCES "alunos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_escolares" ADD CONSTRAINT "alunos_dados_escolares_id_professor_fkey" FOREIGN KEY ("id_professor") REFERENCES "professores"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_escolares" ADD CONSTRAINT "alunos_dados_escolares_id_disciplina_fkey" FOREIGN KEY ("id_disciplina") REFERENCES "disciplinas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_escolares" ADD CONSTRAINT "alunos_dados_escolares_id_turma_fkey" FOREIGN KEY ("id_turma") REFERENCES "turmas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_escolares" ADD CONSTRAINT "alunos_dados_escolares_id_horario_fkey" FOREIGN KEY ("id_horario") REFERENCES "horarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_escolares" ADD CONSTRAINT "alunos_dados_escolares_id_presenca_fkey" FOREIGN KEY ("id_presenca") REFERENCES "presencas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos_dados_escolares" ADD CONSTRAINT "alunos_dados_escolares_id_nota_fkey" FOREIGN KEY ("id_nota") REFERENCES "notas"("id") ON DELETE SET NULL ON UPDATE CASCADE;
