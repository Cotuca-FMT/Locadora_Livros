unit uLeitores;

interface
Uses uLeitor;

Const MAX_LEITORES = 30;

Type
  vLeitores = Array[1..MAX_LEITORES] of oLeitor;

  oLeitores = class
    protected
      vVet: vLeitores;
      iLimite:Integer;
      iPosicaoAtual:integer;

    public
      // Construtor do Objeto
      Constructor Criar;

      Function incluir(leiInput: oLeitor):boolean;
      Function excluir(iCodLeitor: Integer):boolean;
      Function consulta(iCodLeitor: Integer):boolean;

      // Funções relativas ao caminhar no vVetor pelo "posicao"
      Function leitorAtual:oLeitor;
      Function EhOUltimo:Boolean;
      Function EhOPrimeiro:Boolean;

      Procedure vaiParaPrimeiro;
      Procedure vaiParaUltimo;
      Procedure vaiParaProximo;
      Procedure vaiParaAnterior;
 end;

implementation
   Constructor oLeitores.Criar;
   var i: Integer;
   begin
     iPosicaoAtual := 0;
     iLimite := MAX_LEITORES;
     for i := 1 to iLimite do
       vVet[i] := oLeitor.Criar();
   end;

   Function oLeitores.incluir(leiInput: oLeitor):boolean;
   Begin
     result := false;
   End;

   Function oLeitores.excluir(iCodLeitor: Integer):boolean;
   Begin
     result := false;
   End;

   Function oLeitores.consulta(iCodLeitor: Integer):boolean;
   Begin
     result := false;
   End;

  Function oLeitores.leitorAtual:oLeitor;
  Begin
    if iPosicaoAtual=0 then result:=nil
    else result:=vVet[iPosicaoAtual];
  End;

  Function oLeitores.EhOUltimo:Boolean;
  Begin
    result:=(iPosicaoAtual=iLimite);
  End;

  Function oLeitores.EhOPrimeiro:Boolean;
  Begin
    result:=(iPosicaoAtual=1);
  End;

  Procedure oLeitores.vaiParaPrimeiro;
  Begin
    if (iLimite<>0) then iPosicaoAtual:=1
    else                iPosicaoAtual:=0;
  End;
  Procedure oLeitores.vaiParaUltimo;
  Begin
    iPosicaoAtual:=iLimite;
  End;
  Procedure oLeitores.vaiParaProximo;
  Begin
    iPosicaoAtual:=iPosicaoAtual+1;
    if iPosicaoAtual>iLimite then
      iPosicaoAtual:=iLimite;
  End;
  Procedure oLeitores.vaiParaAnterior;
  Begin
    iPosicaoAtual:=iPosicaoAtual-1;
    if (iPosicaoAtual<1) and (iLimite<>0) then
      iPosicaoAtual:=1
    else
      iPosicaoAtual:=0;
  End;

end.

