Program Atividade_3;

Type informacao = string;

TVetor= record
  dado: array[1..100] of string;
  qtd  :integer;
End;

Dado = record
  sNome          : informacao;
  aTitulo        : TVetor; 
  aAcesso        : TVetor; 
  aRebaix        : TVetor; 
  sSerie         : string;
end;

Elemento = record                                                       
  dado :dado;
  prox :^elemento;
  ant  :^elemento;
end;

ptnodo = ^elemento;

var TimeA    :ptnodo;
		TimeAFim :ptnodo;
		TimeB    :ptNodo;
		TimeBFim :ptnodo;
		iOpcao   :integer;
		sSerie   :string;

//Config

Procedure Inicializar(var TimeA, TimeAFim, TimeB, TimeBFim :ptnodo; iOpcao :integer);
begin
  TimeA    :=nil;
  TimeAFim :=nil;
  TimeB    :=nil;
  TimeBFim :=nil;
  iOpcao   :=0;
  textcolor(white);
end;

Function PosicaoValorLista(Lista :ptnodo; time :string) :ptnodo;
var aux, aux2 :ptnodo;
begin
	aux:=lista;
	aux2:=nil;
	While (aux2=nil) and (aux<>nil) do	
	begin
		if aux^.dado.sNome = time then
			aux2:=aux
		else
			aux:= aux^.prox;
	end;
	
	If aux2=nil then
		PosicaoValorLista:=nil
	Else
 PosicaoValorLista:=aux2;
end;

// Mensagens

Procedure QuebraLinha;
begin
  textcolor(blue);
  WriteLn('');
  WriteLn('----------------------------------------------------------------------------');
  WriteLn('');
  textcolor(white);
end;

Function MenuEditTime :integer;
var result :integer;
begin
	QuebraLinha;
  WriteLn('|1|Inserir título');
  WriteLn('|2|Inserir acesso');
  WriteLn('|3|Inserir rebaixamento');
  WriteLn('|4|Remover título');
  WriteLn('|5|Remover acesso');
  WriteLn('|6|Remover rebaixamento');
  WriteLn('|7|Retornar');
  Write('	->');
  ReadLn(result);
  QuebraLinha;
  MenuEditTime:= result;              
end;   

//ESCOLHER

Function EscolheOpcao :integer;
var num :integer;
begin
  QuebraLinha;
  WriteLn('|1|Mostrar Times');
  WriteLn('|2|Inserir Time');
  WriteLn('|3|Remover Time');
  WriteLn('|4|Editar Time');
  WriteLn('|5|Consultar Time');
  WriteLn('|6|Sair');
  Write(' ->');
  ReadLn(num);
  EscolheOpcao:= num;
  QuebraLinha;
end;

Function EscolherTitulo :string;
var result :string;
begin
  WriteLn('Informe o título.');
  WriteLn('ps: Utilizar formato título,ano');
  Write('	->');
  ReadLn(Result);
  EscolherTitulo:= upcase(result);
end;

Function EscolherSerie :string;
var result:string;
begin
	Repeat
		WriteLn('|A| Série A');
		WriteLn('|B| Série B');
		Write('	->');
		ReadLn(result);
		result:=upcase(result);
		If (result<>'A') and (result<>'B') then
			WriteLn('Série inválida.');
	Until (result='A') or (result='B');
	
	EscolherSerie:= result;
end;

Function EscolherTime :string;
var result :string;
begin
	WriteLn('Informe o nome do time:');
	Write('	->');
	ReadLn(result);
	
	EscolherTime:= upcase(result);
end;

Function EscolherAno :string;
var result :string;
begin
  WriteLn('Informe o ano:');
  Write('	->');
  ReadLn(result);
  EscolherAno:= result;
end;

//REMOVER

