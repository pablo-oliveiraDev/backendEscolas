"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.UpdateEnderecoController = void 0;
const prismaClient_1 = require("../../database/prismaClient");
;
class UpdateEnderecoController {
    async handle(request, response) {
        const { id } = request.params;
        const { cep, rua, bairro, cidade, numero, complemento, } = request.body;
        const updateEndereco = await prismaClient_1.prismaClient.endereco.update({
            where: {
                id: Number(id)
            },
            data: {
                cep: cep,
                rua: rua,
                bairro: bairro,
                cidade: cidade,
                numero: numero,
                complemento: complemento
            },
        });
        return response.status(200).json({ msg: "Endereço atualizado Com Sucesso!" });
    }
}
exports.UpdateEnderecoController = UpdateEnderecoController;
