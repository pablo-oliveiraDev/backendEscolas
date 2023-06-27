import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';

interface alunoEndereco {
    cep: string,
    rua: string,
    bairro: string,
    cidade: string,
    numero: number,
    complemento: string,
    codigoTipoPessoa: number
};
export class CreateEnderecoController {
    async handle(request: Request, response: Response) {
        const {
            cep,
            rua,
            bairro,
            cidade,
            numero,
            complemento,
            codigoTipoPessoa,
        }: alunoEndereco = request.body;
        const endereco = await prismaClient.alunoEndereco.create({
            data: {
                endereco: {
                    create: {
                        cep: cep,
                        rua: rua,
                        bairro: bairro,
                        cidade: cidade,
                        numero: numero,
                        complemento: complemento,
                        tipoDePessoaId: codigoTipoPessoa
                    },
                },
                tipodepessoa: {
                    connect: {
                        id: codigoTipoPessoa,
                    },
                },
            },
        });
        return response.status(200).json(endereco);
    }
}