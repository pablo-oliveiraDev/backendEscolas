import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';

export class FindAllDadosByIdController {
    async handle(request: Request, response: Response) {
        const { id } = request.params;
        const allDadosById = await prismaClient.dadosDocumento.findMany({
            where: {
               id:Number(id),
            },
            include: {
                pessoaDadosPessoais: {
                    include: {
                        endereco: true
                    },
                },
                pessoaDadosEscolar: {
                    select: {
                        disciplina: true,
                        turma: true,
                        horario: true,
                        presenca: true,
                        nota: true,
                        especialidade: true,
                    },
                },
            },

        });
        return response.status(200).json(allDadosById);
    }
}