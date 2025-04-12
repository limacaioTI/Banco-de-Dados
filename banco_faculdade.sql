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
(3, 'Carlos', 9.1, '21977777777', 'SP'),
(4, 'Caio', 9.7, '21997470513', 'RJ'),
(5, 'Daniela', 8.9, '21991112222', 'MG'),
(6, 'Eduardo', 6.8, '11988889999', 'SP'),
(7, 'Fernanda', 7.5, '31997776666', 'MG'),
(8, 'Gustavo', 9.3, '21993334444', 'RJ'),
(9, 'Helena', 8.2, '41992221111', 'PR'),
(10, 'Igor', 5.7, '21995556666', 'RJ'),
(11, 'Julia', 9.8, '31990001111', 'MG'),
(12, 'Lucas', 7.0, '21991110000', 'RJ'),
(13, 'Mariana', 8.0, '31998887777', 'MG'),
(14, 'Nicolas', 6.4, '11996665555', 'SP'),
(15, 'Olívia', 9.5, '21994443333', 'RJ');

-- Curso
INSERT INTO curso (id, titulo, carga_horaria) VALUES
(1, 'Sistemas de Informação', 3000),
(2, 'Ciência da computação', 3200),
(3, 'Engenharia Elétrica', 3600),
(4, 'Direito', 4000),
(5, 'Psicologia', 3600),
(6, 'Engenharia Mecânica', 3700),
(7, 'Arquitetura', 3900),
(8, 'Medicina', 8000);

-- Disciplinas
INSERT INTO disciplina (id, nome, ch, id_curso) VALUES
(10, 'BD1', 60, 1),
(11, 'BD2', 60, 1),
(12, 'BD3', 60, 1),
(13, 'Engenharia de Software', 60, 1),
(14, 'Estrutura de Dados', 60, 1),
(15, 'Circuitos Elétricos', 80, 3),
(16, 'Direito Constitucional', 100, 4),
(17, 'Psicologia Social', 60, 5),
(18, 'Mecânica dos Fluidos', 90, 6),
(19, 'Desenho Arquitetônico', 70, 7),
(20, 'Anatomia Humana', 120, 8),
(21, 'Psicanálise', 60, 5),
(22, 'Bioética', 40, 8),
(23, 'Eletrônica Digital', 80, 3),
(24, 'Cálculo I', 90, 1),
(25, 'Cálculo II', 90, 1);

-- Professores
INSERT INTO professor (siape, nome, titulacao) VALUES
(1000, 'Prof. João', 'Mestre'),
(1001, 'Prof. Maria', 'Doutora'),
(1002, 'Prof. Isabel', 'Mestre'),
INSERT INTO professor (siape, nome, titulacao) VALUES
(1003, 'Prof. Roberto', 'Doutor'),
(1004, 'Prof. Cláudia', 'Mestre'),
(1005, 'Prof. Paulo', 'Especialista'),
(1006, 'Prof. Letícia', 'Doutora'),
(1007, 'Prof. André', 'Mestre'),
(1008, 'Prof. Simone', 'Doutora'),
(1009, 'Prof. Fábio', 'Mestre'),
(1010, 'Prof. Ana', 'Doutora');


-- Turmas
INSERT INTO turma (id, cod, ano, semestre, siape) VALUES
(11, 1, '2024-01-01', '1', 1000), -- BD2
(12, 1, '2024-01-01', '1', 1001), -- BD3
(10, 1, '2024-01-01', '1', 1000), -- BD1
(14, 1, '2024-01-01', '1', 1002),
(15, 1, '2023-01-01', '1', 1003), -- Circuitos Elétricos
(16, 1, '2023-01-01', '1', 1004), -- Direito Constitucional
(17, 1, '2023-01-01', '2', 1005), -- Psicologia Social
(18, 1, '2023-01-01', '2', 1006), -- Mecânica dos Fluidos
(19, 1, '2024-01-01', '1', 1007), -- Desenho Arquitetônico
(20, 1, '2024-01-01', '2', 1008), -- Anatomia Humana
(21, 1, '2024-01-01', '2', 1006), -- Psicanálise
(22, 1, '2024-01-01', '2', 1009), -- Bioética
(23, 1, '2023-01-01', '2', 1010), -- Eletrônica Digital
(24, 1, '2022-01-01', '1', 1000), -- Cálculo I
(25, 1, '2022-01-01', '2', 1001); -- Cálculo II

-- Matrículas
INSERT INTO matricula (id_aluno, id, cod, ano, semestre) VALUES
(1, 11, 1, '2024-01-01', '1'), -- Alice em BD2
(2, 12, 1, '2024-01-01', '1'), -- Bruno em BD3
(3, 10, 1, '2024-01-01', '1'), -- Carlos em BD1
(3, 11, 1, '2024-01-01', '1'), -- Carlos também em BD2
(1, 14, 1, '2024-01-01', '2'),
(3, 14, 1, '2024-01-01', '2'),
(4, 14, 1, '2024-01-01', '2'),
(5, 15, 1, '2023-01-01', '1'),
(6, 16, 1, '2023-01-01', '1'),
(7, 17, 1, '2023-01-01', '2'),
(8, 18, 1, '2023-01-01', '2'),
(9, 19, 1, '2024-01-01', '1'),
(10, 20, 1, '2024-01-01', '2'),
(11, 21, 1, '2024-01-01', '2'),
(12, 22, 1, '2024-01-01', '2'),
(13, 23, 1, '2023-01-01', '2'),
(14, 24, 1, '2022-01-01', '1'),
(15, 25, 1, '2022-01-01', '2'),
(5, 21, 1, '2024-01-01', '2'),
(6, 15, 1, '2023-01-01', '1'),
(7, 16, 1, '2023-01-01', '1'),
(8, 17, 1, '2023-01-01', '2'),
(9, 18, 1, '2023-01-01', '2'),
(10, 19, 1, '2024-01-01', '1'),
(11, 20, 1, '2024-01-01', '2');

SELECT aluno.nome, disciplina.nome
FROM aluno JOIN matricula ON aluno.id = matricula.id_aluno
JOIN turma ON matricula.id = turma.id
AND matricula.cod = turma.cod
AND matricula.ano = turma.ano
AND matricula.semestre = turma.semestre
JOIN disciplina ON turma.id = disciplina.id
WHERE disciplina.nome = 'BD2' OR 
disciplina.nome = 'BD3';

