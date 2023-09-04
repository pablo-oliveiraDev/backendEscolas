"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.FindAllDadosEscolaresController = void 0;
const prismaClient_1 = require("../../database/prismaClient");
class FindAllDadosEscolaresController {
    async handle(request, response) {
        try {
            const dadosEscolar = await prismaClient_1.prismaClient.pessoaDadosEscolar.findMany({
                include: {
                    disciplina: true,
                    turma: true,
                    horario: true,
                    presenca: true,
                    nota: true,
                    especialidade: true,
                }
            });
            return response.status(200).json(dadosEscolar);
        }
        catch (err) {
            return response.status(404).json({ msg: 'Houve um erro inesperado!\nPor gentileza tente novamente!' });
        }
        ;
    }
    ;
}
exports.FindAllDadosEscolaresController = FindAllDadosEscolaresController;
