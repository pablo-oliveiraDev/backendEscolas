"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.FindAllDadosByIdController = void 0;
const prismaClient_1 = require("../../database/prismaClient");
class FindAllDadosByIdController {
    async handle(request, response) {
        const { id } = request.params;
        if (id) {
            try {
                const allDadosById = await prismaClient_1.prismaClient.dadosDocumento.findMany({
                    where: {
                        id: Number(id),
                    },
                    include: {
                        pessoaDadosPessoais: {
                            include: {
                                endereco: true
                            },
                        },
                        pessoaDadosEscolar: {
                            select: {
                                disciplina: true,
                                turma: true,
                                horario: true,
                                presenca: true,
                                nota: true,
                                especialidade: true,
                            },
                        },
                    },
                });
                if (allDadosById.length === 0) {
                    return response.status(404).json({ msg: 'Id não encontrado!' });
                }
                else {
                    return response.status(200).json(allDadosById);
                }
                ;
            }
            catch (err) {
                return response.status(500).json({ msg: 'Houve um erro inesperado!\nPor favor tente novamente!' });
            }
        }
        else {
            return response.status(500).json({ msg: 'Por gentileza digita um id para efetuar a pesquisa!' });
        }
        ;
    }
    ;
}
exports.FindAllDadosByIdController = FindAllDadosByIdController;
;
