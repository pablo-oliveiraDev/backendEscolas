import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';

export class DeleteAlunoController {
    async handle(request: Request, response: Response) {
        const id = request.params;
        const { status_cadastro } = request.body;
        const aluno = await prismaClient.alunoDadosPessoal.update({
            where: {
                id: Number(id)
            },
            data: {
                dadosDocumentos: {
                    update: {

                        statusCadastro: status_cadastro,
                        deleted_at: Date.now().toString()

                    }
                }
            },
        });
        return response.status(200).json({ msg: 'Aluno deletado com sucesso!' });
    }
}