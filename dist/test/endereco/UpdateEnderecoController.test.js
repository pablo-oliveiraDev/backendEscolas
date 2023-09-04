"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const prismaClient_1 = require("../../database/prismaClient");
const UpdateEnderecoController_1 = require("../../controllers/endereco/UpdateEnderecoController");
describe('UpdateEnderecoController', () => {
    it('should update the address successfully when all required fields are provided', async () => {
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
        };
        const response = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn(),
        };
        prismaClient_1.prismaClient.endereco.update = jest.fn().mockResolvedValue({});
        const controller = new UpdateEnderecoController_1.UpdateEnderecoController();
        await controller.handle(request, response);
        expect(response.status).toHaveBeenCalledWith(200);
        expect(response.json).toHaveBeenCalledWith({ msg: 'Endereço atualizado Com Sucesso!' });
        expect(prismaClient_1.prismaClient.endereco.update).toHaveBeenCalledWith({
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
