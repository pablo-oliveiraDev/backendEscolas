"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.CreateEspecialidadeController = void 0;
const prismaClient_1 = require("../../database/prismaClient");
;
class CreateEspecialidadeController {
    async handle(request, response) {
        var _a;
        const { nomePessoa, cpf, tipoDePessoaId, tipoEspecialidade, } = request.body;
        const idDadosPessoais = await prismaClient_1.prismaClient.dadosDocumento.findMany({
            where: {
                nome: nomePessoa,
                AND: {
                    Cpf: cpf
                },
            },
            take: 1
        });
        console.log(idDadosPessoais);
        const idEndereco = await prismaClient_1.prismaClient.pessoaDadosEscolar.findMany({
            where: {
                idDadosDocumento: (_a = idDadosPessoais[0]) === null || _a === void 0 ? void 0 : _a.id,
            },
        });
        if (idDadosPessoais) {
            try {
                const especialidades = await prismaClient_1.prismaClient.pessoaDadosEscolar.create({
                    data: {
                        especialidade: {
                            create: {
                                especialidade: tipoEspecialidade,
                                idDadosPessoais: idDadosPessoais[0].id,
                                tipoDePessoaId: tipoDePessoaId,
                                idEndereco: idEndereco[0].idEndereco
                            },
                        },
                        tipoDePessoa: {
                            connect: {
                                id: tipoDePessoaId,
                            },
                        },
                        dadosDocumento: {
                            connect: {
                                id: idDadosPessoais[0].id,
                            },
                        },
                        endereco: {
                            connect: {
                                id: idEndereco[0].id,
                            },
                        },
                        turma: {
                            connect: {
                                id: idEndereco[0].idTurma
                            },
                        },
                        horario: {
                            connect: {
                                id: idEndereco[0].idHorario
                            },
                        },
                        disciplina: {
                            connect: {
                                id: idEndereco[0].idHorario
                            },
                        },
                    },
                });
                return response.status(200).json({ msg: 'Especialidade criada com sucesso!' });
            }
            catch (error) {
                if (!idDadosPessoais[0]) {
                    return response.status(404).json({ msg: 'idDadoaPessoais nao encontrado!' });
                }
                else {
                    return response.status(404).json({ msg: 'Houve um erro desconhecido!Tente novamente' });
                }
                ;
            }
            ;
        }
        ;
        return response.status(200).json({ msg: 'especialidade inserida com sucesso!' });
    }
}
exports.CreateEspecialidadeController = CreateEspecialidadeController;
