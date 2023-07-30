
Program Lista_ponteiro;

Type Informacao = integer;

Type Elemento = record
	dado :informacao;
	prox :^elemento;
end;

Type ptnodo = ^elemento;

var Lista  :ptnodo;
    iOpcao :integer;
    
Procedure QuebraLinha;                                                       
begin   
  textcolor(blue);                                                                     
	WriteLn('');                                                              
	WriteLn('---------------------------------------------------------');        
	WriteLn('');
	textcolor(white);                                                               
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
	WriteLn('Informe o número:');    
	Write(' ->');                             
	ReadLn(num);                              
	EscolherNumero:=num;
end;

Procedure Invalido(Opcao :integer);
begin
	If Opcao<>4 then
	begin
		WriteLn('Opcao invalida. Tente novamente.');
		ReadKey;
	end;
end;

Procedure Inicializar(var Lista :ptnodo; var Opcao :integer);
begin
	Lista:=nil;
	Opcao:=0;
end;

Function PosicaoValorLista(Lista :ptnodo; Valor :integer) :ptnodo;	
var aux, aux2 :ptnodo;
begin
	aux2:= nil;
	aux:=lista;
	While (aux2=nil) and (aux<>nil) do
	begin
		If aux^.dado=valor then
			aux2:=aux
		Else
			aux:=aux^.prox; 
	end; 
	
	If aux2=nil then
		PosicaoValorLista:=nil
	Else
		PosicaoValorLista:=aux2;	
end;

Procedure InsertLista(var Lista :ptnodo);
var aux, aux2, auxAnt :ptnodo;
begin
	new(aux);
	If aux=nil then
		WriteLn('Memoria cheia.')
	Else
	begin
	  aux2:=Lista;
	  auxAnt:=nil; 
	  
		aux^.dado:=EscolherNumero;
		aux^.prox:=nil;
		
		If PosicaoValorLista(Lista, aux^.dado)<>nil then
			WriteLn('Valor já está na lista!')
		Else
		Begin
			If aux2=nil then
				lista:=aux
			Else 		
			If aux^.dado<=aux2^.dado then
			begin
				aux^.prox:=aux2;
				lista:= aux;	
			end
			Else
			begin		  
				While (aux^.dado>aux2^.dado) and (aux2^.prox<>nil) do
				begin
					auxAnt:= aux2;
					aux2:= aux2^.prox;
				end;
				
				If (aux2^.prox=nil) and (aux2^.dado<aux^.dado) then
					aux2^.prox:=aux
				Else 			
				begin
					aux^.prox:= aux2;
					auxAnt^.prox:=aux;
				end;  			
			
			end;
			WriteLn('Inserido com sucesso.');		
		end;
	end;
	ReadKey;
end;

Procedure MostrarLista(Lista :ptnodo);
var aux :ptnodo;
begin
	If Lista=nil then
		WriteLn('Lista vazia.')
	Else
	begin
		aux:= Lista;
		While aux<>nil do
		begin
			WriteLn(aux^.dado, ', ', aux^.prox);
			aux:=aux^.prox;
		end;
	end;
	ReadKey;
end;

Procedure RemoveLista(var Lista :ptnodo);
var aux, aux2, auxAnt :ptnodo;
    iNum :integer;
begin
	If Lista=nil then
		WriteLn('Lista vazia.')
	Else
	begin
		iNum:= EscolherNumero;
		aux2:= PosicaoValorLista(Lista, iNum);
		If aux2 = nil then
			WriteLn('Valor não está na lista.') 
		Else
		begin
			aux:=lista;
	  	If Lista^.dado = iNum then
	  	begin
	 		 	lista:= lista^.prox;
	  		dispose(aux);
	  	end 		
			Else
			begin
				While aux<>aux2 do
				begin
					auxAnt:=aux;
					aux:=aux^.prox;
				end;
				auxAnt^.prox:=aux2^.prox;		
				dispose(aux2);
			end; 
			WriteLn('Removido com sucesso!');
		end; 
	end;
	ReadKey;
end;  

Begin
  textcolor(white);  
  Inicializar(Lista, iOpcao);
	Repeat
		iOpcao:= EscolheOpcao;
		Case iOpcao of
	  	1: InsertLista(Lista);
			2: RemoveLista(Lista);
			3: MostrarLista(Lista)
			Else Invalido(iOpcao);
		end;
		ClrScr;
	until iOpcao=4;
  
End.