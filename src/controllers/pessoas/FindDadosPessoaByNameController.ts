import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';
import { NOMEM } from 'dns';
interface dadosPesoasByNameBody {
    nome: string;
    sobrenome: string;
};
export class FindDadosPessoaByNameController {
    async handle(request: Request, response: Response) {
        const {
            nome,
            sobrenome,
        }: dadosPesoasByNameBody = request.body;
        const dadosPesoasByName = await prismaClient.dadosDocumento.findMany({
            where: {
                nome: nome,
                AND: {
                    Sobrenome: sobrenome,
                }
            },
            include: {
                pessoaDadosPessoais: {
                    include: {
                        endereco: true
                    },
                },
                pessoaDadosEscolar: {
                    include: {
                        disciplina: true,
                        turma: true,
                        horario: true,
                        presenca: true,
                        nota: true,
                        especialidade: true,
                    }
                }
            },
        });
        return response.status(200).json(dadosPesoasByName);
    }
}