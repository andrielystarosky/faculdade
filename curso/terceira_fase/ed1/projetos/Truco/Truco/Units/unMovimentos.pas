{Andriely, Aline e Gabriel Morais}
unit unMovimentos;

interface
uses SysUtils, unRodada, unBaralho;

Type TMovimentos = class
      Procedure Jogar(var cfgRod :TConfigRod);
      Procedure PcJogaPrimeiro (var cfgRod :TConfigRod);
      Procedure PcJogaDepois(var cfgRod :TConfigRod);
      Procedure PcTruca(var cfgRod :TConfigRod);
      Procedure PcDecideTruco(var cfgRod :TConfigRod);
      Procedure PcJoga(var cfgRod :TConfigRod);
      Procedure PontosTruco(var cfgRod :TConfigRod);
      Procedure VerificaPont(var cfgRod :TConfigRod);
      Procedure JogoMaoOnze(var cfgRod :TConfigRod);
end;

var Movimentos : TMovimentos;

implementation
uses unMensagem;

{ TMovimentos }

procedure TMovimentos.Jogar(var cfgRod: TConfigRod);
var iAux, iIdx:integer;
    iAuxCarta :TCarta;
begin
  If cfgRod.iJogVez mod 2 <> 0 then    //pc joga
    begin
      Mensagem.QuebraLinha;
      Sleep(200);
      Mensagem.MostrarManilha(cfgRod);
      WriteLn('Adversario: ');
      If (cfgRod.bEscurinha) or (cfgRod.CartaJogada.iPeso=0) then
      begin
        PcJogaPrimeiro(cfgRod);
        Mensagem.MostrarCarta(cfgRod.CartaJogada);
      end
      else //segunda jogada da subrodada
      begin
        PcJogaDepois(cfgRod);
        Mensagem.MostrarCarta(cfgRod.CartaJogada);
      end;
    end
  Else      //user joga
    begin
      iAux:= Mensagem.DecideJogar(cfgRod);
      If iAux<>10 then
      begin
        Sleep(50);
        cfgRod.CartaAnt:= cfgRod.CartaJogada;
        cfgRod.CartaJogada:= cfgRod.Jogadores[2].CartasRod.aLista[iAux];
        cfgRod.Jogadores[2].CartasRod.iPosAcao:=iAux;
        Baralho.RemoveLista(cfgRod.Jogadores[2].CartasRod);
        dec(cfgRod.Jogadores[2].iCartasDip);
        If cfgRod.bEscurinha then
          Mensagem.MostrarCarta(cfgRod.CartaJogada);
      end
      Else
      begin
        PcDecideTruco(cfgRod);
        If cfgRod.bCond then
        begin
          Jogar(cfgRod)
        end;
      end;
    end;
  //VerificaPont(cfgRod);
end;

procedure TMovimentos.PcJogaPrimeiro(var cfgRod: TConfigRod);
begin
  Sleep(50);
  cfgRod.CartaJogada:= cfgRod.Jogadores[1].CartasRod.aLista[1];
  cfgRod.Jogadores[1].CartasRod.iPosAcao:=1;
  Baralho.RemoveLista(cfgRod.Jogadores[1].CartasRod);
  dec(cfgRod.Jogadores[1].iCartasDip);
end;

procedure TMovimentos.PcJogaDepois(var cfgRod: TConfigRod);
var iAux, iPos  :integer;
    auxCarta    :TCarta;
begin
  Randomize;
  Sleep(50);
  iAux := Random(9)+1;
  If (iAux mod 2 = 0) and (cfgRod.iJogTrucou<>1) and (cfgRod.iMaoOnze=0) then
    PcTruca(cfgRod);
  if cfgRod.bCond then  //user aceitou o truco
    PcJoga(cfgRod);
end;

procedure TMovimentos.PcTruca(var cfgRod: TConfigRod);
begin
  Sleep(10);
  WriteLn('Truco!');
  cfgRod.iJogTrucou:=1;
  case Mensagem.EscolheOpcaoTruco(cfgRod) of
    1: //jogar
    begin
      PontosTruco(cfgRod);
      cfgRod.bCond:=true;
    end;
    2:
    begin
      PcDecideTruco(cfgRod);
      If cfgRod.bCond then
      begin
        cfgRod.iJogTrucou:=2;
        cfgRod.iJogVez:=1;
        Jogar(cfgRod);
      end;
      cfgRod.iJogTrucou:=2;
    end;
    3: //correr
    begin
      cfgRod.bCond:=false;
      cfgRod.Jogadores[1].iPontRod:=5;
    end;
  end;
end;

procedure TMovimentos.PcDecideTruco(var cfgRod: TConfigRod);
var iAux :integer;
begin
  iAux := 72;//Random(99)+1;
  If iAux>50 then
  begin
    If iAux mod 2 = 0 then  //aceitou o truco
    begin
      Sleep(10);
      WriteLn('Aceito!');
      PontosTruco(cfgRod);
      cfgRod.bCond:=true;
    end
    else
    begin
      PontosTruco(cfgRod);
      PcTruca(cfgRod);
    end;
  end
  else
  begin
    Sleep(10);
    WriteLn('Correr');
    cfgRod.bCond:=false;
    cfgRod.Jogadores[2].iPontRod:=3;
  end;
end;

procedure TMovimentos.PcJoga(var cfgRod: TConfigRod);
var CartaAux  :TCarta;
    iPesoComp :integer;
    iAux      :integer;
    iPos      :integer;
    iIdx      :integer;
