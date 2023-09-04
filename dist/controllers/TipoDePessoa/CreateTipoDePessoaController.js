"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.CreateTipoDePessoaController = void 0;
const prismaClient_1 = require("../../database/prismaClient");
class CreateTipoDePessoaController {
    async handle(request, response) {
        const { pessoa, } = request.body;
        const tipo_de_pessoa = await prismaClient_1.prismaClient.tipoDePessoa.create({
            data: {
                pessoa: pessoa
            }
        });
        return response.status(200).json(tipo_de_pessoa);
    }
    ;
}
exports.CreateTipoDePessoaController = CreateTipoDePessoaController;