Procedure RemoveVetor(var vetor :TVetor; dado : string);
Var idx, aux : integer;
Begin
  idx:=1;
  Aux:=0;
  While (aux=0) and (idx<=vetor.qtd) do
  Begin
    If vetor.dado[Vetor.qtd]=dado then
      Inc(aux)
    Else
      Inc(idx);
   End;

   If aux=0 then 
     WriteLn('Não está cadastrado. ')
   Else
   Begin
     Dec(vetor.qtd);
      For aux:= idx to vetor.qtd do
         Vetor.dado[vetor.qtd]:= vetor.dado[vetor.qtd+1];
      WriteLn('Excluído com sucesso!');
   End;
End;

Procedure RemoveTitulo(var Lista :ptnodo; nomeTime :string);
var auxL      :ptnodo;
    sTitulo   :string;
    idxTitulo :integer;
    idx       :integer;
    bAux :boolean;
begin
  If PosicaoValorLista(Lista, nomeTime)=nil then
  	WriteLn('O time não está cadastrado.')
  Else
  begin
    auxL := Lista;
    bAux := false;
    
    If auxL^.dado.aTitulo.qtd=0 then
    	WriteLn('O time não possui títulos.')
    Else
    begin
      sTitulo:= EscolherTitulo;
    
      While (auxL^.dado.sNome<>nomeTime) do
        auxL:= auxL^.prox;
      RemoveVetor(auxL^.dado.aTitulo, sTitulo);
    end;
  end;
  ReadKey;
end;

Procedure RemoveAcessoRebaix(var Lista :ptnodo; nomeTime, acesOuRebaix :string);
var auxL :ptnodo;
    aux2 :ptnodo;
    ano  :string;
    idx  :integer;
begin
  aux2:= PosicaoValorLista(Lista, nomeTime);
  If aux2=nil then
  	WriteLn('O time não está cadastrado.')
  Else
  begin
  	If ((acesOuRebaix = 'A') and (auxL^.dado.aAcesso.qtd=0)) or ((acesOuRebaix = 'B') and (auxL^.dado.aRebaix.qtd=0)) then
    begin
			If acesOuRebaix='A' then
			  WriteLn('O time não possui acessos.')
			Else
			  WriteLn('O time não possui rebaixamentos.');	
		end
		Else
		begin 
		  ano:= EscolherAno;    
      If acesOuRebaix = 'A' then
        RemoveVetor(auxL^.dado.aAcesso, ano)
      Else 
      If acesOuRebaix = 'B' then
        RemoveVetor(auxL^.dado.aRebaix, ano);
      WriteLn('Removido com sucesso!');
    end;
  end;
    
    

    {If acesOuRebaix = 'A' then
    begin
      dec(aux2^.dado.aAcesso.qtd);
      For idx:= 1 to aux2^.dado.aAcesso.qtd do
        aux2^.dado.aAcesso.dado[idx]:=aux2^.dado.aAcesso.dado[idx+1];
    end
    Else
    begin
      dec(aux2^.dado.aRebaix.qtd);
      For idx:= 1 to aux2^.dado.aRebaix.qtd do
        aux2^.dado.aAcesso.dado[idx]:=aux2^.dado.aAcesso.dado[idx+1];
    end;        }
end;

Procedure RemoveLista(var Lista, Fim :ptnodo);
var aux, aux2, aux3, auxAnt, AuxProx :ptnodo;
    time :string;
begin
	If Lista=nil then
		WriteLn('Lista vazia.')
	Else
	begin
		time:= EscolherTime;
		aux2:= PosicaoValorLista(Lista, time);
		If aux2 = nil then
			WriteLn('Time não está cadastrado.') 
		Else
		begin
			aux:=lista;
			aux3:=fim;
	  	If Lista^.dado.sNome = time then
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

//INSERIR

Procedure insertVetor(var Vetor :TVetor; dado :string);
Var idx,aux: integer;
Begin
  Idx:=1;
  Aux:=0;
  While (aux=0) and (idx<=vetor.qtd) do
  Begin
    If vetor.dado[idx] = dado then
     Inc(Aux)
    Else
      Inc(idx);
  End;

  If idx>0 then
     WriteLn('Já está cadastrado. ')
  Else
  Begin
    Inc(vetor.qtd);
    Vetor.dado[vetor.qtd]:= dado;
    WriteLn('Inserido com sucesso!');
  End;
  
End;

