// Generated by CodiumAI

import { Request, Response } from "express";
import { FindPessoaByCpfController } from "../../controllers/pessoas/FindPessoaByCpfController";

describe('FindPessoaByCpfController', () => {
    // Test that the handle method of FindPessoaByCpfController returns a 200 status code and an array of objects containing pessoaDadosPessoais and pessoaDadosEscolar when given a valid cpf
    it('should return 200 status code and an array of objects when given a valid cpf', async () => {
        // Arrange
        const request = {
            body: {
                cpf: 'valid_cpf'
            }
        } as Request;
        const response = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn()
        } as unknown as Response;

        // Act
        const controller = new FindPessoaByCpfController();
        await controller.handle(request, response);
        console.log(response.json)
        // Assert
        expect(response.status).toHaveBeenCalledWith(200);
        expect(response.json).toHaveBeenCalledWith(expect.arrayContaining([]));
        
    });
    //test exits cpf and return msg
    it('should return 500 status code and an msg ', async () => {
        // Arrange
        const request = {
            body: {
                cpf: ''
            }
        } as Request;
        const response = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn()
        } as unknown as Response;

        // Act
        const controller = new FindPessoaByCpfController();
        await controller.handle(request, response);
        console.log(response.json)
        // Assert
        expect(response.status).toHaveBeenCalledWith(500);
        expect(response.json).toHaveBeenCalledWith({ msg: 'Por gentileza digite um cpf para efetuar a pesquisa!' });

    });
});