import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';

interface alunoEndereco {
    cep: string,
    rua: string,
    bairro: string,
    cidade: string,
    numero: number,
    complemento: string,
    codigoTipoPessoa: number,
   
};

export class UpdateEnderecoController {
    async handle(request: Request, response: Response) {
        const {id}= request.params; 
        const {
            cep,
            rua,
            bairro,
            cidade,
            numero,
            complemento,
            codigoTipoPessoa

        }: alunoEndereco = request.body;
        const endereco = await prismaClient.endereco.update({
            where:{
                id: Number(id)
            },
            data: {
                cep: cep,
                rua: rua,
                bairro: bairro,
                cidade: cidade,
                numero: numero,
                complemento: complemento,
                tipoDePessoaId: codigoTipoPessoa,              
            },
        });
        return response.status(200).json(endereco);
    }
}