Procedure InsertTitulo(var Lista :ptnodo; nomeTime :string);
var auxL     :ptnodo;
    sTitulo  :string;
begin
  If PosicaoValorLista(Lista, nomeTime)=nil then
  	WriteLn('O time não está cadastrado.')
  Else
  begin    
    sTitulo:= EscolherTitulo;    
    auxL:= Lista;
    While auxL^.dado.sNome <> nomeTime do 
      auxL:= auxL^.prox;
      
    inc(auxL^.dado.aTitulo.qtd);
    With auxL^.dado do
      aTitulo.dado[aTitulo.qtd]:=sTitulo; 
  end;
end;

Procedure InsertAcessoRebaix(var Lista :ptnodo; nomeTime, acesOuRebaix :string);
var auxL :ptnodo;
    ano  :string;
begin
  If PosicaoValorLista(Lista, nomeTime)=nil then
  	WriteLn('O time não está cadastrado.')
  Else
  begin
    ano:= EscolherAno;  
    auxL:= Lista;
    While (auxL^.dado.sNome > nomeTime) and (auxL^.prox<>nil) do
      auxL:=auxL^.prox;
    If acesOuRebaix = 'A' then
    With auxL^.dado do
    begin
      inc(aAcesso.qtd);
      aAcesso.dado[aAcesso.qtd]:=ano;
    end
    Else
    With auxL^.dado do
    begin
      inc(aRebaix.qtd);
      aRebaix.dado[aRebaix.qtd]:=ano;
    end;
    WriteLn('Inserido com sucesso!');
  end;
end;

Procedure EditTime(var Lista :ptnodo; time :string);
var aux, aux2 :ptnodo;
    opcaoEdit :integer;
begin
  opcaoEdit:= 0;
  Repeat 
	  opcaoEdit:= MenuEditTime;
	  If time='' then
	    Case opcaoEdit of
	      1: InsertTitulo(Lista, EscolherTime);
	      2: InsertAcessoRebaix(Lista,EscolherTime,'A');
	      3: InsertAcessoRebaix(Lista,EscolherTime,'R');
	      4: RemoveTitulo(Lista,EscolherTime);
	      5: RemoveAcessoRebaix(Lista,EscolherTime,'A');
	      6: RemoveAcessoRebaix(Lista,EscolherTime,'R')
	      Else WriteLn('Opção inválida, tente novamente.');
	    end
	  Else
	    Case opcaoEdit of
	      1: InsertTitulo(Lista, time);
	      2: InsertAcessoRebaix(Lista,time,'A');
	      3: InsertAcessoRebaix(Lista,time,'R');
	      4: RemoveTitulo(Lista,time);
	      5: RemoveAcessoRebaix(Lista,time,'A');
	      6: RemoveAcessoRebaix(Lista,time,'R')
	      Else
				If opcaoEdit<>7 then
				  WriteLn('Opção inválida, tente novamente.');
	    end
  until opcaoEdit=7; 		
end;

Procedure InsertTime(var Lista, Fim :ptnodo; serie :string);
var aux, auxL, auxF, auxAnt :ptnodo;
begin
  new(aux);
  If aux=nil then
    WriteLn('Memoria cheia.')
  Else
  begin
    auxL:=Lista;
    auxF:=Fim;    
    
    aux^.dado.sNome       := EscolherTime;
    aux^.dado.sSerie      := serie;
    aux^.dado.aAcesso.qtd :=0;
    aux^.dado.aRebaix.qtd :=0;
    aux^.ant              := nil;
    aux^.prox             := nil;
    
    If PosicaoValorLista(Lista, aux^.dado.sNome)<>nil then
    	WriteLn('Time já está na lista!')
    Else
    Begin
      If auxL=nil then
      begin
        lista:=aux;
        fim:=aux;
      end
      Else
      If aux^.dado.sNome<=auxL^.dado.sNome then
      begin
        auxL^.ant:=aux;
        aux^.prox:=auxL;
        lista:= aux;
      end
      Else
      begin
        While (aux^.dado.sNome>auxL^.dado.sNome) and (auxL^.prox<>nil) do
        begin
          auxAnt:= auxL;
          auxL:= auxL^.prox;
        end;
        
        If (auxL^.prox=nil) and (auxL^.dado.sNome<aux^.dado.sNome) then
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
      EditTime(Lista, aux^.dado.sNome);
      WriteLn('Time inserido com sucesso.');
    end;
  end;
  ReadKey;
