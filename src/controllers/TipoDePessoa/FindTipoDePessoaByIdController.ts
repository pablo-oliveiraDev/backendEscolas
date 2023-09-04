import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';

export class FindTipoDePessoaByIdController {
   async handle(request: Request, response: Response) {
      const { id } = request.params;
      const tipoDePessoa = await prismaClient.tipoDePessoa.findUnique({
         where: {
            id: Number(id)
         },
         include:{
            PessoaDadosPessoais:{
               include:{
                  endereco: true,
                  dadosDocumentos: true,
                  pagtoMes: true
               },
            },
         },
      });
      return response.status(200).json(tipoDePessoa);
   };
};