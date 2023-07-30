Program Atividade_3;

Type informacao = string;

TVetor= record
  dado    :array[1..100] of string;
  qtd     :integer;
  posi    :integer;
  valposi :string;
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


// Procedimento para iniciar as váriaveis globais
Procedure Inicializar(var TimeA, TimeAFim, TimeB, TimeBFim :ptnodo; iOpcao :integer);
begin
  TimeA    :=nil;
  TimeAFim :=nil;
  TimeB    :=nil;
  TimeBFim :=nil;
  iOpcao   :=0;
  textcolor(white);
end;

// Função para percorrer a lista de time e retorna a posição em que cada time se encontra
Function PosicaoValorLista(Lista :ptnodo; time :string) :ptnodo;
var aux, aux2 :ptnodo;
begin
	aux:=lista;
	aux2:=nil;
	While (aux2=nil) and (aux<>nil) and (aux^.dado.sNome<=time) do	
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

// Determina a posição de um dado em um vetor mantendo em ordem alfabética
Procedure PosicaoVetor(var Vetor :TVetor; dado: string);
var idx :integer;  
	  aux :string;
begin
  aux:='';
  idx:=1;
	While (idx<=vetor.qtd) and (aux='') do
	begin
	  If vetor.dado[idx]=dado then
			aux:=dado
		Else
		If vetor.dado[idx]>dado then
			aux:=vetor.dado[idx]
		Else
		  inc(idx); 
	end;
	
	If aux='' then
	begin
		vetor.posi    :=0;
		vetor.valposi :='';
	end
	else
	begin
		vetor.posi    :=idx;
		vetor.valPosi :=aux; 
	end;
end;

// Mensagens

Procedure QuebraLinha(qtd:integer);
var idx :integer;
begin
  textcolor(blue);
  WriteLn('');
  For idx:=1 to qtd do
  	WriteLn('----------------------------------------------------------------------------');
  WriteLn('');
  textcolor(white);
end; 

Procedure MsgNaoCadastrado(categoria :string);
begin
	textcolor(red);
	writeLn(categoria,' não está cadastrado.');
	textcolor(white);
end;

Procedure MsgCadastrado(categoria :string);
begin
	textcolor(red);
	writeLn(categoria,' já está cadastrado.');
	textcolor(white);
end;

Procedure MsgListaVazia(categoria :string);
begin
	textcolor(red);
	writeLn('Lista de ', categoria, ' está vazia.');
	textcolor(white);
end;

Procedure MsgInserido(categoria :string);
begin
	textcolor(green);
	writeLn(categoria,' inserido com sucesso!');
	textcolor(white);
end;

Procedure MsgRemovido(categoria :string);
begin
	textcolor(green);
	writeLn(categoria,' removido com sucesso!');
	textcolor(white);
end;

Procedure MsgInvalido(categoria :string);
begin
	textcolor(red);
	writeLn(categoria,' inválido(a).');
	textcolor(white);
end;

Procedure MsgMemoriaCheia;
begin
	textcolor(red);
	writeLn('Memória cheia.');
	textcolor(white);
end;

//ESCOLHER

Function EscolheOpcao :integer;
var num :integer;
begin
  QuebraLinha(1);
  writeln(' MENU DE OPÇÕES  ');
  writeln('');
  WriteLn(' | 1 | Mostrar Times');
  WriteLn(' | 2 | Inserir Time');
  WriteLn(' | 3 | Remover Time');
  WriteLn(' | 4 | Editar Time');
  WriteLn(' | 5 | Consultar Time');
  WriteLn(' | 6 | Sair');
  writeln('');
  Write(' ->');
  ReadLn(num);
  EscolheOpcao:= num;
  QuebraLinha(1);
end;

Function EscolherTitulo :string;
var result :string;
begin
  WriteLn('Informe o título.');
  WriteLn('ps: Utilizar formato título,ano');
  writeLn('');
  Write(' ->');
  ReadLn(Result);
  EscolherTitulo:= upcase(result);
end;

Function EscolherSerie :string;
var result:string;
begin
	Repeat
		WriteLn('|A| Série A');
		WriteLn('|B| Série B');
		Write(' ->');
		ReadLn(result);
		result:=upcase(result);
		If (result<>'A') and (result<>'B') then
		  MsgInvalido('Série');
	Until (result='A') or (result='B');
	EscolherSerie:= result;
end;

Function EscolherTime :string;
var result :string;
begin
  writeln('');
	WriteLn('Informe o nome do time:');
	Write(' ->');
	ReadLn(result);	
	EscolherTime:= upcase(result);
end;

Function EscolherAno :string;
var result :string;
begin
  WriteLn('Informe o ano:');
  writeLn('');
  Write('->');
  ReadLn(result);
  EscolherAno:= result;
end;

