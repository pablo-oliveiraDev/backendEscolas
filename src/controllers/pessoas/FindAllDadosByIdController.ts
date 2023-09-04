import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';

export class FindAllDadosByIdController {
    async handle(request: Request, response: Response) {
        const { id } = request.params;

        if (id ) {
            try {
                const allDadosById = await prismaClient.dadosDocumento.findMany({
                    where: {
                        id: Number(id),
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
                if (allDadosById.length === 0) {
                    return response.status(404).json({ msg: 'Id não encontrado!' })
                } else {
                    return response.status(200).json(allDadosById);
                };

            } catch (err) {
                return response.status(500).json({ msg: 'Houve um erro inesperado!\nPor favor tente novamente!' })
            }
        } else {
            return response.status(500).json({ msg: 'Por gentileza digita um id para efetuar a pesquisa!' })
        };
    };
};