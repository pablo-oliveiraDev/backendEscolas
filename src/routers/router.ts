import { Router } from "express";
import { CreateTipoDePessoaController } from "../controllers/TipoDePessoa/CreateTipoDePessoaController";
import { CreatePessoaDadosPessoaisController } from "../controllers/pessoas/CreateDadosPessoaisController";
import { CreatePessoaDadosEscolaresController } from "../controllers/pessoas/CreatePessoaDadosEscolaresController";
import { CreateTurmasController } from "../controllers/Turmas/CreateTurmasController"
import { CreatePresencaController } from "../controllers/presenca/CreatePresencaController";
import { CreateNotasController } from "../controllers/notas/CreateNotasController";
import { CreateEspecialidadeController } from "../controllers/especialidade/CreateEspecialidadeController";

import { FindAllTipoDePessoaController } from "../controllers/TipoDePessoa/FindAllTipoDePessoaController";
import { FindTipoDePessoaByIdController } from "../controllers/TipoDePessoa/FindTipoDePessoaByIdController";
import { FindAllPessoasCanceladasController } from "../controllers/TipoDePessoa/FindAllPessoasCanceladasController";
import { FindDadosPessoaByNameController } from "../controllers/pessoas/FindDadosPessoaByNameController";
import { FindPessoaByCpfController } from "../controllers/pessoas/FindPessoaByCpfController";
import { FindAllDadosByIdController } from "../controllers/pessoas/FindAllDadosByIdController";
import { FindAllDadosEscolaresController } from "../controllers/pessoas/FindAllDadosEscolaresController";

import { UpdatePessoaDadosEscolaresController } from "../controllers/pessoas/UpdatePessoaDadosEscolaresController";
import { UpdateEnderecoController } from "../controllers/endereco/UpdateEnderecoController";
import { UpdateDadosPessoasController } from "../controllers/dadosPessoas/UpdateDadosPessoasController";
import { UpdateEspecilidadeContoller } from "../controllers/especialidade/UpdateEspecilidadeContoller";
import { DeleteAlunoController } from "../controllers/pessoas/DeletePessoaController";

const router = Router();

const createTipoDePessoa = new CreateTipoDePessoaController();
const createPessoaDadosEscolar = new CreatePessoaDadosEscolaresController();
const createDadosPessoais = new CreatePessoaDadosPessoaisController();
const createTurmas = new CreateTurmasController();
const createPresenca = new CreatePresencaController();
const createNota = new CreateNotasController();
const createEspecialidade = new CreateEspecialidadeController();


const FindAllTipoDePessoa = new FindAllTipoDePessoaController();
const findTipoDePessoa = new FindTipoDePessoaByIdController();
const findAllCancelados = new FindAllPessoasCanceladasController();
const findAllDadosEscolar = new FindAllDadosEscolaresController();
const findDadosByName = new FindDadosPessoaByNameController();
const findDadosByCpf = new FindPessoaByCpfController();
const findAllDadosById = new FindAllDadosByIdController();

const updateDadosDocumentos = new UpdateDadosPessoasController();
const updateEndereco = new UpdateEnderecoController();
const updateDadosEscolares = new UpdatePessoaDadosEscolaresController();
const UpdateEspecilidade = new UpdateEspecilidadeContoller();


const deletePessoa = new DeleteAlunoController();


router.post('/tipoDePessoa', createTipoDePessoa.handle);
router.post('/dadosPessoais', createDadosPessoais.handle);
router.post('/dadosEscolares', createPessoaDadosEscolar.handle);
router.post('/turmas', createTurmas.handle);
router.post('/presenca', createPresenca.handle);
router.post('/notas', createNota.handle);
router.post('/especialidades', createEspecialidade.handle);

router.get('/tipodepessoa/:id', findTipoDePessoa.handle);
router.get('/tipodepessoa', FindAllTipoDePessoa.handle);
router.get('/PessoasCanceladas', findAllCancelados.handle);
router.get('/dadosEscolares', findAllDadosEscolar.handle);
router.get('/dadosPessoaByName', findDadosByName.handle);
router.get('/dadosPessoaByCpf', findDadosByCpf.handle);
router.get('/allDados/:id', findAllDadosById.handle);


router.patch('/dadosDocumentos/:id', updateDadosDocumentos.handle);
router.patch('/endereco/:id', updateEndereco.handle);
router.patch('/dadosEscolar/:id', updateDadosEscolares.handle);
router.patch('/especialidade/:id', UpdateEspecilidade.handle);

router.patch('/delete/:id', deletePessoa.handle);




export { router };