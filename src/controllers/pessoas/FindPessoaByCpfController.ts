import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';
import { NOMEM } from 'dns';
interface dadosPesoasByCpfBody {
    cpf: string
};
export class FindPessoaByCpfController {
    async handle(request: Request, response: Response) {
        const {
            cpf,
        }: dadosPesoasByCpfBody = request.body;
        if (cpf) {
            try {
                const dadosPessoasByCpf = await prismaClient.dadosDocumento.findMany({
                    where: {
                        Cpf: cpf
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
                if(dadosPessoasByCpf){
                    return response.status(200).json(dadosPessoasByCpf);
                }else{
                    return response.status(400).json({msg:'Cpf não encontrado!'})
                };
                
            } catch (error) {
                return response.status(404).json({msg:'Houve um erro inesperado!\nPor favor tente novamente!'});
            }
        }else{
            return response.status(500).json({msg:'Por gentileza digite um cpf para efetuar a pesquisa!'})
        };
    };
};