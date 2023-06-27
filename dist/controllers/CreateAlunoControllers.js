"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.CreateAlunoController = void 0;
const prismaClient_1 = require("src/database/prismaClient");
class CreateAlunoController {
    async handle(request, response) {
        const { nome, Sobrenome, email, Cpf, Rg, idade, data_nascimento, status_cadastro, tel } = request.body;
        const aluno = await prismaClient_1.prismaClient.aluno.create({
            data: {
                nome,
                Sobrenome,
                email,
                Cpf,
                Rg,
                idade,
                data_nascimento,
                status_cadastro,
                tel
            }
        });
        return response.json();
    }
    ;
}
exports.CreateAlunoController = CreateAlunoController;
