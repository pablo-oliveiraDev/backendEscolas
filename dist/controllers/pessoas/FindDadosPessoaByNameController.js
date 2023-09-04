"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.FindDadosPessoaByNameController = void 0;
const prismaClient_1 = require("../../database/prismaClient");
;
class FindDadosPessoaByNameController {
    async handle(request, response) {
        const { nome, sobrenome, } = request.body;
        if (nome || sobrenome) {
            try {
                const dadosPesoasByName = await prismaClient_1.prismaClient.dadosDocumento.findMany({
                    where: {
                        nome: nome,
                        OR: {
                            Sobrenome: sobrenome,
                        },
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
                if (dadosPesoasByName.length !== 0) {
                    return response.status(200).json(dadosPesoasByName);
                }
                else {
                    return response.status(404).json({ msg: 'O nome ou sobrenome pesquisados não exitem!' });
                }
                ;
            }
            catch (err) {
                return response.status(500).json({ msg: 'Houve um erro inesperado!\nPor favor tente novamente!' });
            }
        }
        else {
            return response.status(400).json({ msg: 'Os campos nome e sobrenome não podem estar vazios para essa pesquisa!' });
        }
        ;
    }
    ;
}
exports.FindDadosPessoaByNameController = FindDadosPessoaByNameController;
;
