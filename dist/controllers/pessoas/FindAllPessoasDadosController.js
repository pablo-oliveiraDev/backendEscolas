"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.FindAllPessoasDadosController = void 0;
const prismaClient_1 = require("../../database/prismaClient");
class FindAllPessoasDadosController {
    async handle(request, response) {
        const findAllPessoasDados = await prismaClient_1.prismaClient.dadosDocumento.findMany({
            where: {
                statusCadastro: true,
            },
        });
        return response.status(200).json(findAllPessoasDados);
    }
    ;
}
exports.FindAllPessoasDadosController = FindAllPessoasDadosController;
;
