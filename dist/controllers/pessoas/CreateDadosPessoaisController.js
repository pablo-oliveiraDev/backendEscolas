"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.CreatePessoaDadosPessoaisController = void 0;
const prismaClient_1 = require("../../database/prismaClient");
class CreatePessoaDadosPessoaisController {
    async handle(request, response) {
        const { nome, Sobrenome, email, Cpf, Rg, idade, data_nascimento, status_cadastro, tel, cep, rua, bairro, cidade, numero, complemento, valor, data_pagto, data_vencimento, status, codigoTipoPessoa, } = request.body;
        const alunoDadosPessoais = await prismaClient_1.prismaClient.endereco.create({
            data: {
                cep: cep,
                rua: rua,
                bairro: bairro,
                cidade: cidade,
                numero: numero,
                complemento: complemento,
                pessoaDadosPessoais: {
                    create: {
                        dadosDocumentos: {
                            create: {
                                nome: nome,
                                Sobrenome: Sobrenome,
                                email: email,
                                Cpf: Cpf,
                                Rg: Rg,
                                idade: idade,
                                dataNascimento: data_nascimento,
                                statusCadastro: status_cadastro,
                                tel: tel,
                                deleted_at: '00/00/0000',
                            },
                        },
                        pagtoMes: {
                            create: {
                                valor: valor,
                                dataPagto: data_pagto,
                                dataVencimento: data_vencimento,
                                status: status,
                            },
                        },
                        tipoDePessoa: {
                            connect: {
                                id: codigoTipoPessoa,
                            },
                        },
                    },
                },
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
        return response.status(200).json(alunoDadosPessoais);
    }
    ;
}
exports.CreatePessoaDadosPessoaisController = CreatePessoaDadosPessoaisController;
;
