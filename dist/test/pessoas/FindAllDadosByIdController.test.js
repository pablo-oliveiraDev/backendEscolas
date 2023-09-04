"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const FindAllDadosByIdController_1 = require("../../controllers/pessoas/FindAllDadosByIdController");
const prismaClient_1 = require("../../database/prismaClient");
describe('FindAllDadosByIdController', () => {
    it('should return a 200 status code and an array of objects when a valid id is provided', async () => {
        const request = {
            params: {
                id: 'validId'
            }
        };
        const response = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn()
        };
        prismaClient_1.prismaClient.dadosDocumento.findMany = jest.fn().mockResolvedValue([{ data: 'data' }]);
        const findController = new FindAllDadosByIdController_1.FindAllDadosByIdController();
        await findController.handle(request, response);
        expect(response.status).toHaveBeenCalledWith(200);
        expect(response.json).toHaveBeenCalledWith([{ data: 'data' }]);
        expect(prismaClient_1.prismaClient.dadosDocumento.findMany).toHaveBeenCalledWith({
            where: {
                id: Number(request.params.id),
            },
            include: {
                pessoaDadosPessoais: {
                    include: {
                        endereco: true
                    },
                },
                pessoaDadosEscolar: {
                    select: {
                        disciplina: true,
                        turma: true,
                        horario: true,
                        presenca: true,
                        nota: true,
                        especialidade: true,
                    },
                },
            },
        });
    });
});
