unit uLivros;

interface
Uses uLivro;

Const MAX_LIVROS = 30;

Type
  vLivros = Array[1..MAX_LIVROS] of oLivro;

  oLivros = class
    protected
      vVet: vLivros;
      iLimite: Integer;
      iTotal: Integer;
      iPosicaoAtual:integer;

    public
      // Construtor do Objeto
      Constructor Criar;

      Function incluir(leiInput: oLivro):boolean;
      Function excluir(iCodLeitor: Integer):boolean;
      Function consulta(iCodLeitor: Integer):boolean;
      Function livrosTotal(): Integer;

      // Funções relativas ao caminhar no vVetor pelo "posicao"
      Function livroAtual: oLivro;
      Function EhOUltimo: Boolean;
      Function EhOPrimeiro: Boolean;
      Procedure vaiParaPrimeiro;
      Procedure vaiParaUltimo;
      Procedure vaiParaProximo;
      Procedure vaiParaAnterior;


  end;

implementation
   Constructor oLivros.Criar;
   var i: Integer;
   begin
     iLimite := MAX_LIVROS;
     // inicialização do vetor
     for i:= 1 to iLimite do
       vVet[i] := oLivro.Criar();
     // carga do vetor
     vVet[1].setLivro(1,'Os Maias',1);
     vVet[2].setLivro(2,'A Divina Comédia',2);
     vVet[3].setLivro(3,'20000 Mil Léguas Submarinas',29);
     iTotal := 3;
     iPosicaoAtual := 3;
   end;

   Function oLivros.incluir(leiInput: oLivro):boolean;
   Begin
     result := false;
     if (iTotal < iLimite) then
     Begin
       iTotal := iTotal + 1;
       //vVet[iTotal].setLivro();
       result := true;
     End;
   End;

   Function oLivros.excluir(iCodLeitor: Integer):boolean;
   Begin
     result := false;
   End;

   Function oLivros.consulta(iCodLeitor: Integer):boolean;
   Begin
     result := false;
   End;

  Function OLivros.livrosTotal(): Integer;
  Begin
    result := iTotal;
  End;

  Function oLivros.livroAtual:oLivro;
  Begin
    if iPosicaoAtual=0 then result:=nil
    else result:=vVet[iPosicaoAtual];
  End;

  Function oLivros.EhOUltimo:Boolean;
  Begin
    result:=(iPosicaoAtual=iLimite);
  End;
  Function oLivros.EhOPrimeiro:Boolean;
  Begin
    result:=(iPosicaoAtual=1);
  End;

  Procedure oLivros.vaiParaPrimeiro;
  Begin
    if (iLimite<>0) then iPosicaoAtual:=1
    else                iPosicaoAtual:=0;
  End;
  Procedure oLivros.vaiParaUltimo;
  Begin
    iPosicaoAtual:=iLimite;
  End;
  Procedure oLivros.vaiParaProximo;
  Begin
    iPosicaoAtual:=iPosicaoAtual+1;
    if iPosicaoAtual>iLimite then
      iPosicaoAtual:=iLimite;
  End;
  Procedure oLivros.vaiParaAnterior;
  Begin
    iPosicaoAtual:=iPosicaoAtual-1;
    if (iPosicaoAtual<1) and (iLimite<>0) then
      iPosicaoAtual:=1
    else
      iPosicaoAtual:=0;
  End;

end.

