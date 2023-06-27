-- AlterTable
CREATE SEQUENCE alunos_dados_pessoais_id_aluno_seq;
CREATE SEQUENCE alunos_dados_pessoais_id_pessoa_seq;
CREATE SEQUENCE alunos_dados_pessoais_id_endereco_seq;
CREATE SEQUENCE alunos_dados_pessoais_id_responsavel_seq;
CREATE SEQUENCE alunos_dados_pessoais_id_pagto_mes_seq;
ALTER TABLE "alunos_dados_pessoais" ALTER COLUMN "id_aluno" SET DEFAULT nextval('alunos_dados_pessoais_id_aluno_seq'),
ALTER COLUMN "id_pessoa" SET DEFAULT nextval('alunos_dados_pessoais_id_pessoa_seq'),
ALTER COLUMN "id_endereco" SET DEFAULT nextval('alunos_dados_pessoais_id_endereco_seq'),
ALTER COLUMN "id_responsavel" SET DEFAULT nextval('alunos_dados_pessoais_id_responsavel_seq'),
ALTER COLUMN "id_pagto_mes" SET DEFAULT nextval('alunos_dados_pessoais_id_pagto_mes_seq');
ALTER SEQUENCE alunos_dados_pessoais_id_aluno_seq OWNED BY "alunos_dados_pessoais"."id_aluno";
ALTER SEQUENCE alunos_dados_pessoais_id_pessoa_seq OWNED BY "alunos_dados_pessoais"."id_pessoa";
ALTER SEQUENCE alunos_dados_pessoais_id_endereco_seq OWNED BY "alunos_dados_pessoais"."id_endereco";
ALTER SEQUENCE alunos_dados_pessoais_id_responsavel_seq OWNED BY "alunos_dados_pessoais"."id_responsavel";
ALTER SEQUENCE alunos_dados_pessoais_id_pagto_mes_seq OWNED BY "alunos_dados_pessoais"."id_pagto_mes";
