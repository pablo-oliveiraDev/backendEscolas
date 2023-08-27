import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';
interface turmasBody {
    nomePessoa: string,
    idPessoa: number,
    idEndereco: number,
    idDadosPessoais: number,
    cpf: string,
    nomeTurma: string,
};
export class CreateTurmasController {
    async handle(request: Request, response: Response) {
        const {
            nomePessoa,
            idPessoa,
            cpf,
            nomeTurma,
        }: turmasBody = request.body;
        const idDadosPessoais = await prismaClient.dadosDocumento.findMany({
            where: {
                Cpf: cpf,
                AND: {
                    nome: nomePessoa,
                },
            },
            take: 1,
        });
        const idEndereco = await prismaClient.pessoaDadosEscolar.findMany({
            where: {
                idDadosDocumento: idDadosPessoais[0]?.id,
            }
        });
        if (typeof idDadosPessoais !== null) {
            try {
                const turmas = await prismaClient.pessoaDadosEscolar.create({
                    data: {
                        turma: {
                            create: {
                                nome: nomeTurma,
                                tipoDePessoaId: Number(idPessoa),
                                idDadosPessoais: Number(idDadosPessoais[0].id),
                                idEndereco: Number(idEndereco[0].idEndereco),
                            },
                        },
                        tipoDePessoa: {
                            connect: {
                                id: Number(idPessoa),
                            },
                        },
                        dadosDocumento: {
                            connect: {
                                id: Number(idDadosPessoais[0].id),
                            },
                        },
                        endereco: {
                            connect: {
                                id: Number(idEndereco[0].idEndereco),
                            },
                        },
                    },
                });
                return response.status(200).json({ msg: 'Turma criada com sucesso!' });
            } catch (error) {
                if (!idDadosPessoais[0]) {
                    return response.status(404).json({ msg: 'idDadosPessoais nao encontrado' });
                } else {
                    return response.status(404).json({ msg: 'idEndereco nao encontrado!' })
                };
            };
        };
    };
};