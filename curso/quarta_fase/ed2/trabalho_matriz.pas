{Aline e Andriely}
Program matrizAdjacencia;

Type TMatriz = array[1..50,1..50] of integer;

     TGraus = array[1..50] of real;


var aMatriz: TMatriz;
		aGraus:TGraus;
		n : integer;
		bSimples, bClique, bConexo :boolean;
		sNum :string;
		
procedure inicia (var simples, clique,conexo :boolean);
begin
	simples:= true;
	clique:=true;
	conexo:=true;
end;
		
		
procedure leOrdem (var n : integer);
begin
	WriteLn('Informe a ordem da matriz:');
	ReadLn(n);
	clrscr;
end;

procedure leMatriz (var matriz : TMatriz; var n:integer; var simples :boolean);
var i, j :integer;
begin
	leOrdem(n);
	i:=1;
	while i<=n do
	begin
    for j:= 1 to i do
    begin
      write ('Informe elemento [',i,',',j,'] da matriz: ');
      readln (matriz[i,j]);     
			matriz[j,i]:=matriz[i,j];  
			if (matriz[i,j]<>1) and (matriz[i,j]<>0) then
				simples:=false; 
    end;
    inc(i);
  end;
  clrscr;
end;

procedure escreveMatriz (matriz : TMatriz; n :integer);
var i, j :integer;
begin
	WriteLn('Matriz:');
	for i:=1 to n do    
    for j:= 1 to n do
    begin
       gotoxy (j*8+5, i*2+1);
       write (matriz[i,j]:2:2);
    end;
  readkey;
  gotoxy (10, 20);
  WriteLn('');
  WriteLn('------------------------------------------');
end;

procedure verificaRegular(n :integer; graus :TGraus; sNum :string);
var g, i :integer;
    aux : boolean;
begin
	aux:=true;
	i:=2;
	While (i<=n) and aux do
	begin
		If graus[i]=graus[i-1] then
			inc(i)
		Else
			aux:=false;
	end;
	
	If aux then
		WriteLn(sNum,'. O grafo é regular de grau R')
	Else
		Writeln(sNum,'. O grafo não é regular de grau R');
end;

procedure SomaColuna (aMatriz :TMatriz; n :integer; var graus :TGraus; sNum :string);
var i, j, g :integer;
		soma :real;		
begin
	g:=1;
	while g<= n do
	begin 
	  for i:=1 to n do
	  begin
	    soma:=0;
      for j:= 1 to n do
      begin
        soma:=soma+aMatriz[i,j]
      end;
      graus[g]:=soma;
      inc(g)
    end;     
  end;
		
	verificaRegular(n,graus,sNum);
	
end;

function somaDiagonalPrincipal (matriz :TMatriz) :real;
var i,j :integer;
	soma :real;
begin
	soma:=0;
	For i:= 1 to n do
		For j:= 1 to n do
			if i=j then
				soma:= soma+matriz[i,j];
	somaDiagonalPrincipal:=soma;
end;

procedure verificaMultigrafo (matriz:TMatriz; var simples :boolean; n :integer; sNum :string);
var s :real;
 i, j :integer;
begin
	s:= somaDiagonalPrincipal(matriz);
	if s<>0 then
		simples:=false;
	If simples then
		Writeln(sNum,'. É um grafo simples')
	Else
		Writeln(sNum,'. É um multigrafo');
end;


procedure verificaClique (matriz :TMatriz; n :integer; var clique:boolean; simples :boolean; sNum :string);
var i,j :integer;
begin
	if not simples then
		clique:=false
	else
	begin
		For i:= 1 to n do
		  For j:= 1 to n do
			  if (i<j) then	
					if matriz[i,j]<>1 then
						clique:=false;						
	end;
	
	if clique then
		WriteLn(sNum,'. O grafo é um clique')
	else
	  WriteLn(sNum,'. O grafo não é um clique')

end;
		
procedure grafoConexo (graus :TGraus; n :integer; var conexo :boolean; sNum :string);
var i: integer;
begin
	for i:= 1 to n do
		if graus[i]=0 then
			conexo:=false;
			
	if conexo then
		WriteLn(sNum,'. O grafo é conexo.')
	else
		WriteLn(sNum,'. O grafo não é conexo.')
end;


Begin
 	textcolor(white);
 	inicia(bSimples,bClique,bConexo);
	leMatriz(aMatriz,n, bSimples);
	escreveMatriz(aMatriz,n);
	SomaColuna(aMatriz,n,aGraus,'1');
	verificaMultigrafo(aMatriz,bSimples,n,'2');
	verificaClique(aMatriz,n,bClique,bSimples,'3');
	grafoConexo(aGraus,n,bConexo,'4');	
  
End.


