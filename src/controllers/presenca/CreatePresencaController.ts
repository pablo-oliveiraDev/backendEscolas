import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';
interface presencaBody {
    idDadosPessoais: number,
    nomePessoa: string,
    cpf: string,
    idEndereco: number,
    presente: boolean,
    tipoDePessoasId: number,
};
export class CreatePresencaController {
    async handle(request: Request, response: Response) {
        const {
            tipoDePessoasId,
            presente,
            nomePessoa,
            cpf
        }: presencaBody = request.body;
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
            },
        });
        if (typeof idDadosPessoais !== null) {
            try {
                const presenca = await prismaClient.pessoaDadosEscolar.create({
                    data: {
                        presenca: {
                            create: {
                                presente: presente,
                                tipoDePessoaId: Number(tipoDePessoasId),
                                idDadosPessoais: Number(idDadosPessoais[0].id),
                                idEndereco: Number(idEndereco[0].idEndereco),
                            },
                        },
                        tipoDePessoa: {
                            connect: {
                                id: Number(tipoDePessoasId),
                            },
                        },
                        dadosDocumento: {
                            connect: {
                                id: Number(idDadosPessoais[0].id),
                            },
                        },
                        endereco: {
                            connect: {
                                id: Number(idEndereco[0].idEndereco)
                            },
                        },
                    },
                });
                return response.status(200).json({ msg: 'Presença Armazenada com sucesso!' });
            } catch (error) {
                if (!idDadosPessoais[0]) {
                    return response.status(404).json({ msg: 'idDadosPessoais nao encontrado' });
                }
                else {
                    return response.status(404).json({ msg: 'idEndereco nao encontrado' });
                }
            }
        }

    }
}