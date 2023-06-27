import { Request, Response } from 'express'
import { prismaClient } from '../../database/prismaClient';

export class CreateTipoDePessoaController {
    async handle(request: Request, response: Response) {
        const {
            pessoa,
        } = request.body;
        const tipo_de_pessoa = await prismaClient.tipoDePessoa.create({
            data: {
                pessoa: pessoa
            }

        });
        return response.status(200).json(tipo_de_pessoa);

    };

}