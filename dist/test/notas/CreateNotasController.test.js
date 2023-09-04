"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const CreateNotasController_1 = require("../../controllers/notas/CreateNotasController");
const prismaClient_1 = require("../../database/prismaClient");
describe('CreateEspecialidadeController', () => {
});
it('should return a success message with status code 200 when creating a new especialidade', () => {
});
it('should create a new nota with valid input data', async () => {
    const request = {
        body: {
            nomePessoa: "nome",
            cpf: "Cpf",
            tipoDePessoaId: 1,
            bimestre: 3,
            desempenho: "meu desempenho foi",
            nota: 45
        },
    };
    const response = {
        status: jest.fn().mockReturnThis(),
        json: jest.fn(),
    };
    prismaClient_1.prismaClient.pessoaDadosEscolar.create = jest.fn().mockResolvedValue({});
    prismaClient_1.prismaClient.dadosDocumento.findMany = jest.fn().mockResolvedValue([{ id: 1 }]);
    prismaClient_1.prismaClient.pessoaDadosEscolar.findMany = jest.fn().mockResolvedValue([{ idEndereco: 1 }]);
    const createNotasController = new CreateNotasController_1.CreateNotasController();
    await createNotasController.handle(request, response);
    expect(prismaClient_1.prismaClient.dadosDocumento.findMany).toHaveBeenCalledWith({
        where: {
            nome: 'nome',
            AND: {
                Cpf: 'Cpf',
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
    expect(response.json).toHaveBeenCalledWith({ msg: 'Nota inserida com sucesso!' });
});
