import { Router } from "express";
import { CreateTipoDePessoaController } from "../controllers/TipoDePessoa/CreateTipoDePessoaController";
import { CreatePessoaDadosPessoaisController } from "../controllers/pessoas/CreateDadosPessoaisController";
import { CreatePessoaDadosEscolaresController } from "../controllers/pessoas/CreatePessoaDadosEscolaresController";
import { FindAllTipoDePessoaController } from "../controllers/TipoDePessoa/FindAllTipoDePessoaController";
import { FindTipoDePessoaController } from "../controllers/TipoDePessoa/FindTipoDePessoaController";
import { FindAllPessoasCanceladasController } from "../controllers/TipoDePessoa/FindAllPessoasCanceladasController";
import { UpdatePessoaDadosEscolaresController } from "../controllers/pessoas/UpdatePessoaDadosEscolaresController";
import { UpdateEnderecoController } from "../controllers/endereco/UpdateEnderecoController";
import { UpdateDadosPessoasController } from "../controllers/dadosPessoas/UpdateDadosPessoasController";
import { DeleteAlunoController } from "../controllers/pessoas/DeletePessoaController";
import { FindAllDadosEscolaresController } from "../controllers/pessoas/FindAllDadosEscolaresController";

const router = Router();

const createTipoDePessoa = new CreateTipoDePessoaController();
const createPessoaDadosEscolar = new CreatePessoaDadosEscolaresController();
const createDadosPessoais = new CreatePessoaDadosPessoaisController();

const FindAllTipoDePessoa = new FindAllTipoDePessoaController();
const findTipoDePessoa = new FindTipoDePessoaController();
const findAllCancelados = new FindAllPessoasCanceladasController();
const findAllDadosEscolar = new FindAllDadosEscolaresController();

const updateDadosDocumentos = new UpdateDadosPessoasController();
const updateEndereco = new UpdateEnderecoController();
const updateDadosEscolares = new UpdatePessoaDadosEscolaresController();

const deletePessoa = new DeleteAlunoController();


router.post('/tipoDePessoa', createTipoDePessoa.handle);
router.post('/dadosPessoais', createDadosPessoais.handle);
router.post('/dadosEscolares', createPessoaDadosEscolar.handle);

router.get('/tipodepessoa/:id', findTipoDePessoa.handle);
router.get('/tipodepessoa', FindAllTipoDePessoa.handle);
router.get('/PessoasCanceladas', findAllCancelados.handle);
router.get('/dadosEscolares', findAllDadosEscolar.handle);


router.patch('/dadosDocumentos/:id', updateDadosDocumentos.handle);
router.patch('/endereco/:id', updateEndereco.handle);
router.patch('dadosEscolar/:id', updateDadosEscolares.handle);

router.patch('/delete/:id', deletePessoa.handle);




export { router };