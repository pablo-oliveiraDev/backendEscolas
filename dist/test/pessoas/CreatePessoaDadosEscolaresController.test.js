"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const prismaClient_1 = require("../../database/prismaClient");
const CreatePessoaDadosEscolaresController_1 = require("../../controllers/pessoas/CreatePessoaDadosEscolaresController");
describe('CreatePessoaDadosEscolaresController', () => {
    it('should create pessoaDadosEscolares when valid input data is provided', async () => {
        const request = {
            body: {
                especialidade: 'especialidade',
                disciplina: 'disciplina',
                turma: 'turma',
                diasSemana: 'diasSemana',
                horaInicio: 'horaInicio',
                horaFim: 'horaFim',
                presente: true,
                bimMod: 1,
                nota: 9,
                desempenho: 'desempenho',
                codigoTipoDepessoa: 1,
                idEndereco: 1,
                cpf: '123456789',
                nome: 'John Doe'
            }
        };
        const response = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn()
        };
        const idDadosPessoais = [{ id: 1 }];
        prismaClient_1.prismaClient.dadosDocumento.findMany = jest.fn().mockResolvedValue(idDadosPessoais);
        prismaClient_1.prismaClient.pessoaDadosEscolar.create = jest.fn().mockResolvedValue({});
        const createPessoaDadosEscolaresController = new CreatePessoaDadosEscolaresController_1.CreatePessoaDadosEscolaresController();
        await createPessoaDadosEscolaresController.handle(request, response);
        expect(prismaClient_1.prismaClient.dadosDocumento.findMany).toHaveBeenCalledWith({
            where: {
                Cpf: request.body.cpf,
                AND: {
                    nome: request.body.nome,
                },
            },
            take: 1
        });
        expect(prismaClient_1.prismaClient.pessoaDadosEscolar.create).toHaveBeenCalledWith({
            data: {
                disciplina: {
                    create: {
                        nome: request.body.disciplina,
                        tipoDePessoaId: request.body.codigoTipoDepessoa,
                        idEndereco: request.body.idEndereco,
                        idDadosPessoais: idDadosPessoais[0].id
                    }
                },
                especialidade: {
                    create: {
                        especialidade: request.body.especialidade,
                        tipoDePessoaId: request.body.codigoTipoDepessoa,
                        idEndereco: request.body.idEndereco,
                        idDadosPessoais: idDadosPessoais[0].id
                    }
                },
                turma: {
                    create: {
                        nome: request.body.turma,
                        tipoDePessoaId: request.body.codigoTipoDepessoa,
                        idEndereco: request.body.idEndereco,
                        idDadosPessoais: idDadosPessoais[0].id
                    }
                },
                horario: {
                    create: {
                        diasSemana: request.body.diasSemana,
                        horaInicio: request.body.horaInicio,
                        horaFim: request.body.horaFim,
                        tipoDePessoaId: request.body.codigoTipoDepessoa,
                        idEndereco: request.body.idEndereco,
                        idDadosPessoais: idDadosPessoais[0].id
                    }
                },
                tipoDePessoa: {
                    connect: {
                        id: request.body.codigoTipoDepessoa
                    }
                },
                endereco: {
                    connect: {
                        id: request.body.idEndereco
                    }
                },
                dadosDocumento: {
                    connect: {
                        id: idDadosPessoais[0].id
                    }
                }
            }
        });
        expect(response.status).toHaveBeenCalledWith(200);
        expect(response.json).toHaveBeenCalledWith({});
    });
});
