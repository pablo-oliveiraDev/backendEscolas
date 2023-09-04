"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.FindAllTipoDePessoaController = void 0;
const prismaClient_1 = require("../../database/prismaClient");
class FindAllTipoDePessoaController {
    async handle(request, response) {
        const FindAllTipoDePessoa = await prismaClient_1.prismaClient.dadosDocumento.findMany({
            where: {
                statusCadastro: true,
            },
            include: {
                pessoaDadosPessoais: {
                    include: {
                        endereco: true,
                        tipoDePessoa: true,
                        pagtoMes: true,
                    },
                },
            },
        });
        return response.status(200).json(FindAllTipoDePessoa);
    }
    ;
}
exports.FindAllTipoDePessoaController = FindAllTipoDePessoaController;
;
