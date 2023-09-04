import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';

export class FindAllDadosEscolaresController {
    async handle(request: Request, response: Response) {
        try {
            const dadosEscolar = await prismaClient.pessoaDadosEscolar.findMany({
                include: {
                    disciplina: true,
                    turma: true,
                    horario: true,
                    presenca: true,
                    nota: true,
                    especialidade: true,
                }
            });
            return response.status(200).json(dadosEscolar);
        } catch (err) {
            return response.status(404).json({ msg: 'Houve um erro inesperado!\nPor gentileza tente novamente!' })
        };
    };
}