-- CreateTable
CREATE TABLE "notas" (
    "id" SERIAL NOT NULL,
    "bimMod" TEXT NOT NULL,
    "nota" INTEGER NOT NULL,
    "desempenho" TEXT NOT NULL,

    CONSTRAINT "notas_pkey" PRIMARY KEY ("id")
);
