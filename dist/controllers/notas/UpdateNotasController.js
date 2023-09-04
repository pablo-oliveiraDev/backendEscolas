"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.UpdateNotasController = void 0;
const prismaClient_1 = require("../../database/prismaClient");
;
class UpdateNotasController {
    async handle(request, response) {
        const { bimMod, desempenho, nota } = request.body;
        const { id } = request.params;
        const UpdateNotas = await prismaClient_1.prismaClient.nota.update({
            where: {
                id: Number(id)
            },
            data: {
                bimMod: bimMod,
                desempenho: desempenho,
                nota: nota
            },
        });
        return response.status(201).json({ msg: "Notas atualizadas com sucesso!" });
    }
}
exports.UpdateNotasController = UpdateNotasController;
