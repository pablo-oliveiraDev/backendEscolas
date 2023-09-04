import { Request, Response } from "express";
import { FindAllDadosEscolaresController } from "../../controllers/pessoas/FindAllDadosEscolaresController";


describe('FindAllDadosEscolaresController', () => {
    // Test that the handle method of FindAllDadosEscolaresController returns a 200 status code and an array of pessoaDadosEscolar objects
    it('should return a 200 status code and an array of pessoaDadosEscolar objects when called with valid request and response objects', async () => {
      // Mock request and response objects
      const request = {} as Request;
      const response = {
        status: jest.fn().mockReturnThis(),
        json: jest.fn()
      } as unknown as Response;
       // prismaClient.dadosDocumento.findMany = jest.fn().mockResolvedValueOnce([]);
      // Call the handle method
      const controller = new FindAllDadosEscolaresController();
     await controller.handle(request, response);

      // Check if the status code is 200
      expect(response.status).toHaveBeenCalledWith(200);

      // Check if the response json is an array of pessoaDadosEscolar objects
      expect(response.json).toHaveBeenCalledWith(expect.arrayContaining([]));
    });
});