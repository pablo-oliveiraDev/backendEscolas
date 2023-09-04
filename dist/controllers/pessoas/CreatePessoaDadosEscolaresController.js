"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.CreatePessoaDadosEscolaresController = void 0;
const prismaClient_1 = require("../../database/prismaClient");
;
class CreatePessoaDadosEscolaresController {
    async handle(request, response) {
        const { especialidade, disciplina, turma, diasSemana, horaInicio, horaFim, presente, bimMod, nota, desempenho, codigoTipoDepessoa, idEndereco, cpf, nome } = request.body;
        const idDadosPessoais = await prismaClient_1.prismaClient.dadosDocumento.findMany({
            where: {
                Cpf: cpf,
                AND: {
                    nome: nome,
                },
            },
            take: 1
        });
        const pessoaEscola = await prismaClient_1.prismaClient.pessoaDadosEscolar.create({
            data: {
                disciplina: {
                    create: {
                        nome: disciplina,
                        tipoDePessoaId: codigoTipoDepessoa,
                        idEndereco: idEndereco,
                        idDadosPessoais: idDadosPessoais[0].id
                    },
                },
                especialidade: {
                    create: {
                        especialidade: especialidade,
                        tipoDePessoaId: codigoTipoDepessoa,
                        idEndereco: idEndereco,
                        idDadosPessoais: idDadosPessoais[0].id
                    },
                },
                turma: {
                    create: {
                        nome: turma,
                        tipoDePessoaId: codigoTipoDepessoa,
                        idEndereco: idEndereco,
                        idDadosPessoais: idDadosPessoais[0].id
                    },
                },
                horario: {
                    create: {
                        diasSemana: diasSemana,
                        horaInicio: horaInicio,
                        horaFim: horaFim,
                        tipoDePessoaId: codigoTipoDepessoa,
                        idEndereco: idEndereco,
                        idDadosPessoais: idDadosPessoais[0].id
                    },
                },
                tipoDePessoa: {
                    connect: {
                        id: codigoTipoDepessoa
                    },
                },
                endereco: {
                    connect: {
                        id: idEndereco
                    },
                },
                dadosDocumento: {
                    connect: {
                        id: idDadosPessoais[0].id
                    },
                },
            },
        });
        return response.status(200).json(pessoaEscola);
    }
}
exports.CreatePessoaDadosEscolaresController = CreatePessoaDadosEscolaresController;
