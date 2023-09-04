"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const CreateEspecialidadeController_1 = require("../../controllers/especialidade/CreateEspecialidadeController");
const prismaClient_1 = require("../../database/prismaClient");
describe('CreateEspecialidadeController', () => {
});
it('should return a success message with status code 200 when creating a new especialidade', () => {
});
it('should create a new especialidade with valid input data', async () => {
    const request = {
        body: {
            nomePessoa: 'John Doe',
            cpf: '123456789',
            tipoDePessoaId: 1,
            tipoEspecialidade: 'Math',
        },
    };
    const response = {
        status: jest.fn().mockReturnThis(),
        json: jest.fn(),
    };
    prismaClient_1.prismaClient.pessoaDadosEscolar.create = jest.fn().mockResolvedValue({});
    prismaClient_1.prismaClient.dadosDocumento.findMany = jest.fn().mockResolvedValue([{ id: 1 }]);
    prismaClient_1.prismaClient.pessoaDadosEscolar.findMany = jest.fn().mockResolvedValue([{ idEndereco: 1 }]);
    const createEspecialidadeController = new CreateEspecialidadeController_1.CreateEspecialidadeController();
    await createEspecialidadeController.handle(request, response);
    expect(prismaClient_1.prismaClient.dadosDocumento.findMany).toHaveBeenCalledWith({
        where: {
            nome: 'John Doe',
            AND: {
                Cpf: '123456789',
            },
        },
        take: 1,
    });
    expect(prismaClient_1.prismaClient.pessoaDadosEscolar.findMany).toHaveBeenCalledWith({
        where: {
            idDadosDocumento: 1,
        },
    });
    expect(response.status).toHaveBeenCalledWith(200);
    expect(response.json).toHaveBeenCalledWith({ msg: 'Especialidade criada com sucesso!' });
});
