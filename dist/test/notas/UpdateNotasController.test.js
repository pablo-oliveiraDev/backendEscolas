"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const UpdateNotasController_1 = require("../../controllers/notas/UpdateNotasController");
const prismaClient_1 = require("../../database/prismaClient");
describe('UpdateNotasController', () => {
    it('should return a success message with status code 201 when updating notas', async () => {
        const request = {
            body: {
                bimMod: 1,
                desempenho: 'good',
                nota: 90,
            },
            params: {
                id: '1',
            },
        };
        const response = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn(),
        };
        prismaClient_1.prismaClient.nota.update = jest.fn().mockResolvedValue({});
        const updateNotasController = new UpdateNotasController_1.UpdateNotasController();
        await updateNotasController.handle(request, response);
        expect(response.status).toHaveBeenCalledWith(201);
        expect(response.json).toHaveBeenCalledWith({ msg: "Notas atualizadas com sucesso!" });
        expect(prismaClient_1.prismaClient.nota.update).toHaveBeenCalledWith({
            where: {
                id: 1,
            },
            data: {
                bimMod: 1,
                desempenho: 'good',
                nota: 90,
            },
        });
    });
});
