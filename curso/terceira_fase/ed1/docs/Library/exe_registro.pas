Program Pzim ;
const N=3;
type 
  aluno = record
    codigo:integer;
    nome:string[30];
    n1,n2,media:real;
    situacao: string[10];
  end;
  
  v_aluno = array[1..N] of aluno; 

var aluno_bsn:v_aluno;
	  i:integer;

Begin
  for i:= 1 to n do
  begin
     writeln ('Aluno ', i);
     Write ('Codigo: ');
		 readln (aluno_bsn[i].codigo);
     Write ('Nome: ');
		 readln (aluno_bsn[i].nome);
     Write ('Nota-1: ');
		 readln (aluno_bsn[i].n1);
     Write ('Nota-2: ');
		 readln (aluno_bsn[i].n2);
		 aluno_bsn[i].media:=(aluno_bsn[i].n1+aluno_bsn[i].n2)/2;
		 if aluno_bsn[i].media >= 6 then
        aluno_bsn[i].situacao:= 'Aprovado'
     else
        aluno_bsn[i].situacao:= 'Reprovado';
  end; 
	clrscr;
	writeln('Relatorio');
	writeln('=========');
  writeln;	
  writeln('Codigo Nome do Aluno                  Nota-1  Nota-2  Média  Situação');
	for i:= 1 to n do
    with aluno_bsn[i] do    
    begin
      write (codigo:6,' ');
      write (nome:30,' ');
      write (n1:6:2, '  ');
      write (n2:6:2, ' ');
      write (media:6:2, '  ');
      write (situacao);
      writeln;
    end;
End.