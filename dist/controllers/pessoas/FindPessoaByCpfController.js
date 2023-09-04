"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.FindPessoaByCpfController = void 0;
const prismaClient_1 = require("../../database/prismaClient");
;
class FindPessoaByCpfController {
    async handle(request, response) {
        const { cpf, } = request.body;
        if (cpf) {
            try {
                const dadosPessoasByCpf = await prismaClient_1.prismaClient.dadosDocumento.findMany({
                    where: {
                        Cpf: cpf
                    },
                    include: {
                        pessoaDadosPessoais: {
                            include: {
                                endereco: true
                            },
                        },
                        pessoaDadosEscolar: {
                            include: {
                                disciplina: true,
                                turma: true,
                                horario: true,
                                presenca: true,
                                nota: true,
                                especialidade: true,
                            }
                        }
                    },
                });
                if (dadosPessoasByCpf) {
                    return response.status(200).json(dadosPessoasByCpf);
                }
                else {
                    return response.status(400).json({ msg: 'Cpf não encontrado!' });
                }
                ;
            }
            catch (error) {
                return response.status(404).json({ msg: 'Houve um erro inesperado!\nPor favor tente novamente!' });
            }
        }
        else {
            return response.status(500).json({ msg: 'Por gentileza digite um cpf para efetuar a pesquisa!' });
        }
        ;
    }
    ;
}
exports.FindPessoaByCpfController = FindPessoaByCpfController;
;
