"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.UpdatePessoaDadosEscolaresController = void 0;
const prismaClient_1 = require("../../database/prismaClient");
;
class UpdatePessoaDadosEscolaresController {
    async handle(request, response) {
        const { id } = request.params;
        const { especialidade, disciplina, turma, diasSemana, horaInicio, horaFim, presente, bimMod, nota, desempenho, codigoTipoDepessoa, idEndereco, idDadosPessoais } = request.body;
        const findId = await prismaClient_1.prismaClient.pessoaDadosEscolar.findUnique({
            where: {
                id: Number(id),
            },
        });
        if (findId) {
            try {
                const dadosEscolares = await prismaClient_1.prismaClient.pessoaDadosEscolar.update({
                    where: {
                        id: Number(id)
                    },
                    data: {
                        disciplina: {
                            update: {
                                nome: disciplina,
                                tipoDePessoaId: codigoTipoDepessoa,
                                idEndereco: idEndereco,
                                idDadosPessoais: idDadosPessoais
                            },
                        },
                        especialidade: {
                            update: {
                                especialidade: especialidade,
                                tipoDePessoaId: codigoTipoDepessoa,
                                idEndereco: idEndereco,
                                idDadosPessoais: idDadosPessoais
                            },
                        },
                        turma: {
                            update: {
                                nome: turma,
                                tipoDePessoaId: codigoTipoDepessoa,
                                idEndereco: idEndereco,
                                idDadosPessoais: idDadosPessoais
                            },
                        },
                        horario: {
                            update: {
                                diasSemana: diasSemana,
                                horaInicio: horaInicio,
                                horaFim: horaFim,
                                tipoDePessoaId: codigoTipoDepessoa,
                                idEndereco: idEndereco,
                                idDadosPessoais: idDadosPessoais
                            },
                        },
                        presenca: {
                            update: {
                                presente: presente,
                                tipoDePessoaId: codigoTipoDepessoa,
                                idEndereco: idEndereco,
                                idDadosPessoais: idDadosPessoais
                            },
                        },
                        nota: {
                            update: {
                                bimMod: bimMod,
                                nota: nota,
                                desempenho: desempenho,
                                tipoDePessoaId: codigoTipoDepessoa,
                                idEndereco: idEndereco,
                                idDadosPessoais: idDadosPessoais
                            },
                        },
                    },
                });
                return response.status(200).json({ msg: "Atualização feita com sucesso!" });
            }
            catch (error) {
                console.log(error.message);
                return response.status(404).json({ msg: 'Houve um erro inesperado!\nPor favor tente novamente!' });
            }
        }
        else {
            return response.status(404).json({ msg: 'Id não reconhecido!!\nPor favor tente novamente!' });
        }
    }
}
exports.UpdatePessoaDadosEscolaresController = UpdatePessoaDadosEscolaresController;
