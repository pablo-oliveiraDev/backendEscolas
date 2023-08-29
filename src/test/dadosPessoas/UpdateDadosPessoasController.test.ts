import { prismaClient } from "../../database/prismaClient";
import { UpdateDadosPessoasController } from "../../controllers/dadosPessoas/UpdateDadosPessoasController";
import { Request, Response } from 'express'; // Certifique-se de que a importação esteja correta

describe('UpdateDadosPessoasController', () => {

    // Test that the handle method of UpdateDadosPessoasController returns a 200 status code when data is updated successfully.
    it('should return a 200 status code when data is updated successfully', async () => {
        // Mock request and response objects
        const request = {
            params: { id: '1' },
            body: {
                nome: 'John',
                Sobrenome: 'Doe',
                email: 'john.doe@example.com',
                Cpf: '123456789',
                Rg: '987654321',
                idade: 25,
                data_nascimento: '1996-01-01',
                status_cadastro: true,
                tel: '1234567890',
            },
        } as unknown as Request; // Certifique-se de que o objeto seja do tipo Request
        const response = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn(),
        } as unknown as Response; // Certifique-se de que o objeto seja do tipo Response

        // Mock prismaClient.dadosDocumento.update method
        prismaClient.dadosDocumento.update = jest.fn().mockResolvedValue({});

        // Create an instance of UpdateDadosPessoasController
        const controller = new UpdateDadosPessoasController();

        // Call the handle method with the mock request and response objects
        await controller.handle(request, response);

        // Assert that the response status is 200
        expect(response.status).toHaveBeenCalledWith(200);

        // Assert that the response json method was called with the expected message
        expect(response.json).toHaveBeenCalledWith({ msg: "Dados atualizados com sucesso!" });
        
        // Assert that the prismaClient.dadosDocumento.update method was called with the correct arguments
        expect(prismaClient.dadosDocumento.update).toHaveBeenCalledWith({
            where: {
                id: 1,
            },
            data: {
                nome: 'John',
                Sobrenome: 'Doe',
                email: 'john.doe@example.com',
                Cpf: '123456789',
                Rg: '987654321',
                idade: 25,
                dataNascimento: '1996-01-01',
                statusCadastro: true,
                tel: '1234567890',
                deleted_at: '00/00/0000',
            },
        });
    });

});