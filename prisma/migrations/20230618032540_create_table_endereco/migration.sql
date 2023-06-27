-- CreateTable
CREATE TABLE "responsaveis" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "sobrenome" TEXT NOT NULL,
    "tel" BIGINT NOT NULL,

    CONSTRAINT "responsaveis_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pagtos_mes" (
    "id" SERIAL NOT NULL,
    "data_pagto" TEXT NOT NULL,
    "data_vencimento" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "pagtos_mes_pkey" PRIMARY KEY ("id")
);
