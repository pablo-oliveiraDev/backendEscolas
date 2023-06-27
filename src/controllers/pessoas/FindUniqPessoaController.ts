import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';

export class FindUniqAlunoController {
    async handle(request: Request, response: Response) {
        const { id } = request.params;
        const aluno = await prismaClient.tipoDePessoa.findUnique({
            where: {
                id: Number(id)
            }
        });
        return response.status(200).json();
    }

}