"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const FindDadosPessoaByNameController_1 = require("../../controllers/pessoas/FindDadosPessoaByNameController");
describe('FindDadosPessoaByNameController', () => {
    it('should return 200 status code and an array of objects when valid nome and sobrenome are provided', async () => {
        const request = {
            body: {
                nome: 'nome',
                sobrenome: 'Sobrenome',
            },
        };
        const response = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn(),
        };
        const findDadosPessoaByNameController = new FindDadosPessoaByNameController_1.FindDadosPessoaByNameController();
        await findDadosPessoaByNameController.handle(request, response);
        expect(response.status).toHaveBeenCalledWith(200);
        expect(response.json).toHaveBeenCalledWith(expect.arrayContaining([]));
    });
});
