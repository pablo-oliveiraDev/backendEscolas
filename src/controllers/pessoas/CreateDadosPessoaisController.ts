import { Request, Response } from "express";
import { prismaClient } from "../../database/prismaClient";
import { Decimal } from "@prisma/client/runtime";
interface dataBody {
    nome: string,
    Sobrenome: string,
    email: string,
    Cpf: string,
    Rg: string,
    idade: number,
    data_nascimento: string,
    status_cadastro: boolean,
    tel: string,
    cep: string,
    rua: string,
    bairro: string,
    cidade: string,
    numero: number,
    complemento: string,
    valor: Decimal,
    data_pagto: string,
    data_vencimento: string,
    status: boolean,
    codigoTipoPessoa: number,
    
}

export class CreatePessoaDadosPessoaisController {
    async handle(request: Request, response: Response) {
        const {
            nome,
            Sobrenome,
            email,
            Cpf,
            Rg,
            idade,
            data_nascimento,
            status_cadastro,
            tel,
            cep,
            rua,
            bairro,
            cidade,
            numero,
            complemento,
            valor,
            data_pagto,
            data_vencimento,
            status,
            codigoTipoPessoa,
           
        }: dataBody = request.body;

        const alunoDadosPessoais = await prismaClient.endereco.create({

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
            include:{
                pessoaDadosPessoais:{
                    include:{
                        tipoDePessoa:true,
                        dadosDocumentos:true,
                        pagtoMes:true
                    }
                }
            }
        });
        return response.status(200).json(alunoDadosPessoais);
    };
}
