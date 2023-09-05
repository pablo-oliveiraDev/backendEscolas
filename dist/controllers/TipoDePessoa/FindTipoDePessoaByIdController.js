"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.FindTipoDePessoaByIdController = void 0;
const prismaClient_1 = require("../../database/prismaClient");
class FindTipoDePessoaByIdController {
    async handle(request, response) {
        const { id } = request.params;
        const tipoDePessoa = await prismaClient_1.prismaClient.tipoDePessoa.findUnique({
            where: {
                id: Number(id)
            },
            include: {
                PessoaDadosPessoais: {
                    include: {
                        endereco: true,
                        dadosDocumentos: true,
                        pagtoMes: true
                    },
                },
            },
        });
        return response.status(200).json(tipoDePessoa);
    }
    ;
}
exports.FindTipoDePessoaByIdController = FindTipoDePessoaByIdController;
;
