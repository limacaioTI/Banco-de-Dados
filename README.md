📚 Sistema Acadêmico SQL
Projeto desenvolvido com foco em modelagem de banco de dados relacional usando PostgreSQL. Ele simula um sistema acadêmico simples com tabelas de alunos, cursos, disciplinas, professores, turmas e matrículas.

🛠️ Tecnologias Utilizadas
PostgreSQL

Modelo relacional

📋 Estrutura do Banco
O banco foi modelado com as seguintes entidades:

aluno: informações dos estudantes (nome, CR, telefone, estado)

curso: dados dos cursos oferecidos

disciplina: disciplinas associadas aos cursos

professor: docentes e suas titulações

turma: turmas ministradas por professores

matricula: relação entre alunos e turmas

Com uso de chaves primárias e estrangeiras para garantir integridade referencial.


🔍 Consultas de Exemplo
Inclui exemplos práticos de queries SQL, como:

Alunos matriculados em BD2 ou BD3

Número de alunos que cursaram "Estrutura de Dados" com a professora Isabel, no segundo semestre

Contagem de turmas ministradas por professores com titulação "Mestre"

SIAPE de professores que deram aula para cursos diferentes do curso 1

ID das turmas de 2023/2 com disciplinas de carga horária ≥ 60h

🧹 Limpeza do Banco
Ao final do script, estão os comandos DROP TABLE com CASCADE para facilitar a reinicialização do banco durante os testes.

🚀 Como Executar
Copie todo o conteúdo do script .sql

Abra seu terminal ou GUI preferida (como pgAdmin)

Execute o script em um banco PostgreSQL válido

👨‍💻 Sobre o Projeto
Esse projeto tem fins educacionais, ideal para praticar:

Criação de tabelas com relacionamentos

Inserção e manipulação de dados

Escrita de consultas com JOIN, WHERE, COUNT, DISTINCT, etc.
