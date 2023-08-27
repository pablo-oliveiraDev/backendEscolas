import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';
import { NOMEM } from 'dns';
interface dadosPesoasByCpfBody {
    cpf:string
};
export class FindPessoaByCpfController {
    async handle(request: Request, response: Response) {
        const {
           cpf,
        }: dadosPesoasByCpfBody = request.body;
        const dadosPesoasByName = await prismaClient.dadosDocumento.findMany({
            where: {
              Cpf:cpf
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