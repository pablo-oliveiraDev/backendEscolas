"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.DeleteAlunoController = void 0;
const prismaClient_1 = require("../../database/prismaClient");
class DeleteAlunoController {
    constructor(statusCadastro) {
        this.statusCadastro = false;
    }
    ;
    async handle(request, response) {
        const { id } = request.params;
        if (id) {
            try {
                const aluno = await prismaClient_1.prismaClient.pessoaDadosPessoais.update({
                    where: {
                        id: Number(id)
                    },
                    data: {
                        dadosDocumentos: {
                            update: {
                                statusCadastro: this.statusCadastro,
                                deleted_at: new Date().toString()
                            }
                        }
                    },
                });
                return response.status(200).json({ msg: 'Aluno deletado com sucesso! 👍🏼' });
            }
            catch (error) {
                return response.status(404).json({ msg: 'Houve um erro inesperado!\nPor favor tente novamente!😥' });
            }
            ;
        }
        else {
            return response.status(400).json({ msg: 'O id não pode estar vazio! ⚠' });
        }
    }
    ;
}
exports.DeleteAlunoController = DeleteAlunoController;
;
