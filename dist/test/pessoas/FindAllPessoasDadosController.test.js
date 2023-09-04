"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const prismaClient_1 = require("../../database/prismaClient");
const FindAllPessoasDadosController_1 = require("../../controllers/pessoas/FindAllPessoasDadosController");
describe('FindAlLPessoasDadosController', () => {
    it('should return a 200 status code when findAllPessoasDados is successful', async () => {
        const request = {};
        const response = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn(),
        };
        prismaClient_1.prismaClient.dadosDocumento.findMany = jest.fn().mockResolvedValueOnce([]);
        const controller = new FindAllPessoasDadosController_1.FindAllPessoasDadosController();
        await controller.handle(request, response);
        expect(response.status).toHaveBeenCalledWith(200);
        expect(response.json).toHaveBeenCalledWith(expect.arrayContaining([]));
    });
});