Function MenuEditTime :integer;
var result :integer;
begin
	QuebraLinha(1);
	writeLn( 'EDIÇÃO DO TIME: ');
	writeLn('');
	writeLn('| 1 | Inserir título');
  writeLn('| 2 | Inserir acesso');
  writeLn('| 3 | Inserir rebaixamento');
  writeLn('| 4 | Remover título');
  writeLn('| 5 | Remover acesso');
  writeLn('| 6 | Remover rebaixamento');
  writeLn('| 7 | Retornar');
  writeLn('');                     
  Write('	->');
  ReadLn(result);
  QuebraLinha(1);
  MenuEditTime:= result;              
end;

//REMOVER

// Remove um dado do vetor e chama o procedimento PosicaoVetor para determinar a posição do dado a ser removido
Procedure RemoveVetor(var vetor :TVetor; dado, categoria : string);
Var idx, aux : integer;
Begin
   PosicaoVetor(vetor,dado);

   If vetor.valPosi<>dado then 
     MsgNaoCadastrado(categoria)
   Else
   Begin 
      Dec(vetor.qtd);
      For aux:= idx to vetor.qtd do
         Vetor.dado[vetor.qtd]:= vetor.dado[vetor.qtd+1];
      textcolor(green);
      MsgRemovido(categoria);
   End;
End;

// Remove o título de um time e e chama a função PosicaoValorLista para obter a posição do time na lista
Procedure RemoveTitulo(var Lista :ptnodo; nomeTime :string);
var aux       :ptnodo;
    sTitulo   :string;
begin
  aux:= PosicaoValorLista(Lista, nomeTime);
  If aux=nil then
  	MsgNaoCadastrado('Time')
  Else
  begin
    RemoveVetor(aux^.dado.aTitulo,EscolherTitulo, 'Título');
  end;  
  ReadKey;
end;


// Remove um acesso ou rebaixamentode um time e chmando a PosicaoValorLista para achar a posição e o RemoveVetor para remover
Procedure RemoveAcessoRebaix(var Lista :ptnodo; nomeTime, acesOuRebaix :string);
var aux  :ptnodo;
begin
  aux:= PosicaoValorLista(Lista, nomeTime);
  If aux=nil then
    MsgNaoCadastrado('Time')
  Else
  begin
    If acesOuRebaix = 'A' then
      RemoveVetor(aux^.dado.aAcesso,EscolherAno,'Acesso')
    Else
      RemoveVetor(aux^.dado.aRebaix,EscolherAno,'Rebaixamento');
  end;
end;

// Procedimento para remover um time da lista, soliceta o time que irá ser removido e atualiza a lista
Procedure RemoveLista(var Lista, Fim :ptnodo);
var aux, aux2, aux3, auxAnt, AuxProx :ptnodo;
    time :string;
begin
	If Lista=nil then
		MsgListaVazia('Lista')
	Else
	begin
		time:= EscolherTime;
		aux2:= PosicaoValorLista(Lista, time);
		If aux2 = nil then
		  MsgNaoCadastrado('Time')
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
			textcolor(green);
			MsgRemovido('Time')
		end; 
	end;
	ReadKey;
end; 

//INSERIR

// Procedimento que insere um dado no vetor o mantendo em ordem alfabética chamando o posicaoVetor para inserir na posição correta
Procedure insertVetor(var Vetor :TVetor; dado, categoria :string);
Var idx: integer;
Begin
  PosicaoVetor(Vetor,dado);

  If vetor.valposi=dado then
    MsgCadastrado(categoria)
  Else 
  begin
    Inc(vetor.qtd);
  	If vetor.posi=0 then
    	Vetor.dado[vetor.qtd]:= dado
		Else		
  	Begin
    	For idx:= vetor.qtd downto vetor.posi+1 do
    		vetor.dado[idx]:= vetor.dado[idx-1];
    	vetor.dado[vetor.posi]:=dado;
    end;
    MsgInserido(categoria);
  End;
  
End;

// Procedimento que insere titulos para os times e chama PosicaoValor para a posição e InsertVetor passando o vetor de titulos do time
Procedure InsertTitulo(var Lista :ptnodo; nomeTime :string);
var aux     :ptnodo;
    sTitulo :string;
begin 
  aux:= PosicaoValorLista(Lista, nomeTime);
  If aux=nil then
    MsgNaoCadastrado('Time')
  Else
  begin  
	   InsertVetor(aux^.dado.aTitulo, EscolherTitulo, 'Título');
  end;
end;

// Insere um acesso ou rebaixamento para um time
Procedure InsertAcessoRebaix(var Lista :ptnodo; nomeTime, acesOuRebaix :string);
var aux  :ptnodo;
    ano  :string;
begin
	aux:= PosicaoValorLista(Lista, nomeTime); 
  If aux=nil then
    MsgNaoCadastrado('Time')
  Else
  begin
    ano:= EscolherAno; 
		If acesOuRebaix = 'A' then
		  InsertVetor(aux^.dado.aAcesso, ano, 'Acesso')
		Else
		  InsertVetor(aux^.dado.aRebaix, ano, 'Rebaixamento');
	end;
end;

Procedure EditTime(var Lista :ptnodo; time :string);
var aux :ptnodo;
    opcaoEdit :integer;
