import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';

export class FindAllPessoasCanceladasController {
    async handle(request: Request, response: Response) {
        const pessoasCanceladas = await prismaClient.dadosDocumento.findMany({
            where: {
                statusCadastro: false,
            },
            include: {                
                pessoaDadosPessoais: {
                    include: {                       
                        tipoDePessoa: true,
                        dadosDocumentos: true,
                        endereco: true,
                        pagtoMes: true,
                    },
                },
            },
        });
        return response.status(200).json(pessoasCanceladas);
    }
}