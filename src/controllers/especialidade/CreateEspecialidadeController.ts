import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';
interface especialidadesBody {
    nomePessoa: string,
    cpf: string,
    tipoDePessoaId: number,
    tipoEspecialidade: string,
};

export class CreateEspecialidadeController {
    async handle(request: Request, response: Response) {
        const {
            nomePessoa,
            cpf,
            tipoDePessoaId,
            tipoEspecialidade,
        }: especialidadesBody = request.body;
        const idDadosPessoais = await prismaClient.dadosDocumento.findMany({
            where: {
                nome: nomePessoa,
                AND: {
                    Cpf: cpf
                },
            },
            take: 1
        });
        console.log(idDadosPessoais)
        const idEndereco = await prismaClient.pessoaDadosEscolar.findMany({
            where: {
                idDadosDocumento: idDadosPessoais[0]?.id,
            },
        });

        if (idDadosPessoais) {
            try {
                const especialidades = await prismaClient.pessoaDadosEscolar.create({
                    data: {
                        especialidade: {
                            create: {
                                especialidade: tipoEspecialidade,
                                idDadosPessoais: idDadosPessoais[0].id,
                                tipoDePessoaId: tipoDePessoaId,
                                idEndereco: idEndereco[0].idEndereco
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
                return response.status(200).json({ msg: 'Especialidade criada com sucesso!' });
            } catch (error) {
                if (!idDadosPessoais[0]) {
                    return response.status(404).json({ msg: 'idDadoaPessoais nao encontrado!' })
                } else {
                    return response.status(404).json({ msg: 'Houve um erro desconhecido!Tente novamente' })
                };
            };

        };
        return response.status(200).json({ msg: 'especialidade inserida com sucesso!' });
    }
}