{Andriely, Aline e Gabriel Morais}
unit unMensagem;

interface

uses SysUtils, unRodada, unBaralho;

Type TMensagem = class
      Function  PerguntaPosCorte :integer;
      Function  DecideJogar(var cfgRod :TConfigRod) :integer;
      Procedure MostrarCartas(cfgRod :TConfigRod);
      Procedure MostrarOpcoes(cfgRod :TConfigRod);
      Function  EscolherCarta :integer;
      Procedure MostrarCarta(Carta :TCarta);
      Function  EscolheOpcaoTruco(cfgRod :TConfigRod) :integer;
      Procedure MostrarManilha (cfgRod :TConfigRod);
      Procedure MostraVencedor(cfgRod : TConfigRod);
      Procedure QuebraLinha;
      Function  DecideMaoOnze(cfgRod :TConfigRod) :integer;
end;

var Mensagem : TMensagem;

implementation

{ TMensagem }

function TMensagem.PerguntaPosCorte: integer;
begin
  Sleep(100);
  Repeat
    WriteLn('Em que posicao deseja cortar?');
    Write(' ->');
    ReadLn(Result);
    If (Result<=0) or (Result>40) then
    begin
      WriteLn('Inválido. Tente novamente.');
      QuebraLinha;
    end;
  Until (Result>0) and (Result<=40);
end;

function TMensagem.DecideJogar(var cfgRod: TConfigRod): integer;
begin
  MostrarCartas(cfgRod);

  MostrarOpcoes(cfgRod);
  ReadLn(Result);
  If result = 1 then
    Result:= EscolherCarta
  Else
  begin
    cfgRod.iJogTrucou:=2;
    Result:=10; //significa que pediu truco
  end;
end;

procedure TMensagem.MostrarCartas(cfgRod: TConfigRod);
var iIdx :integer;
begin
  Sleep(100);
  MostrarManilha(cfgRod);

  Sleep(50);
  If not cfgRod.bEscurinha then
  begin
    WriteLn('Suas cartas:');
    For iIdx:= 1 to cfgRod.Jogadores[cfgRod.iJogVez].iCartasDip do
    begin
      Write('Posicao '+IntToStr(iIdx)+' - ');
      MostrarCarta(cfgRod.Jogadores[cfgRod.iJogVez].CartasRod.aLista[iIdx]);
    end;
  end;
end;

procedure TMensagem.MostrarOpcoes(cfgRod :TConfigRod);
begin
  Sleep(100);
  WriteLn('Sua vez:');
  WriteLn('');
  WriteLn('|1|Jogar');
  If (cfgRod.iJogTrucou <> cfgRod.iJogVez) and (cfgRod.iMaoOnze<>2) then
    WriteLn('|2|Trucar');
  Write(' ->');
end;

function TMensagem.EscolheOpcaoTruco(cfgRod :TConfigRod): integer;
begin
  Sleep(100);
  WriteLn('|1|Jogar');
  If (cfgRod.iJogTrucou<>cfgRod.iJogVez) and (cfgRod.iMaoOnze<>2) then
    WriteLn('|2|Aumentar truco');
  If (cfgRod.iMaoOnze<>2) then
    WriteLn('|3|Correr');
  Write(' ->');
  ReadLn(Result);
end;

function TMensagem.EscolherCarta: integer;
begin
  Sleep(100);
  WriteLn('Qual carta deseja jogar?');
  Write(' ->');
  ReadLn(Result);
end;

procedure TMensagem.MostrarCarta(Carta: TCarta);
begin
  Sleep(100);
  WriteLn('Carta :');
    Write(IntToStr(Carta.iNum)+' de ');
    Case Carta.iNaipe of
      1: writeln('paus.');
      2: writeln('copas.');
      3: writeln('espadas.');
      4: writeln('moles.');
    end;
  WriteLn('');
end;

procedure TMensagem.MostrarManilha(cfgRod: TConfigRod);
begin
  Sleep(50);
  Write('Virou - ');
  MostrarCarta(cfgRod.Manilha);
end;

procedure TMensagem.MostraVencedor(cfgRod: TConfigRod);
begin
  Sleep(100);
  If cfgRod.Jogadores[1].iPontJogo>cfgRod.Jogadores[2].iPontJogo then
    WriteLn('Voce perdeu!')
  Else
    WriteLn('Voce ganhou!');
end;

procedure TMensagem.QuebraLinha;
begin
  WriteLn('');
  WriteLn('--------------------------------------------------------------------------------');
  WriteLn('');
end;

Function TMensagem.DecideMaoOnze(cfgRod :TConfigRod) :integer;
begin
  MostrarCartas(cfgRod);
  WriteLn('|1|Jogar');
  WriteLn('|2|Correr');
  Write(' ->');
  ReadLn(Result);
end;

end.
