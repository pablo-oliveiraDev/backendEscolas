import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';
interface notasBody {
    nomePessoa: string,
    cpf: string,
    tipoDePessoaId: number,
    bimestre: number,
    desempenho: string,
    nota: number,
};
export class CreateNotasController {
    async handle(request: Request, response: Response) {
        const {
            nomePessoa,
            cpf,
            bimestre,
            desempenho,
            nota,
            tipoDePessoaId
        }: notasBody = request.body;
        const idDadosPessoais = await prismaClient.dadosDocumento.findMany({
            where: {
                nome: nomePessoa,
                AND: {
                    Cpf: cpf
                },
            },
            take: 1
        });
        const idEndereco = await prismaClient.pessoaDadosEscolar.findMany({
            where: {
                idDadosDocumento: idDadosPessoais[0]?.id,
            },
        });
        if (idDadosPessoais) {
            try {
                const notas = await prismaClient.pessoaDadosEscolar.create({
                    data: {
                        nota: {
                            create: {
                                bimMod: bimestre,
                                desempenho: desempenho,
                                nota: nota,
                                tipoDePessoaId: tipoDePessoaId,
                                idDadosPessoais: idDadosPessoais[0].id,
                                idEndereco: idEndereco[0].idEndereco,
                            },
                        },
                        tipoDePessoa: {
                            connect: {
                                id: tipoDePessoaId,
                            },
                        },
                        dadosDocumento: {
                            connect: {
                                id: idDadosPessoais[0].id,
                            },
                        },
                        endereco: {
                            connect: {
                                id: idEndereco[0].id,
                            },
                        },
                        turma: {
                            connect: {
                                id: idEndereco[0].idTurma
                            },
                        },
                        horario: {
                            connect: {
                                id: idEndereco[0].idHorario
                            },
                        },
                        disciplina: {
                            connect: {
                                id: idEndereco[0].idHorario
                            },
                        },
                    },
                });
                return response.status(200).json({ msg: 'Nota inserida com sucesso!' });
            } catch (error) {
                if (!idDadosPessoais[0]) {
                    return response.status(404).json({ msg: 'idDadoaPessoais nao encontrado!' })
                } else {
                    return response.status(404).json({ msg: 'Houve um erro desconhecido!Tente novamente' })
                };
            };

        };
    };
}