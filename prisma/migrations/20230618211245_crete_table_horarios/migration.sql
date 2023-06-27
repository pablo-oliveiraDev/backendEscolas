-- CreateTable
CREATE TABLE "horarios" (
    "id" SERIAL NOT NULL,
    "dias_semana" TEXT NOT NULL,
    "hora_inicio" TEXT NOT NULL,
    "hora_fim" TEXT NOT NULL,

    CONSTRAINT "horarios_pkey" PRIMARY KEY ("id")
);
