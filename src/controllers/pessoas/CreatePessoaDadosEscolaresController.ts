import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';
interface pessoaEscolaBody {
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
export class CreatePessoaDadosEscolaresController {
    async handle(request: Request, response: Response) {
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
        }: pessoaEscolaBody = request.body;
        const pessoaEscola = await prismaClient.pessoaDadosEscolar.create({
            data: {
                disciplina: {
                    create: {
                        nome: disciplina,
                        tipoDePessoaId: codigoTipoDepessoa,
                        idEndereco: idEndereco,
                        idDadosPessoais: idDadosPessoais
                    },
                },
                especialidade: {
                    create: {
                        especialidade: especialidade,
                        tipoDePessoaId: codigoTipoDepessoa,
                        idEndereco: idEndereco,
                        idDadosPessoais: idDadosPessoais

                    },
                },
                turma: {
                    create: {
                        nome: turma,
                        tipoDePessoaId: codigoTipoDepessoa,
                        idEndereco: idEndereco,
                        idDadosPessoais: idDadosPessoais

                    },
                },
                horario: {
                    create: {
                        diasSemana: diasSemana,
                        horaInicio: horaInicio,
                        horaFim: horaFim,
                        tipoDePessoaId: codigoTipoDepessoa,
                        idEndereco: idEndereco,
                        idDadosPessoais: idDadosPessoais
                    },
                },
                presenca: {
                    create: {
                        presente: presente,
                        tipoDePessoaId: codigoTipoDepessoa,
                        idEndereco: idEndereco,
                        idDadosPessoais: idDadosPessoais
                    },
                },
                nota: {
                    create: {
                        bimMod: bimMod,
                        nota: nota,
                        desempenho: desempenho,
                        tipoDePessoaId: codigoTipoDepessoa,
                        idEndereco: idEndereco,
                        idDadosPessoais: idDadosPessoais
                    },
                },
                tipoDePessoa: {
                    connect: {
                        id: codigoTipoDepessoa
                    },
                },
                endereco: {
                    connect: {
                        id: idEndereco
                    },
                },
                dadosDocumento: {
                    connect: {
                        id: idDadosPessoais
                    },
                },
            },

        });
        return response.status(200).json(pessoaEscola);
    }
}