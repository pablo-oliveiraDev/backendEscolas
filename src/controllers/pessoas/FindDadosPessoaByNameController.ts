import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';

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

        if (nome || sobrenome) {
            try {
                const dadosPesoasByName = await prismaClient.dadosDocumento.findMany({
                    where: {
                        nome: nome,
                        OR: {
                            Sobrenome: sobrenome,
                        },
                        
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
                if(dadosPesoasByName.length !== 0){
                    return response.status(200).json(dadosPesoasByName);
                }else{
                    return response.status(404).json({msg:'O nome ou sobrenome pesquisados não exitem!'});
                };                
            } catch (err) {
                return response.status(500).json({ msg: 'Houve um erro inesperado!\nPor favor tente novamente!' });
            }
        } else {
            return response.status(400).json({ msg: 'Os campos nome e sobrenome não podem estar vazios para essa pesquisa!' });
        };
    };
};