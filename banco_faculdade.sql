CREATE TABLE aluno(
  id INT,
  nome VARCHAR(100),
  cr DECIMAL(3,2),
  telefone VARCHAR(20),
  uf CHAR(2),
  PRIMARY KEY(id)
);

CREATE TABLE curso(
  id INT,
  titulo VARCHAR(100),
  carga_horaria INT,
  PRIMARY KEY(id)
);

CREATE TABLE disciplina(
  id INT,
  nome VARCHAR(100),
  ch INT,
  id_curso INT,
  PRIMARY KEY(id),
  FOREIGN KEY(id_curso) REFERENCES curso(id)
);

CREATE TABLE professor(
  siape INT,
  nome VARCHAR(100),
  titulacao VARCHAR(100),
  PRIMARY KEY(siape)
);

CREATE TABLE turma(
  id INT,
  cod INT,
  ano DATE,
  semestre VARCHAR(100),
  siape INT,
  PRIMARY KEY(id, cod, ano, semestre),
  FOREIGN KEY(id) REFERENCES disciplina(id),
  FOREIGN KEY(siape) REFERENCES professor(siape)
);

CREATE TABLE matricula(
  id_aluno INT,
  id INT,
  cod INT,
  ano DATE,
  semestre VARCHAR(100),
  PRIMARY KEY(id_aluno, id, cod, ano, semestre),
  FOREIGN KEY(id_aluno) REFERENCES aluno(id),
  FOREIGN KEY(id, cod, ano, semestre) REFERENCES turma(id, cod, ano, semestre)
);

-- Alunos
INSERT INTO aluno (id, nome, cr, telefone, uf) VALUES
(1, 'Alice', 8.5, '21999999999', 'RJ'),
(2, 'Bruno', 7.2, '21988888888', 'RJ'),
(3, 'Carlos', 9.1, '21977777777', 'SP');

-- Curso
INSERT INTO curso (id, titulo, carga_horaria) VALUES
(1, 'Sistemas de Informação', 3000);

-- Disciplinas
INSERT INTO disciplina (id, nome, ch, id_curso) VALUES
(10, 'BD1', 60, 1),
(11, 'BD2', 60, 1),
(12, 'BD3', 60, 1),
(13, 'Engenharia de Software', 60, 1);

-- Professores
INSERT INTO professor (siape, nome, titulacao) VALUES
(1000, 'Prof. João', 'Mestre'),
(1001, 'Prof. Maria', 'Doutora');

-- Turmas
INSERT INTO turma (id, cod, ano, semestre, siape) VALUES
(11, 1, '2024-01-01', '1', 1000), -- BD2
(12, 1, '2024-01-01', '1', 1001), -- BD3
(10, 1, '2024-01-01', '1', 1000); -- BD1

-- Matrículas
INSERT INTO matricula (id_aluno, id, cod, ano, semestre) VALUES
(1, 11, 1, '2024-01-01', '1'), -- Alice em BD2
(2, 12, 1, '2024-01-01', '1'), -- Bruno em BD3
(3, 10, 1, '2024-01-01', '1'), -- Carlos em BD1
(3, 11, 1, '2024-01-01', '1'); -- Carlos também em BD2

SELECT aluno.nome, disciplina.nome
FROM aluno JOIN matricula ON aluno.id = matricula.id_aluno
JOIN turma ON matricula.id = turma.id
AND matricula.cod = turma.cod
AND matricula.ano = turma.ano
AND matricula.semestre = turma.semestre
JOIN disciplina ON turma.id = disciplina.id
WHERE disciplina.nome = 'BD2' OR 
disciplina.nome = 'BD3';

