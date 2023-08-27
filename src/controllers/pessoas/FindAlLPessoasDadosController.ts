import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';

export class FindAlLPessoasDadosController {
    async handle(request: Request, response: Response) {

        const findAllPessoasDados = await prismaClient.dadosDocumento.findMany({
            where: {
                statusCadastro: true,
            }
        });
        return response.status(200);
    };
};