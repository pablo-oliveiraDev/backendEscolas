import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';

interface dadosEscolaresBody {
    especialidade: string,
    disciplina: string,
    turma: string,
    diasSemana: string,
    horaInicio: string,
    horaFim: string,
    presente: boolean,
    bimMod: number,
    nota: number,
    desempenho: string,
    codigoTipoDepessoa: number,
    idEndereco: number,
    idDadosPessoais: number,
};
export class UpdatePessoaDadosEscolaresController {
    async handle(request: Request, response: Response) {
        const { id } = request.params;
        const {
            especialidade,
            disciplina,
            turma,
            diasSemana,
            horaInicio,
            horaFim,
            presente,
            bimMod,
            nota,
            desempenho,
            codigoTipoDepessoa,
            idEndereco,
            idDadosPessoais
        }: dadosEscolaresBody = request.body;
        const findId = await prismaClient.pessoaDadosEscolar.findUnique({
            where: {
                id: Number(id),
            },
        });
        if (findId) {
            try {
                const dadosEscolares = await prismaClient.pessoaDadosEscolar.update({
                    where: {
                        id: Number(id)
                    },
                    data: {
                        disciplina: {
                            update: {
                                nome: disciplina,
                                tipoDePessoaId: codigoTipoDepessoa,
                                idEndereco: idEndereco,
                                idDadosPessoais: idDadosPessoais
                            },
                        },
                        especialidade: {
                            update: {
                                especialidade: especialidade,
                                tipoDePessoaId: codigoTipoDepessoa,
                                idEndereco: idEndereco,
                                idDadosPessoais: idDadosPessoais
                            },
                        },
                        turma: {
                            update: {
                                nome: turma,
                                tipoDePessoaId: codigoTipoDepessoa,
                                idEndereco: idEndereco,
                                idDadosPessoais: idDadosPessoais
                            },
                        },
                        horario: {
                            update: {
                                diasSemana: diasSemana,
                                horaInicio: horaInicio,
                                horaFim: horaFim,
                                tipoDePessoaId: codigoTipoDepessoa,
                                idEndereco: idEndereco,
                                idDadosPessoais: idDadosPessoais
                            },
                        },
                        presenca: {
                            update: {
                                presente: presente,
                                tipoDePessoaId: codigoTipoDepessoa,
                                idEndereco: idEndereco,
                                idDadosPessoais: idDadosPessoais
                            },
                        },
                        nota: {
                            update: {
                                bimMod: bimMod,
                                nota: nota,
                                desempenho: desempenho,
                                tipoDePessoaId: codigoTipoDepessoa,
                                idEndereco: idEndereco,
                                idDadosPessoais: idDadosPessoais
                            },
                        },
                    },
                });
                return response.status(200).json({ msg: "Atualização feita com sucesso!" });

            } catch (error) {
                console.log(error.message);
                return response.status(404).json({ msg: 'Houve um erro inesperado!\nPor favor tente novamente!' })
            }
        } else {
            return response.status(404).json({ msg: 'Id não reconhecido!!\nPor favor tente novamente!' })
        }
    }
}