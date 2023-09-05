"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const DeletePessoaController_1 = require("../../controllers/pessoas/DeletePessoaController");
const prismaClient_1 = require("../../database/prismaClient");
describe('DeleteAlunoController', () => {
    it('should delete an existing aluno with valid id and statusCadastro set to true', async () => {
        const request = {
            params: {
                id: 'validId'
            },
        };
        const response = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn()
        };
        const deleteAlunoController = new DeletePessoaController_1.DeleteAlunoController();
        prismaClient_1.prismaClient.pessoaDadosPessoais.update = jest.fn().mockResolvedValue({});
        await deleteAlunoController.handle(request, response);
        expect(response.status).toHaveBeenCalledWith(200);
        expect(response.json).toHaveBeenCalledWith({ msg: 'Aluno deletado com sucesso! 👍🏼' });
        expect(prismaClient_1.prismaClient.pessoaDadosPessoais.update).toHaveBeenCalledWith({
            where: {
                id: Number(request.params.id)
            },
            data: {
                dadosDocumentos: {
                    update: {
                        statusCadastro: false,
                        deleted_at: expect.any(String)
                    }
                }
            }
        });
    });
    it('Should be have error in id null', async () => {
        const request = {
            params: {
                id: null,
            },
        };
        const response = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn()
        };
        const deleteAlunoController = new DeletePessoaController_1.DeleteAlunoController();
        prismaClient_1.prismaClient.pessoaDadosPessoais.update = jest.fn().mockResolvedValue({});
        await deleteAlunoController.handle(request, response);
        expect(response.status).toHaveBeenCalledWith(400);
        expect(response.json).toHaveBeenCalledWith({ msg: 'O id não pode estar vazio! ⚠' });
    });
});
