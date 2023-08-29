import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';


export class DeleteAlunoController {
    statusCadastro;
    constructor(statusCadastro: boolean) {
        this.statusCadastro = false;
    };
    async handle(request: Request, response: Response) {
        const { id } = request.params;

        if (id) {
            try {
                const aluno = await prismaClient.pessoaDadosPessoais.update({
                    where: {
                        id: Number(id)
                    },
                    data: {
                        dadosDocumentos: {
                            update: {
                                statusCadastro: this.statusCadastro,
                                deleted_at: new Date().toString()
                            }
                        }
                    },
                });
                return response.status(200).json({ msg: 'Aluno deletado com sucesso! 👍🏼' });
            } catch (error) {
                return response.status(404).json({msg: 'Houve um erro inesperado!\nPor favor tente novamente!😥'});
            };
        } else {
            return response.status(400).json({ msg: 'O id não pode estar vazio! ⚠' });
        }
    };
};
