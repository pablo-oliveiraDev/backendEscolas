"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.UpdateEspecilidadeContoller = void 0;
const prismaClient_1 = require("../../database/prismaClient");
;
class UpdateEspecilidadeContoller {
    async handle(request, response) {
        const { especialidade } = request.body;
        const { id } = request.params;
        const UpdateEscialidade = await prismaClient_1.prismaClient.especilidade.update({
            where: {
                id: Number(id)
            },
            data: {
                especialidade: especialidade
            },
        });
        return response.status(201).json({ msg: "Especialidade atualizada com sucesso!" });
    }
}
exports.UpdateEspecilidadeContoller = UpdateEspecilidadeContoller;
