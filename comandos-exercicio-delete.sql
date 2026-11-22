/*
  1. Exclua da tabela tb_aluno o registro do aluno Selton Mello 
  (matrícula '202606').
*/
select * from academico.tb_aluno where matricula = '202606';
delete from academico.tb_aluno where matricula = '202606';
   
/*
  2. A instituição decidiu limpar o histórico mais antigo de 
  rematrículas. Exclua da tabela tb_rematricula todos os registros 
  referentes ao semestre '2025.1'.
*/
select * from academico.tb_rematricula  where semestre = '2025.1';
delete from academico.tb_rematricula  where semestre = '2025.1';

/*
  3. Exclua da tabela tb_rematricula todas as rematrículas realizadas 
  antes de 15/07/2025.
*/
select * from academico.tb_rematricula  
  where data_rematricula < '2025-07-15';
delete from academico.tb_rematricula  
  where data_rematricula < '2025-07-15';

/*
  4. Exclua da tabela tb_aluno todos os alunos que estejam inativos, 
     pertençam ao curso 4 e possuam ira igual a 0.
*/
select * from academico.tb_aluno 
  where ativo = false
    and curso_fk = 4
    and ira = 0;

delete from academico.tb_aluno 
  where ativo = false
    and curso_fk = 4
    and ira = 0;

/*
  5. Tente excluir da tabela tb_aluno o aluno Steve Jobs 
     (matrícula '555555').
    a) Por que o PostgreSQL bloqueia esse comando?
    b) Escreva a sequência correta de dois comandos DELETE para remover 
       completamente esse aluno e seu histórico do banco de dados.
*/   
delete from academico.tb_rematricula where aluno_fk = 9;
delete from academico.tb_aluno where matricula = '555555';