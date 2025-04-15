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

 
 INSERT INTO aluno (id, nome, cr, telefone, uf) VALUES
 (1, 'Alice', 8.5, '21999999999', 'RJ'),
 (2, 'Bruno', 7.2, '21988888888', 'RJ'),
 (3, 'Carlos', 9.1, '21977777777', 'SP'),
 (4, 'Caio', 7.8, '21997470513', 'RJ'),
 (5, 'Jay', 8.5, '21997473884', 'MG'),
 (6, 'Reinaldo', 7.2, '992229712', 'PE'),
 (7, 'Arrascaeta', 9.7, '21997470512', 'RJ'),
 (8, 'Júlia', 9.6, '21997470511', 'RJ');
 
 INSERT INTO curso (id, titulo, carga_horaria) VALUES
 (1, 'Sistemas de Informação', 3000),
 (2, 'Ciência da Computação', 3200);
 
 INSERT INTO disciplina (id, nome, ch, id_curso) VALUES
 (10, 'BD1', 60, 1),
 (11, 'BD2', 60, 1),
 (12, 'BD3', 60, 1),
 (13, 'Engenharia de Software', 60, 1),
 (14, 'Estrutura de Dados', 60, 1),
 (15, 'Sistemas Distribuídos', 60, 1),
 (16, 'Programação I', 60, 2),
 (17, 'Desenvolvimento de Jogos', 60, 2),
 (18, 'Desenvolvimento Web', 60, 2),
 (19, 'Redes de Computadores', 60, 1);
 
 INSERT INTO professor (siape, nome, titulacao) VALUES
 (1000, 'Prof. João', 'Mestre'),
 (1001, 'Prof. Maria', 'Doutora'),
 (1002, 'Prof. Isabel', 'Doutora'),
 (1003, 'Prof. Guerra', 'Mestre'),
 (1004, 'Prof. Daniel', 'Mestre'),
 (1005, 'Prof. Igor', 'Doutor');
 
 INSERT INTO turma (id, cod, ano, semestre, siape) VALUES
 (11, 1, '2024-01-01', '1', 1004), 
 (12, 1, '2024-01-01', '1', 1001), 
 (10, 1, '2024-01-01', '1', 1000), 
 (14, 1, '2024-01-01', '1', 1002),
 (15, 1, '2024-01-01', '1', 1003),
 (16, 1, '2024-01-01', '1', 1005),
 (14, 1, '2024-01-01', '2', 1005);
 
 INSERT INTO matricula (id_aluno, id, cod, ano, semestre) VALUES
 (1, 11, 1, '2024-01-01', '1'), 
 (2, 12, 1, '2024-01-01', '1'), 
 (3, 14, 1, '2024-01-01', '1'), 
 (3, 11, 1, '2024-01-01', '1'), 
 (4, 14, 1, '2024-01-01', '1'),
 (4, 15, 1, '2024-01-01', '1'),
 (5, 16, 1, '2024-01-01', '1'),
 (7, 14, 1, '2024-01-01', '2'),
 (8, 14, 1, '2024-01-01', '1'),
 (6, 12, 1, '2024-01-01', '1');
 
 SELECT aluno.nome, disciplina.nome
 FROM aluno JOIN matricula ON aluno.id = matricula.id_aluno
 JOIN turma ON matricula.id = turma.id
 AND matricula.cod = turma.cod
 AND matricula.ano = turma.ano
 AND matricula.semestre = turma.semestre
 JOIN disciplina ON turma.id = disciplina.id
 WHERE disciplina.nome = 'BD2' OR 
 disciplina.nome = 'BD3';


SELECT COUNT(DISTINCT aluno.id) AS numero_de_alunos
FROM aluno 
JOIN matricula ON aluno.id = matricula.id_aluno
JOIN turma ON matricula.id = turma.id
AND matricula.cod = turma.cod
AND matricula.ano = turma.ano
AND matricula.semestre = turma.semestre
JOIN disciplina ON turma.id = disciplina.id
JOIN professor ON turma.siape = professor.siape
WHERE disciplina.nome = 'Estrutura de Dados' 
AND professor.nome = 'Prof. Isabel'
AND matricula.semestre = '2';

SELECT COUNT(turma.id)
FROM turma JOIN professor ON  turma.siape = professor.siape
WHERE professor.titulacao = 'Mestre';


DROP TABLE IF EXISTS matricula CASCADE;
DROP TABLE IF EXISTS turma CASCADE;
DROP TABLE IF EXISTS disciplina CASCADE;
DROP TABLE IF EXISTS curso CASCADE;
DROP TABLE IF EXISTS aluno CASCADE;
DROP TABLE IF EXISTS professor CASCADE;

 