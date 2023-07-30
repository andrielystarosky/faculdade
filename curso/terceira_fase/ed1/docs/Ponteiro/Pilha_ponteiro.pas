Program Pilha_ponteiro;

Type Informacao = integer;

Type Elemento = record
	dado :informacao;
	prox :^elemento;
end;

Type ptnodo = ^elemento;

var Pilha  :ptnodo;
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

Procedure InsertPilha(var Pilha :ptnodo);
var aux, aux2 :ptnodo;
begin
	new(aux);
	If aux=nil then
		WriteLn('Memoria cheia.')
	Else
	begin
		aux2:= pilha;
		while aux2^.prox<>nil do
			aux2:= aux2^.prox;
		aux^.dado:= EscolherNumero;
		aux^.prox:= nil;
		If Pilha = nil then
			pilha:= aux
		Else
			aux2^.prox:=aux;
		WriteLn('Inserido com sucesso!');
	end;
	ReadKey;
end;

Procedure MostrarPilha(Pilha :ptnodo);
var aux :ptnodo;
begin
	If pilha=nil then
		WriteLn('Pilha vazia.')
	Else
	begin
		aux:= pilha;
		While aux<>nil do
		begin
			WriteLn(aux^.dado, ', ', aux^.prox, ' | ');
			aux:= aux^.prox; 
		end;
	end;
	ReadKey;
end;

Procedure RemovePilha(var Pilha :ptnodo);
var aux, auxAnt :ptnodo;
begin
	If pilha = nil then
		WriteLn('Pilha vazia.')
	Else
	begin
		aux:= pilha;
		auxAnt:=nil;
		while aux^.prox<>nil do
		begin
		  If aux<>nil then
		  	auxAnt:= aux;
			aux:=aux^.prox;
		end;
		if auxAnt<>nil then
		  auxAnt^.prox:=nil
	  else
	  	pilha:=nil;
	  dispose(aux);
		WriteLn(' Removido com sucesso!');	  
	end;
	ReadKey;
end;  

Procedure Invalido(Opcao :integer);
begin
	If Opcao<>4 then
	begin
		WriteLn('Opcao invalida. Tente novamente.');
		ReadKey;
	end;
end;

Procedure Inicializar(var Pilha :ptnodo; var Opcao :integer);
begin
	Pilha:=nil;
	Opcao:=0;
end;

begin
	Inicializar(Pilha, iOpcao);
	Repeat
		iOpcao:= EscolheOpcao;
		Case iOpcao of
	  	1: InsertPilha(Pilha);
			2: RemovePilha(Pilha);
			3: MostrarPilha(Pilha)
			Else Invalido(iOpcao);
		end;
		ClrScr;
	until iOpcao=4;

end.                                                                       
                                                                             