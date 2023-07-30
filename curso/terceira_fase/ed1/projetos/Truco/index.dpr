program index;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  unBaralho in 'Units\unBaralho.pas',
  unComunicacao in 'Units\unComunicacao.pas',
  unRodada in 'Units\unRodada.pas',
  unMovimentos in 'Units\unMovimentos.pas',
  unMensagem in 'Truco\Units\unMensagem.pas';

var iIdx :integer;

begin
  TBaralho.Create;
  TRodada.Create;
  TMovimentos.Create;


  Rodada.IniciaRodada(Lista,Fila,ConfigR);

 { If TBaralho <> Nil then
    FreeAndNil(Baralho);
  If TRodada <> Nil then
    FreeAndNil(Rodada);
  If TMovimentos <> Nil then
    FreeAndNil(Movimentos);}
end.





