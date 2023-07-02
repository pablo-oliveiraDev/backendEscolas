import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';
interface updateEnderecoBody {
    cep: string,
    rua: string,
    bairro: string,
    cidade: string,
    numero: number,
    complemento: string
};
export class UpdateEnderecoController {
    async handle(request: Request, response: Response) {
        const {id} = request.params;
        const {
            cep,
            rua,
            bairro,
            cidade,
            numero,
            complemento
        }: updateEnderecoBody = request.body;
        const updateEndereco = await prismaClient.endereco.update({
           where:{
            id:Number(id)
           },
            data: {
                cep:cep,
                rua:rua,
                cidade:cidade,
                numero:numero,
                complemento:complemento
            },
        });
        return response.status(200).json({msg:"Endereço atualizado Com Sucesso!"});
    }
}