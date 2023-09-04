"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const prismaClient_1 = require("../../database/prismaClient");
const UpdateDadosPessoasController_1 = require("../../controllers/dadosPessoas/UpdateDadosPessoasController");
describe('UpdateDadosPessoasController', () => {
    it('should return a 200 status code when data is updated successfully', async () => {
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
        };
        const response = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn(),
        };
        prismaClient_1.prismaClient.dadosDocumento.update = jest.fn().mockResolvedValue({});
        const controller = new UpdateDadosPessoasController_1.UpdateDadosPessoasController();
        await controller.handle(request, response);
        expect(response.status).toHaveBeenCalledWith(200);
        expect(response.json).toHaveBeenCalledWith({ msg: "Dados atualizados com sucesso!" });
        expect(prismaClient_1.prismaClient.dadosDocumento.update).toHaveBeenCalledWith({
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
