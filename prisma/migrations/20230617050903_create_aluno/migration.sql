-- CreateTable
CREATE TABLE "alunos" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "Sobrenome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "Cpf" TEXT NOT NULL,
    "Rg" TEXT NOT NULL,
    "idade" INTEGER NOT NULL,
    "data_nascimento" TIMESTAMP(3) NOT NULL,
    "status_cadastro" BOOLEAN NOT NULL,
    "tel" BIGINT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "alunos_pkey" PRIMARY KEY ("id")
);