end;

//MOSTRAR
Procedure MostrarDadosTime(Lista :ptnodo; nomeTime :string);
var auxL :ptnodo;
    idx  :integer;
begin
  auxL:= Lista;  
  If PosicaoValorLista(Lista, nomeTime)=nil then
  	WriteLn('Time não está cadastrado.')
  Else
  begin
  	While (auxL^.dado.sNome <> nomeTime) and (auxL^.prox<>nil) do
	    auxL:= auxL^.prox;

	  QuebraLinha;
    WriteLn('->Time:', auxL^.dado.sNome, ' - Serie ', auxL^.dado.sSerie);

    If auxL^.dado.aTitulo.qtd = 0 then
      WriteLn('O time não possui títulos.')
    Else
    begin
	    Write('   -', auxL^.dado.aTitulo.qtd, ' Título(s): ');
	    For idx:= 1 to auxL^.dado.aTitulo.qtd do
	    Write(auxL^.dado.aTitulo.dado[idx], '; ');	    
    end;

    WriteLn('');
	
	  If upcase(auxL^.dado.sSerie)='B' then
    begin 
      If auxL^.dado.aAcesso.qtd = 0 then
      WriteLn('O time nunca foi para série A')
      Else
      begin
        Write('	-', auxL^.dado.aAcesso.qtd, ' Acesso(s): ');
        For idx:= 1 to auxL^.dado.aAcesso.qtd do
        Write(auxL^.dado.aAcesso.dado[idx], '; ');
      end;
      WriteLn('');
    end
    Else
    begin
      If auxL^.dado.aRebaix.qtd = 0 then
        WriteLn('O time nunca foi para série B')
      Else
      begin
        Write('   -', auxL^.dado.aRebaix.qtd, ' Rebaixamento(s):');
        For idx:= 1 to auxL^.dado.aRebaix.qtd do
        Write(auxL^.dado.aRebaix.dado[idx], '; ');
      end;
      WriteLn('');
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
          WriteLn(aux^.dado.sNome, ';');
          aux:=aux^.prox;
        end;
      end;
      2:
      begin
        aux:= Fim;
        While aux<>nil do
        begin
          WriteLn(aux^.dado.sNome, '; ');
          aux:=aux^.ant;
        end;
      end;
    end;
  end;
  ReadKey;
end;
    
begin
  Inicializar(TimeA, TimeAFim, TimeB, TimeBFim, iOpcao);
  Repeat
    iOpcao:= EscolheOpcao;
   	                	
    Case iOpcao of
      1: 
      begin
        sSerie:= EscolherSerie;
      	If sSerie='A' then
		      MostrarLista(TimeA, TimeAFim)
	      Else
		      MostrarLista(TimeB, TimeBFim)
      end;

			2:
      begin
			 	sSerie:= EscolherSerie;
				If sSerie='A' then
					InsertTime(TimeA, TimeAFim,'A')
				Else
					InsertTime(TimeB, TimeBFim,'B');	
			end;
			
			3:
			begin
				sSerie:= EscolherSerie;
        If sSerie='A' then
				  RemoveLista(TimeA, TimeAFim)
			  Else
				  RemoveLista(TimeB, TimeBFim);
			end;
                  
      4: 
      begin
        sSerie:= EscolherSerie;
        If sSerie='A' then
				  EditTime(TimeA, '')
			  Else
				  EditTime(TimeB, '');		
      end;
									
			5: 
      begin
			  sSerie:= EscolherSerie;
			  If sSerie='A' then
					MostrarDadosTime(TimeA, EscolherTime)
				Else 
					MostrarDadosTime(TimeB, EscolherTime);	
			end; 
    end;
    Clrscr;
  Until iOpcao=6;
end.






