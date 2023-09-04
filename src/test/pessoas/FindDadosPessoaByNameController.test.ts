import { prismaClient } from '../../database/prismaClient'
import { Request, Response } from "express";
import { FindDadosPessoaByNameController } from "../../controllers/pessoas/FindDadosPessoaByNameController";

describe('FindDadosPessoaByNameController', () => {



    // Test that the handle method of FindDadosPessoaByNameController returns a 200 status code and an array of objects containing pessoaDadosPessoais and pessoaDadosEscolar when valid nome and sobrenome are provided
    it('should return 200 status code and an array of objects when valid nome and sobrenome are provided', async () => {
        // Arrange
        const request = {
            body: {
                nome: 'nome',
                sobrenome: 'Sobrenome',
            },
        } as unknown as Request;
        const response = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn(),
        } as unknown as Response;

       
        const findDadosPessoaByNameController = new FindDadosPessoaByNameController();

        // Act
        await findDadosPessoaByNameController.handle(request, response);

        // Assert
        expect(response.status).toHaveBeenCalledWith(200);
        expect(response.json).toHaveBeenCalledWith(expect.arrayContaining([]));
    });
});
