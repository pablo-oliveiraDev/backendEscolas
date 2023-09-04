"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const FindAllDadosEscolaresController_1 = require("../../controllers/pessoas/FindAllDadosEscolaresController");
describe('FindAllDadosEscolaresController', () => {
    it('should return a 200 status code and an array of pessoaDadosEscolar objects when called with valid request and response objects', async () => {
        const request = {};
        const response = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn()
        };
        const controller = new FindAllDadosEscolaresController_1.FindAllDadosEscolaresController();
        await controller.handle(request, response);
        expect(response.status).toHaveBeenCalledWith(200);
        expect(response.json).toHaveBeenCalledWith(expect.arrayContaining([]));
    });
});
