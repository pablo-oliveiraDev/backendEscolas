
import { CreateAlunoDadosPessoaisController } from "../controllers/pessoas/CreateDadosPessoaisController";
import { DeleteAlunoController } from "../controllers/pessoas/DeletePessoaController";
import { FindAllAlunoController } from "../controllers/pessoas/FindAllPessoasController";
import { FindUniqAlunoController } from "../controllers/pessoas/FindUniqPessoaController";
import { CreateEnderecoController } from "../controllers/pessoas/CreateEnderecoController";
import { CreateTipoDePessoaController } from "../controllers/TipoDePessoa/CreateTipoDePessoaController";
import { Router } from "express";
import { CreatePessoaDadosEscolaresController } from "../controllers/pessoas/CreatePessoaDadosEscolaresController";

const router = Router();

const createTipoDePessoa = new CreateTipoDePessoaController();
const createPessoaDadosEscolar = new CreatePessoaDadosEscolaresController();

const createDadosPessoais = new CreateAlunoDadosPessoaisController();
const deletePessoa = new DeleteAlunoController();
const findAllPessoa = new FindAllAlunoController();
const findUniqPessoa = new FindUniqAlunoController();
const createEndereco = new CreateEnderecoController();


router.post('/tipoDePessoa', createTipoDePessoa.handle);
router.post('/dadosPessoais', createDadosPessoais.handle);
router.post('/endereco', createEndereco.handle);
router.post('/dadosEscolares', createPessoaDadosEscolar.handle);
router.patch('/pessoa/:id', deletePessoa.handle);
router.get('/pessoas', findAllPessoa.handle);
router.get('/pessoa/:id', findUniqPessoa.handle);



export { router };