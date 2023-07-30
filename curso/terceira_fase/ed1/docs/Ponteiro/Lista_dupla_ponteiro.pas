Program Lista_dupla_ponteiro; 

Type Informacao = integer;

Type Elemento = record
	dado :informacao;
	prox :^elemento;
	ant  :^elemento;
end;

Type ptnodo = ^elemento;

var Lista  :ptnodo;
    Fim    :ptnodo;
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

Procedure Inicializar(var Lista, Fim :ptnodo; var Opcao :integer);
begin
	Lista:=nil;
	Fim:=nil;
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

Procedure InsertLista(var Lista, Fim :ptnodo);
var aux, auxL, auxF, auxAnt :ptnodo;
begin
	new(aux);
	If aux=nil then
		WriteLn('Memoria cheia.')
	Else
	begin
	  auxL:=Lista;
	  auxF:=Fim;
	  
		aux^.dado:=EscolherNumero;
		aux^.ant:=nil;
		aux^.prox:=nil;
		
		If PosicaoValorLista(Lista, aux^.dado)<>nil then
			WriteLn('Valor já está na lista!')
		Else
		Begin
			If auxL=nil then
			begin
				lista:=aux;
				fim:=aux;
			end
			Else 		
			If aux^.dado<=auxL^.dado then
			begin
			  auxL^.ant:=aux;
				aux^.prox:=auxL;
				lista:= aux;	
			end
			Else
			begin		  
				While (aux^.dado>auxL^.dado) and (auxL^.prox<>nil) do
				begin
					auxAnt:= auxL;
					auxL:= auxL^.prox;
				end;
				
				If (auxL^.prox=nil) and (auxL^.dado<aux^.dado) then
				begin
				  aux^.ant:=AuxL;
					auxL^.prox:=aux;
					Fim:=aux;
				end				
				Else 			
				begin
				  aux^.Ant:=auxAnt;
				  aux^.prox:=auxL;
				  auxAnt^.prox:=aux;
				  auxL^.ant:=aux;  
				end;  			
			
			end;
			WriteLn('Inserido com sucesso.');		
		end;
	end;
	ReadKey;
end;

Procedure MostrarLista(Lista, Fim :ptnodo);
var aux   :ptnodo;
    ordem :integer;
begin
  If Lista=nil then
			WriteLn('Lista vazia.')
	Else
	begin
  	WriteLn('Deseja a lista em ordem crescente(1) ou decrescente(2)?');
  	ReadLn(ordem);
  	Case ordem of
  	1:
  	begin 
  	  aux:= Lista;
			While aux<>nil do
			begin
				WriteLn(aux^.ant, ', ', aux^.dado, ', ', aux^.prox);
				aux:=aux^.prox;
			end;
		end;
		2:
		begin
		  aux:= Fim;
			While aux<>nil do
			begin
				WriteLn(aux^.ant,', ', aux^.dado, ', ', aux^.prox);
				aux:=aux^.ant;	
			end;	
		end;
		end;
	end;
	ReadKey;
end;

Procedure RemoveLista(var Lista, Fim :ptnodo);
var aux, aux2, aux3, auxAnt, AuxProx :ptnodo;
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
			aux3:=fim;
	  	If Lista^.dado = iNum then
	  	begin
	 		 	lista:= lista^.prox;
	  		dispose(aux);
	  		lista^.ant:=nil;
	  	end 		
			Else
			begin
				While aux<>aux2 do
				begin
					auxAnt:=aux;
					aux:=aux^.prox;
				end;
				auxAnt^.prox:=aux2^.prox;	
				
				If Aux2^.Prox = nil then
					Fim:= aux2^.Ant;
				
				If aux3=aux2 then
					auxProx:=aux3
				Else			
					While aux3<>aux2 do
					begin
						auxProx:=aux3;
						aux3:=aux3^.ant;
					end;
				auxProx^.Ant:=aux2^.Ant;
									
				dispose(aux2);
			end; 
			WriteLn('Removido com sucesso!');
		end; 
	end;
	ReadKey;
end;  

Begin
  textcolor(white);  
  Inicializar(Lista, Fim, iOpcao);
	Repeat
		iOpcao:= EscolheOpcao;
		Case iOpcao of
	  	1: InsertLista(Lista, Fim);
			2: RemoveLista(Lista, Fim);
			3: MostrarLista(Lista, Fim)
			Else Invalido(iOpcao);
		end;
		ClrScr;
	until iOpcao=4;
  
End.