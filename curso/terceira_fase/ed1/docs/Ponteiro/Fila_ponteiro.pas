Program Fila_ponteiro;

type informacao = integer;

type elemento = record
 dado : informacao;
 prox : ^elemento;
end;

type ptnodo = ^elemento;  

var Fila   :ptnodo;
    iOpcao :integer;
    
Procedure QuebraLinha;
begin
	WriteLn('');
	WriteLn('---------------------------------------------------------');
	WriteLn('');
end;

Function EscolheOpcao :integer;
var num :integer;
begin
  QuebraLinha;
	WriteLn('|1|Inserir');
	WriteLn('|2|Remover');
	WriteLn('|3|Mostrar');
	WriteLn('|4|Sair');
	Write(' ->');
	ReadLn(num);
	EscolheOpcao:= num;
	QuebraLinha;
end;

Function EscolherNumero :integer;
var num :integer;
begin
	WriteLn('Qual valor deseja inserir?');
	Write(' ->');
	ReadLn(num);
	EscolherNumero:=num;	
end;

Procedure InsertFila(var Fila :ptnodo);
var aux,aux2 :ptnodo;
begin
	new(aux); 
	If aux = nil then
		WriteLn('Memoria cheia.')
	Else
	begin
		aux2:= fila;
		while aux2^.prox <> nil do
		begin
			aux2:=aux2^.prox;
		end;
		aux^.dado:= EscolherNumero;
		aux^.prox:=nil;
		If fila = nil then
			fila:= aux
		Else
			aux2^.prox:=aux;
		WriteLn(' Inserido com sucessso!');	
		ReadKey;
	end;	
end;

Procedure MostrarFila(Fila :ptnodo);
var aux :ptnodo;
begin
  If fila = nil then              
  	WriteLn('Memoria vazia.') 
	Else
	begin   
		aux:= fila;
	  while aux <> nil do
	  begin
		  write(' | ', aux^.dado, ', ', aux^.prox, ' | |');
		  aux:= aux^.prox;
	  end;
	end;
	ReadKey;
end;

Procedure RemoveFila(var Fila :ptnodo);
var aux :ptnodo;
begin
	If Fila = nil then
		WriteLn('Memoria vazia.')
	Else
	begin
		aux:= fila;
		fila:= fila^.prox;
		dispose(aux);
		WriteLn(' Removido com sucesso!');
	end;
	ReadKey;
end;

Procedure Inicializa(var Fila :ptnodo; var iOpcao :integer);
begin
	fila:= nil;
	iOpcao:=0;
end;


Begin
	Inicializa(Fila,iOpcao);
	Repeat
		iOpcao:= EscolheOpcao;
		Case iOpcao of
			1: InsertFila(Fila);
			2: RemoveFila(Fila);
			3: MostrarFila(Fila);
		end;
	ClrScr;				
	until iOpcao=4;  	
  
End.