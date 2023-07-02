import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';

export class FindAllDadosEscolaresController {

    async handle(request: Request, response: Response) {

        const dadosEscolar = await prismaClient.pessoaDadosEscolar.findMany({
            include: {
                disciplina: true,
                turma: true,
                horario: true,
                presenca: true,
                nota: true,
                especialidade: true

            }
        });
        return response.status(200).json(dadosEscolar);
    }
}