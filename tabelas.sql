create database mydb;
create table mydb.curso(
codigo_curso varchar(255),
nome text(255) NOT NULL,
PRIMARY KEY (codigo_curso)
);

create table mydb.Aluno(
matricula_aluno varchar(255),
nota_vestibular decimal NOT NULL,
codigo_curso varchar(255) NOT NULL,
PRIMARY KEY (matricula_aluno),
FOREIGN KEY (codigo_curso) references mydb.curso(codigo_curso)
);

create table mydb.Turma(
ano_semestre varchar(255) ,
codigo_disciplina varchar(255) NOT NULL,
codigo_curso varchar(255) NOT NULL,
PRIMARY KEY (ano_semestre),
FOREIGN KEY (codigo_curso) references mydb.curso(codigo_curso),
FOREIGN KEY (codigo_disciplina) references mydb.Disciplina(codigo_disciplina)
);

create table mydb.Professor(
matricula_professor varchar(255),
data_admissao varchar(255),
matricula_lider varchar(255),
PRIMARY KEY (matricula_professor)
);

create table mydb.Disciplina(
codigo_disciplina varchar(255) ,
ementa varchar(255) NOT NULL,
conteudo varchar(255) NOT NULL,
matricula_professor varchar(255) NOT NULL,
primary key (codigo_disciplina),
FOREIGN KEY (matricula_professor) references mydb.Professor(matricula_professor)
);

create table mydb.Pessoa(
matricula_pessoa varchar(255),
sexo varchar(255),
nome varchar(255),
PRIMARY KEY (matricula_pessoa)
);

create table mydb.Ministra(
ano_semestre varchar(255),
codigo_disciplina varchar(255),
codigo_curso varchar(255),
matricula_professor varchar(255),
FOREIGN KEY (matricula_professor) references mydb.Professor(matricula_professor),
FOREIGN KEY (codigo_curso) references mydb.curso(codigo_curso),
FOREIGN KEY (codigo_disciplina) references mydb.Disciplina(codigo_disciplina),
FOREIGN KEY (ano_semestre) references mydb.Turma(ano_semestre)
);

create table mydb.Projeto(
codigo_projeto varchar(255),
titulo int NOT NULL,
conceito int NOT NULL,
hp int NOT NULL,
PRIMARY KEY (codigo_projeto)
);

#Criando indice para que a matricula_aluno não gere erro
CREATE INDEX idx_matricula_aluno ON mydb.aluno(matricula_aluno);

create table mydb.Aluno_turma(
ano_semestre varchar(255),
codigo_disciplina varchar(255),
codigo_curso varchar(255),
matricula_aluno varchar(255),
codigo_projeto varchar(255),
FOREIGN KEY (codigo_curso) references mydb.curso(codigo_curso),
FOREIGN KEY (codigo_disciplina) references mydb.Disciplina(codigo_disciplina),
FOREIGN KEY (ano_semestre) references mydb.Turma(ano_semestre),
FOREIGN KEY (matricula_aluno) references mydb.aluno(matricula_aluno),
FOREIGN KEY (codigo_projeto) references  mydb.projeto(codigo_projeto)
);

create table mydb.Prova(
ano_semestre varchar(255),
codigo_disciplina varchar(255),
codigo_curso varchar(255),
matricula_aluno varchar(255),
descrição varchar(255),
nota varchar(255),
FOREIGN KEY (codigo_curso) references mydb.curso(codigo_curso),
FOREIGN KEY (codigo_disciplina) references mydb.Disciplina(codigo_disciplina),
FOREIGN KEY (ano_semestre) references mydb.Turma(ano_semestre),
FOREIGN KEY (matricula_aluno) references mydb.aluno(matricula_aluno),
PRIMARY KEY (descrição)
);

create table mydb.monitoria(
ano_semestre varchar(255),
codigo_disciplina varchar(255),
codigo_curso varchar(255),
matricula_professor varchar(255),
matricula_aluno varchar(255),
FOREIGN KEY (matricula_professor) references mydb.Professor(matricula_professor),
FOREIGN KEY (codigo_curso) references mydb.curso(codigo_curso),
FOREIGN KEY (codigo_disciplina) references mydb.Disciplina(codigo_disciplina),
FOREIGN KEY (ano_semestre) references mydb.Turma(ano_semestre),
FOREIGN KEY (matricula_aluno) references mydb.aluno(matricula_aluno)
);