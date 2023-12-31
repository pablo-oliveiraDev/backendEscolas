// Generated by CodiumAI

import { prismaClient } from "../../database/prismaClient";
import { FindAllPessoasDadosController } from "../../controllers/pessoas/FindAllPessoasDadosController";
import { Request, Response } from "express";

describe('FindAlLPessoasDadosController', () => {
    // Test that the handle function of FindAlLPessoasDadosController returns a 200 status code when findAllPessoasDados is successful
    it('should return a 200 status code when findAllPessoasDados is successful', async () => {
        // Arrange
        const request = {} as Request;
        const response = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn(),
        } as unknown as Response;

        prismaClient.dadosDocumento.findMany = jest.fn().mockResolvedValueOnce([]);

        // Act
        const controller = new FindAllPessoasDadosController();
       await controller.handle(request, response);

        // Assert
        expect(response.status).toHaveBeenCalledWith(200);
        expect(response.json).toHaveBeenCalledWith(expect.arrayContaining([]));
    });
});
