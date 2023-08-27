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
    cpf: string,
    nome: string
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
            cpf,
            nome

        }: pessoaEscolaBody = request.body;
        const idDadosPessoais = await prismaClient.dadosDocumento.findMany({
            where: {
                Cpf: cpf,
                AND: {
                    nome: nome,
                },
            },
            take: 1
        });
        const pessoaEscola = await prismaClient.pessoaDadosEscolar.create({
            data: {
                disciplina: {
                    create: {
                        nome: disciplina,
                        tipoDePessoaId: codigoTipoDepessoa,
                        idEndereco: idEndereco,
                        idDadosPessoais: idDadosPessoais[0].id
                    },
                },
                especialidade: {
                    create: {
                        especialidade: especialidade,
                        tipoDePessoaId: codigoTipoDepessoa,
                        idEndereco: idEndereco,
                        idDadosPessoais: idDadosPessoais[0].id

                    },
                },
                turma: {
                    create: {
                        nome: turma,
                        tipoDePessoaId: codigoTipoDepessoa,
                        idEndereco: idEndereco,
                        idDadosPessoais: idDadosPessoais[0].id

                    },
                },
                horario: {
                    create: {
                        diasSemana: diasSemana,
                        horaInicio: horaInicio,
                        horaFim: horaFim,
                        tipoDePessoaId: codigoTipoDepessoa,
                        idEndereco: idEndereco,
                        idDadosPessoais: idDadosPessoais[0].id
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
                        id: idDadosPessoais[0].id
                    },
                },
            },
        });
        return response.status(200).json(pessoaEscola);
    }
}