"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const prismaClient_1 = require("../../database/prismaClient");
const CreateDadosPessoaisController_1 = require("../../controllers/pessoas/CreateDadosPessoaisController");
describe('CreatePessoaDadosPessoaisController', () => {
    it('should create a new pessoaDadosPessoais with endereco, dadosDocumentos, pagtoMes, and tipoDePessoa', async () => {
        const request = {
            body: {
                nome: 'John',
                Sobrenome: 'Doe',
                email: 'john.doe@example.com',
                Cpf: '123456789',
                Rg: '987654321',
                idade: 25,
                data_nascimento: '1996-01-01',
                status_cadastro: true,
                tel: '1234567890',
                cep: '12345-678',
                rua: 'Street',
                bairro: 'Neighborhood',
                cidade: 'City',
                numero: 123,
                complemento: 'Complement',
                valor: 100.50,
                data_pagto: '2022-01-01',
                data_vencimento: '2022-02-01',
                status: true,
                codigoTipoPessoa: 1
            },
        };
        const response = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn(),
        };
        prismaClient_1.prismaClient.endereco.create = jest.fn().mockResolvedValueOnce({
            pessoaDadosPessoais: {
                tipoDePessoa: {},
                dadosDocumentos: {},
                pagtoMes: {},
            },
        });
        const createPessoaDadosPessoaisController = new CreateDadosPessoaisController_1.CreatePessoaDadosPessoaisController();
        await createPessoaDadosPessoaisController.handle(request, response);
        expect(prismaClient_1.prismaClient.endereco.create).toHaveBeenCalledWith({
            data: {
                cep: request.body.cep,
                rua: request.body.rua,
                bairro: request.body.bairro,
                cidade: request.body.cidade,
                numero: request.body.numero,
                complemento: request.body.complemento,
                pessoaDadosPessoais: {
                    create: {
                        dadosDocumentos: {
                            create: {
                                nome: request.body.nome,
                                Sobrenome: request.body.Sobrenome,
                                email: request.body.email,
                                Cpf: request.body.Cpf,
                                Rg: request.body.Rg,
                                idade: request.body.idade,
                                dataNascimento: request.body.data_nascimento,
                                statusCadastro: request.body.status_cadastro,
                                tel: request.body.tel,
                                deleted_at: '00/00/0000'
                            }
                        },
                        pagtoMes: {
                            create: {
                                valor: request.body.valor,
                                dataPagto: request.body.data_pagto,
                                dataVencimento: request.body.data_vencimento,
                                status: request.body.status
                            }
                        },
                        tipoDePessoa: {
                            connect: {
                                id: request.body.codigoTipoPessoa
                            }
                        }
                    }
                }
            },
            include: {
                pessoaDadosPessoais: {
                    include: {
                        tipoDePessoa: true,
                        dadosDocumentos: true,
                        pagtoMes: true
                    }
                }
            }
        });
        expect(response.status).toHaveBeenCalledWith(200);
        expect(response.json).toHaveBeenCalledWith({
            pessoaDadosPessoais: {
                tipoDePessoa: {},
                dadosDocumentos: {},
                pagtoMes: {}
            }
        });
    });
});
