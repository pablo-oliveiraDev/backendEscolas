"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.FindAllPessoasCanceladasController = void 0;
const prismaClient_1 = require("../../database/prismaClient");
class FindAllPessoasCanceladasController {
    async handle(request, response) {
        const pessoasCanceladas = await prismaClient_1.prismaClient.dadosDocumento.findMany({
            where: {
                statusCadastro: false,
            },
            include: {
                pessoaDadosPessoais: {
                    include: {
                        tipoDePessoa: true,
                        dadosDocumentos: true,
                        endereco: true,
                        pagtoMes: true,
                    },
                },
            },
        });
        return response.status(200).json(pessoasCanceladas);
    }
}
exports.FindAllPessoasCanceladasController = FindAllPessoasCanceladasController;
