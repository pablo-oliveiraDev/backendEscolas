import { FindAllDadosByIdController } from "../../controllers/pessoas/FindAllDadosByIdController";
import { prismaClient } from '../../database/prismaClient';
import { Request, Response } from "express";


describe('FindAllDadosByIdController', () => {
    // Test that the handle method of FindAllDadosByIdController returns a 200 status code and an array of objects containing all data related to the given id
    it('should return a 200 status code and an array of objects when a valid id is provided', async () => {
        // Arrange
        const request = {
            params: {
                id: 'validId'
            }
        } as unknown as Request;
        const response = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn()
        } as unknown as Response;
        //mock method
        prismaClient.dadosDocumento.findMany = jest.fn().mockResolvedValue([{ data: 'data' }]);

        const findController = new FindAllDadosByIdController();
        // Act
        await findController.handle(request, response);
        // Assert
        expect(response.status).toHaveBeenCalledWith(200);
        expect(response.json).toHaveBeenCalledWith([{ data: 'data' }]);
        //verify method
        expect(prismaClient.dadosDocumento.findMany).toHaveBeenCalledWith({
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