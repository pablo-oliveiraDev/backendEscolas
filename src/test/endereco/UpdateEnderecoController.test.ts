import { prismaClient } from "../../database/prismaClient";
import { UpdateEnderecoController } from "../../controllers/endereco/UpdateEnderecoController";
import { Request, Response } from "express";

describe('UpdateEnderecoController', () => {
    // Test that the address is successfully updated when all required fields are provided
    it('should update the address successfully when all required fields are provided', async () => {
        // Arrange
        const request = {
            params: { id: '1' },
            body: {
                cep: '12345-678',
                rua: 'Test Street',
                bairro: 'Test Neighborhood',
                cidade: 'Test City',
                numero: 123,
                complemento: 'Test Complement',
            },
        } as unknown as Request;
        const response = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn(),
        } as unknown as Response;
        
        // Mock prismaClient.endereco.update method
        prismaClient.endereco.update = jest.fn().mockResolvedValue({});

        const controller = new UpdateEnderecoController();

        // Act
        await controller.handle(request, response);

        // Assert
        expect(response.status).toHaveBeenCalledWith(200);
        expect(response.json).toHaveBeenCalledWith({ msg: 'Endereço atualizado Com Sucesso!' });
        expect(prismaClient.endereco.update).toHaveBeenCalledWith({
            where: {
                id: 1,
            },
            data: {
                cep: '12345-678',
                rua: 'Test Street',
                bairro: 'Test Neighborhood',
                cidade: 'Test City',
                numero: 123,
                complemento: 'Test Complement',
            },
        });
    });
});