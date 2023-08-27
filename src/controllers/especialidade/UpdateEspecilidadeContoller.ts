import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';
interface UpdateEscialidadeBody {
especialidade:string,
};
export class UpdateEspecilidadeContoller {
    async handle(request: Request, response: Response) {
        const {
            especialidade
        }: UpdateEscialidadeBody = request.body;
        const { id } = request.params;
        const UpdateEscialidade = await prismaClient.especilidade.update({
            where:{
                id:Number(id)
            },
            data:{
                especialidade:especialidade
            },
        });
        return response.status(201).json({ msg: "Especialidade atualizada com sucesso!" });
    }
}