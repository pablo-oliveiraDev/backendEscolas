import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';
import { verify } from 'crypto';


export class DeleteAlunoController {

    async handle(request: Request, response: Response) {
        const { id } = request.params;

        const verifyId = await prismaClient.pessoaDadosPessoais.findFirst({
            where: {
                id: Number(id),
            },
        });
        //act for delete post
        if (verifyId) {
            try {
                const aluno = await prismaClient.pessoaDadosPessoais.update({
                    where: {
                        id: Number(id),
                    },
                    data: {
                        dadosDocumentos: {
                            update: {
                                statusCadastro: false,
                                deleted_at: new Date().toString(),
                            },
                        },
                    },
                });
                return response.status(200).json({ msg: 'Aluno deletado com sucesso! 👍🏼' });
            } catch (error) {
                console.log(error.message);
                return response.status(404).json({ msg: 'Houve um erro inesperado!\nPor favor tente novamente!😥' });
            };
        } else {
            return response.status(400).json({ msg: 'Pessoa não encontrado! ⚠\nPor gentileza tente novamente!' });
        }
    };
};
