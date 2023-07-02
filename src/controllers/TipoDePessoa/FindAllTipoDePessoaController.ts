import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';

export class FindAllTipoDePessoaController {
    async handle(request: Request, response: Response) {

        const FindAllTipoDePessoa = await prismaClient.dadosDocumento.findMany({
            where: {
                statusCadastro: true,
            },
            include: {
                pessoaDadosPessoais: {
                    include: {
                        endereco: true,
                        tipoDePessoa: true,
                        pagtoMes: true,
                    },
                },
            },
        });
        return response.status(200).json(FindAllTipoDePessoa);
    };
};