import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';
interface UpdateNotasBody {
    bimMod: number,
    desempenho: string,
    nota: number,
};
export class UpdateNotasController {
    async handle(request: Request, response: Response) {
        const {
            bimMod,
            desempenho,
            nota
        }: UpdateNotasBody = request.body;
        const { id } = request.params;
        const UpdateNotas = await prismaClient.nota.update({
            where: {
                id: Number(id)
            },
            data: {
                bimMod:bimMod,
                desempenho:desempenho,
                nota:nota
            },
        });
        return response.status(201).json({ msg: "Notas atualizadas com sucesso!" });
    }
}