begin
  CartaAux.iPeso:=0;
  Sleep(50);
  For iIdx:= 1 to cfgRod.Jogadores[1].iCartasDip do //percorre as tres cartas do pc
    If cfgRod.Jogadores[1].CartasRod.aLista[iIdx].iPeso>cfgRod.CartaJogada.iPeso then
      Case CartaAux.iPeso of
        0:
        begin
          CartaAux:= cfgRod.Jogadores[1].CartasRod.aLista[iIdx];
          iPos:= iIdx;
        end
        else
          If cfgRod.Jogadores[1].CartasRod.aLista[iIdx].iPeso<CartaAux.iPeso then
          begin
            CartaAux:= cfgRod.Jogadores[1].CartasRod.aLista[iIdx];
            iPos:= iIdx;
          end;
      end;
  If CartaAux.iPeso=0 then  //pc nao mata a carta jogada, entao joga a mais baixa
  begin
    CartaAux:= cfgRod.Jogadores[1].CartasRod.aLista[1];
    iPos:=1;
    For iAux:= 1 to 2 do
      If cfgRod.Jogadores[1].CartasRod.aLista[iIdx].iPeso<CartaAux.iPeso then
      begin
        CartaAux:= cfgRod.Jogadores[1].CartasRod.aLista[iIdx];
        iPos:=iIdx;
      end;
  end;

  cfgRod.CartaAnt:= cfgRod.CartaJogada;
  cfgRod.CartaJogada:= CartaAux;
  cfgRod.Jogadores[1].CartasRod.iPosAcao:= iPos;
  Baralho.RemoveLista(cfgRod.Jogadores[1].CartasRod);
  dec(cfgRod.Jogadores[1].iCartasDip);
end;

procedure TMovimentos.PontosTruco(var cfgRod: TConfigRod);
begin
  case cfgRod.iRodPont of
        1: cfgRod.iRodPont:=3;
        3: cfgRod.iRodPont:=6;
        6: cfgRod.iRodPont:=9;
        9: cfgRod.iRodPont:=12;
      end;
end;

procedure TMovimentos.VerificaPont(var cfgRod: TConfigRod);
var iIdx :integer;
begin
  If cfgRod.iJogVez mod 2 <> 0 then //pc jogou a carta atual
    begin
      If cfgRod.CartaJogada.iPeso>cfgRod.CartaAnt.iPeso then
      begin
        inc(cfgRod.Jogadores[1].iPontRod);  //ponto para o pc
        cfgRod.iJogVez:=1;
        If cfgRod.iCountRod=1 then
          cfgRod.iVencePri:=1;
      end
      Else
      If cfgRod.CartaJogada.iPeso<cfgRod.CartaAnt.iPeso then
      begin
        inc(cfgRod.Jogadores[2].iPontRod); //ponto para o user
        cfgRod.iJogVez:=2;
        If cfgRod.iCountRod=1 then
          cfgRod.iVencePri:=2;
      end
      Else
      begin
        If cfgRod.iCountRod=3 then
          inc(cfgRod.Jogadores[cfgRod.iVencePri].iPontRod)
        Else
        begin
          If cfgRod.iCountRod=3 then
            inc(cfgRod.Jogadores[cfgRod.iVencePri].iPontRod)
          Else
            For iIdx:= 1 to 2 do
              inc(cfgRod.Jogadores[iIdx].iPontRod);
        end;
      end;
    end
  Else //user jogou a carta atual
    begin
      If cfgRod.CartaJogada.iPeso>cfgRod.CartaAnt.iPeso then
      begin
        inc(cfgRod.Jogadores[2].iPontRod);  //ponto para o user
        cfgRod.iJogVez:=2;
        If cfgRod.iCountRod=1 then
          cfgRod.iVencePri:=2;
      end
      Else
      If cfgRod.CartaJogada.iPeso<cfgRod.CartaAnt.iPeso then
      begin
        inc(cfgRod.Jogadores[1].iPontRod); //ponto para o pc
        cfgRod.iJogVez:=1;
        If cfgRod.iCountRod=1 then
          cfgRod.iVencePri:=1;
      end
      Else
      begin
        If cfgRod.iCountRod=3 then
          inc(cfgRod.Jogadores[cfgRod.iVencePri].iPontRod)
        Else
          For iIdx:= 1 to 2 do
            inc(cfgRod.Jogadores[iIdx].iPontRod);
      end;
    end;
end;

procedure TMovimentos.JogoMaoOnze(var cfgRod: TConfigRod);
var iAux :integer;
begin
  randomize;
  WriteLn('Mao de onze:');
  Sleep(150);
  //pc:
  If (cfgRod.Jogadores[1].iPontJogo=11)and (cfgRod.Jogadores[1].iPontJogo<11) then
  begin
    iAux:= random(99)+1;
    If iAux mod 2 = 0 then
    begin
      Sleep(150);
      WriteLn('Vamos jogar');
      cfgRod.iMaoOnze:=2;
      PontosTruco(cfgRod);
    end
    Else
    begin
      Sleep(150);
      WriteLn('Nao vou.');
      cfgRod.Jogadores[2].iPontRod:=3;
    end;
  end
  //user:
  Else
  If (cfgRod.Jogadores[2].iPontJogo=11) and (cfgRod.Jogadores[1].iPontJogo<11)  then
  begin
    If Mensagem.DecideMaoOnze(cfgRod)=1 then
    begin
      Sleep(150);
      WriteLn('Vamos jogar');
      cfgRod.iMaoOnze:=2;
      PontosTruco(cfgRod);
    end
    Else
    begin
      Sleep(150);
      WriteLn('Nao vou.');
      cfgRod.Jogadores[1].iPontRod:=3;
    end;
  end
  Else
  If (cfgRod.Jogadores[1].iPontJogo=11) and (cfgRod.Jogadores[2].iPontJogo=11) then
  begin
    WriteLn('Escurinha...');
    Sleep(200);
    cfgRod.iMaoOnze:=2;
    cfgRod.bEscurinha:=true;
  end;
end;

end.
