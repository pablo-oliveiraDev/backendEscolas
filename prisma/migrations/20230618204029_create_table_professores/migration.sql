-- CreateTable
CREATE TABLE "professores" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "especialidade" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "tel" BIGINT NOT NULL,

    CONSTRAINT "professores_pkey" PRIMARY KEY ("id")
);
