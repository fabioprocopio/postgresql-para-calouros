update <esquema>.<nome-tabela>
   set col1 = val1,
       col2 = val2,
       ...
       colN = valN 
 where <condicao>;

update academico.tb_aluno ta 
   set ira = -1
 where id = 11;

/*
1. A aluna Maisa Silva (matrícula '202624') teve seu rendimento 
   calculado pela secretaria. Atualize o valor do ira dela para 85.
*/
update academico.tb_aluno 
   set ira = 85 
 where matricula = '202624';   

/*
2. O aluno Lulu Santos (matrícula '202617') solicitou transferência 
   interna para o curso de código 2 e teve seu ira revisado para 78. 
   Faça essas duas alterações em um único comando UPDATE.
*/
update academico.tb_aluno 
   set ira = 78,
       curso_fk = 2
 where matricula = '202617';   

/*
3. A coordenação decidiu que nenhum aluno deve ficar com o campo sexo 
   vazio. Atualize todos os registros de tb_aluno onde sexo é nulo, 
   definindo o valor como 'N' (Não informado).
*/
update academico.tb_aluno 
   set sexo = 'N'
 where sexo is null;


/*
4. Durante a importação de dados na tabela tb_rematricula, alguns 
   registros do semestre '2026.2' foram gravados incorretamente com 
   barra ('2026/2'). Corrija todos esses registros para o 
   padrão '2026.2'.
*/
update academico.tb_rematricula
   set semestre = '2026.2'
 where semestre = '2026/2'; 

/*
5. Algumas rematrículas foram inseridas sem a data/hora de 
   confirmação (data_rematricula IS NULL). Atualize esses 
   registros atribuindo a data e hora atual do servidor.
*/
update academico.tb_rematricula 
   set data_rematricula = now()
 where data_rematricula is null;  

/*
6. Desative todos os alunos que estão atualmente ativos, pertencem 
   ao curso 3 e possuem ira menor que 20.
*/
update academico.tb_aluno ta 
   set ativo = false  
where ativo = true 
  and curso_fk = 3 
  and ira < 20;

/*
7. A instituição concedeu um bônus de +5 pontos no ira para todos os 
   alunos ativos do curso 2. Escreva o UPDATE garantindo que o comando 
   não gere erro na restrição ck_aluno_ira (que limita o IRA a 100).
*/
update academico.tb_aluno
   set ira = ira + 5 
 where curso_fk = 2
   and ira <= 95;

update academico.tb_aluno
   set ira = ira + (100 - ira)
 where curso_fk = 2
   and ira > 95;


/*
8. Todos os alunos nascidos antes de 01/01/1960 que estejam com ira 
   nulo devem receber o valor padrão 50 no campo ira.
*/
update academico.tb_aluno
   set ira = 50 
 where data_nascimento < '1960-01-01'
   and ira is null 

