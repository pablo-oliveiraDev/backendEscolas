"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.DeleteAlunoController = void 0;
const prismaClient_1 = require("../../database/prismaClient");
class DeleteAlunoController {
    async handle(request, response) {
        const { id } = request.params;
        const verifyId = await prismaClient_1.prismaClient.pessoaDadosPessoais.findFirst({
            where: {
                id: Number(id),
            },
        });
        if (verifyId) {
            try {
                const aluno = await prismaClient_1.prismaClient.pessoaDadosPessoais.update({
                    where: {
                        id: Number(id),
                    },
                    data: {
                        dadosDocumentos: {
                            update: {
                                statusCadastro: false,
                                deleted_at: new Date().toString(),
                            },
                        },
                    },
                });
                return response.status(200).json({ msg: 'Aluno deletado com sucesso! 👍🏼' });
            }
            catch (error) {
                console.log(error.message);
                return response.status(404).json({ msg: 'Houve um erro inesperado!\nPor favor tente novamente!😥' });
            }
            ;
        }
        else {
            return response.status(400).json({ msg: 'Pessoa não encontrado! ⚠\nPor gentileza tente novamente!' });
        }
    }
    ;
}
exports.DeleteAlunoController = DeleteAlunoController;
;