begin
  opcaoEdit:= 0;
  aux:= PosicaoValorLista(Lista, time);
  If aux=nil then
  begin
    MsgNaoCadastrado('Time');
    ReadKey;
  end
  Else
  begin
  	Repeat 
		  opcaoEdit:= MenuEditTime;
	    Case opcaoEdit of
	      1: InsertTitulo(Lista, time);
	      2: InsertAcessoRebaix(Lista,time,'A');
	      3: InsertAcessoRebaix(Lista,time,'R');
	      4: Begin
				     If aux^.dado.aTitulo.qtd = 0 then
				       WriteLn('Não possui títulos.')
				     Else
				       RemoveTitulo(Lista,time);
				   end;
	      5: Begin
				     If aux^.dado.aAcesso.qtd = 0 then
				       WriteLn('Não possui acessos.')
				     Else
				       RemoveAcessoRebaix(Lista,time,'A');
				   end;
	      6: Begin  
				     If aux^.dado.aRebaix.qtd = 0 then
				       WriteLn('Não possui rebaixamentos.')
				     Else
				       RemoveAcessoRebaix(Lista,time,'R')
				   end;
	      Else
				If opcaoEdit<>7 then
				begin
					MsgInvalido('Opção');
				  ReadKey;
				end;
	    end
    until opcaoEdit=7; 	
	end;	
end;

{Insere um novo time na lista,considerando a ordem da série que joga,ao encontra a posição certa para inserir,
 cria um novo nó para armazenar as informações do time e atualiza o ponteiro.}
Procedure InsertTime(var Lista, Fim :ptnodo; serie :string);
var aux, auxL, auxF, auxAnt :ptnodo;
begin
  new(aux);
  If aux=nil then
    MsgMemoriaCheia
  Else
  begin
    auxL:=Lista;
    auxF:=Fim;    
    
    aux^.dado.sNome    := EscolherTime;
    aux^.dado.sSerie   := serie;
    aux^.ant           := nil;
    aux^.prox          := nil;
    
    If PosicaoValorLista(Lista, aux^.dado.sNome)<>nil then
      MsgCadastrado('Time')
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
      textcolor(green);
      MsgInserido('Time')
    end;
  end;
  ReadKey;
end;

//MOSTRAR 

//  Exibe os dados dos times
Procedure MostrarDadosTime(Lista :ptnodo; nomeTime :string);
var auxL :ptnodo;
    idx  :integer;
begin
  auxL:= Lista;  
  If PosicaoValorLista(Lista, nomeTime)=nil then
    MsgNaoCadastrado('Time')
  Else
  begin
  	While (auxL^.dado.sNome <> nomeTime) and (auxL^.prox<>nil) do
	    auxL:= auxL^.prox;

	  QuebraLinha(1);
    writeLn('-> Time: ', auxL^.dado.sNome, ' - Serie ', auxL^.dado.sSerie);
		writeLn('');
    If auxL^.dado.aTitulo.qtd = 0 then
      writeLn('   O time não possui títulos.')
    Else
    begin
	    Write('   - ', auxL^.dado.aTitulo.qtd, ' Título(s): ');
	    For idx:= 1 to auxL^.dado.aTitulo.qtd do
	    Write(auxL^.dado.aTitulo.dado[idx], '; ');	    
    end;

    writeLn('');
	
	  If upcase(auxL^.dado.sSerie)='B' then
    begin 
      If auxL^.dado.aAcesso.qtd = 0 then
      writeLn('   O time nunca foi para série A')
      Else
      begin
        Write('	- ', auxL^.dado.aAcesso.qtd, ' Acesso(s): ');
        For idx:= 1 to auxL^.dado.aAcesso.qtd do
        Write(auxL^.dado.aAcesso.dado[idx], '; ');
      end;
      writeLn('');
    end
    Else
    begin
      If auxL^.dado.aRebaix.qtd = 0 then
        writeLn('   O time nunca foi para série B')
      Else
      begin
        Write('   - ', auxL^.dado.aRebaix.qtd, ' Rebaixamento(s):');
        For idx:= 1 to auxL^.dado.aRebaix.qtd do
        Write(auxL^.dado.aRebaix.dado[idx], '; ');
      end;
      writeLn('');
    end;
  end;
  ReadKey;
end;

// Exibe a lista de times cadastrados de forma crescente ou decrescente          
Procedure MostrarLista(Lista, Fim :ptnodo);
var aux   :ptnodo;
    ordem :integer;
begin
  If Lista=nil then
    MsgListaVazia('times')
  Else
  begin
    writeLn('Deseja a lista em ordem crescente(1) ou decrescente(2)?');
    ReadLn(ordem);
    Case ordem of
      1:
      begin
        aux:= Lista;
        While aux<>nil do
        begin
          writeLn(aux^.dado.sNome, ';');
          aux:=aux^.prox;
        end;
      end;
      2:
      begin
        aux:= Fim;
        While aux<>nil do
        begin
          writeLn(aux^.dado.sNome, '; ');
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
 				  EditTime(TimeA, EscolherTime)
			  Else
				  EditTime(TimeB, EscolherTime);		
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