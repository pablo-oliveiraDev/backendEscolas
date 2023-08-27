import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';
interface updateDadospessoasBody {
    nome: string,
    Sobrenome: string,
    email: string,
    Cpf: string,
    Rg: string,
    idade: number,
    data_nascimento: string,
    status_cadastro: boolean,
    tel: string,
};
export class UpdateDadosPessoasController {
    async handle(request: Request, response: Response) {
        const { id } = request.params;
        const {
            nome,
            Sobrenome,
            email,
            Cpf,
            Rg,
            idade,
            data_nascimento,
            status_cadastro,
            tel,
        }: updateDadospessoasBody = request.body;
        const updateDadospessoas = await prismaClient.dadosDocumento.update({
            where: {
                id: Number(id)
            },
            data: {
                nome: nome,
                Sobrenome: Sobrenome,
                email: email,
                Cpf: Cpf,
                Rg: Rg,
                idade: idade,
                dataNascimento: data_nascimento, 
                statusCadastro: status_cadastro,
                tel: tel,
                deleted_at: '00/00/0000'
            },
        });
        return response.status(200).json({ msg: "Dados atualizados com sucesso!" });
    }
}