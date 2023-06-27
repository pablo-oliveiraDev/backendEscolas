import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';

export class FindAllAlunoController {
    async handle(request: Request, response: Response) {
        const pessoas = await prismaClient.alunoDadosPessoal.findMany({
            where: {
                dadosDocumentos:{
                    statusCadastro: null,
                }                
            },
            orderBy: {
                id: 'asc'
            },
            include:{
                tipoDePessoa:true
            },
        });
        return response.status(200).json(pessoas);
    }
}