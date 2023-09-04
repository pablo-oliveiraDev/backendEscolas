"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const FindPessoaByCpfController_1 = require("../../controllers/pessoas/FindPessoaByCpfController");
describe('FindPessoaByCpfController', () => {
    it('should return 200 status code and an array of objects when given a valid cpf', async () => {
        const request = {
            body: {
                cpf: 'valid_cpf'
            }
        };
        const response = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn()
        };
        const controller = new FindPessoaByCpfController_1.FindPessoaByCpfController();
        await controller.handle(request, response);
        console.log(response.json);
        expect(response.status).toHaveBeenCalledWith(200);
        expect(response.json).toHaveBeenCalledWith(expect.arrayContaining([]));
    });
    it('should return 500 status code and an msg ', async () => {
        const request = {
            body: {
                cpf: ''
            }
        };
        const response = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn()
        };
        const controller = new FindPessoaByCpfController_1.FindPessoaByCpfController();
        await controller.handle(request, response);
        console.log(response.json);
        expect(response.status).toHaveBeenCalledWith(500);
        expect(response.json).toHaveBeenCalledWith({ msg: 'Por gentileza digite um cpf para efetuar a pesquisa!' });
    });
});
