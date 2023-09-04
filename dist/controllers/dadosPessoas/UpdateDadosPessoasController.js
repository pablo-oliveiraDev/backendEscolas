"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.UpdateDadosPessoasController = void 0;
const prismaClient_1 = require("../../database/prismaClient");
;
class UpdateDadosPessoasController {
    async handle(request, response) {
        const { id } = request.params;
        const { nome, Sobrenome, email, Cpf, Rg, idade, data_nascimento, status_cadastro, tel, } = request.body;
        const updateDadospessoas = await prismaClient_1.prismaClient.dadosDocumento.update({
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
exports.UpdateDadosPessoasController = UpdateDadosPessoasController;
