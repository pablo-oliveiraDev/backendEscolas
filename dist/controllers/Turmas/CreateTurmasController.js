"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.CreateTurmasController = void 0;
const prismaClient_1 = require("../../database/prismaClient");
;
class CreateTurmasController {
    async handle(request, response) {
        var _a;
        const { nomePessoa, idPessoa, cpf, nomeTurma, } = request.body;
        const idDadosPessoais = await prismaClient_1.prismaClient.dadosDocumento.findMany({
            where: {
                Cpf: cpf,
                AND: {
                    nome: nomePessoa,
                },
            },
            take: 1,
        });
        const idEndereco = await prismaClient_1.prismaClient.pessoaDadosEscolar.findMany({
            where: {
                idDadosDocumento: (_a = idDadosPessoais[0]) === null || _a === void 0 ? void 0 : _a.id,
            }
        });
        if (typeof idDadosPessoais !== null) {
            try {
                const turmas = await prismaClient_1.prismaClient.pessoaDadosEscolar.create({
                    data: {
                        turma: {
                            create: {
                                nome: nomeTurma,
                                tipoDePessoaId: Number(idPessoa),
                                idDadosPessoais: Number(idDadosPessoais[0].id),
                                idEndereco: Number(idEndereco[0].idEndereco),
                            },
                        },
                        tipoDePessoa: {
                            connect: {
                                id: Number(idPessoa),
                            },
                        },
                        dadosDocumento: {
                            connect: {
                                id: Number(idDadosPessoais[0].id),
                            },
                        },
                        endereco: {
                            connect: {
                                id: Number(idEndereco[0].idEndereco),
                            },
                        },
                    },
                });
                return response.status(200).json({ msg: 'Turma criada com sucesso!' });
            }
            catch (error) {
                if (!idDadosPessoais[0]) {
                    return response.status(404).json({ msg: 'idDadosPessoais nao encontrado' });
                }
                else {
                    return response.status(404).json({ msg: 'idEndereco nao encontrado!' });
                }
                ;
            }
            ;
        }
        ;
    }
    ;
}
exports.CreateTurmasController = CreateTurmasController;
;
