unit uAutores;

interface
Uses uAutor;

Const MAX_AUTORES = 30;

Type
  vAutores = Array[1..MAX_AUTORES] of oAutor;

  oAutores = class
    protected
      vVet: vAutores;
      iLimite:Integer;
      iPosicaoAtual:integer;

    public
      // Construtor do Objeto
      Constructor Criar;

      Function incluir(autInput:oAutor):boolean;
      Function excluir(iCodAutor:Integer):boolean;
      Function consulta(iCodAutor:Integer):boolean;

      // Funções relativas ao caminhar no vetor pelo "posicao"
      Function autorAtual:oAutor;
      Function EhOUltimo:Boolean;
      Function EhOPrimeiro:Boolean;
      Procedure vaiParaPrimeiro;
      Procedure vaiParaUltimo;
      Procedure vaiParaProximo;
      Procedure vaiParaAnterior;
  end;

implementation
   Constructor oAutores.Criar;
   var i: Integer;
   begin
     iLimite := MAX_AUTORES;
     // inicializar vetor
     for i := 1 to iLimite do
       vVet[i] := oAutor.Criar();
     // carga inicial
      vVet[1].setCodigo(1);
      vVet[1].setNome('Eça de Queirós');
      vVet[2].setCodigo(2);
      vVet[2].setNome('Dante Alighieri');
      vVet[3].setCodigo(3);
      vVet[3].setNome('Jonathan Swift');
      vVet[4].setCodigo(4);
      vVet[4].setNome('Jorge Amado');
      vVet[5].setCodigo(5);
      vVet[5].setNome('Gabriel García Márquez');
      vVet[6].setCodigo(6);
      vVet[6].setNome('Carlos Drummond de Andrade');
      vVet[7].setCodigo(7);
      vVet[7].setNome('Miguel de Cervantes');
      vVet[8].setCodigo(8);
      vVet[8].setNome('Marcel Proust');
      vVet[9].setCodigo(9);
      vVet[9].setNome('Liev Tolstói');
      vVet[10].setCodigo(10);
      vVet[10].setNome('William Shakespeare');
      vVet[11].setCodigo(11);
      vVet[11].setNome('Homero');
      vVet[12].setCodigo(12);
      vVet[12].setNome('José de Alencar');
      vVet[13].setCodigo(13);
      vVet[13].setNome('Pepetela');
      vVet[14].setCodigo(14);
      vVet[14].setNome('Machado de Assis');
      vVet[15].setCodigo(15);
      vVet[15].setNome('Helena Morley');
      vVet[16].setCodigo(16);
      vVet[16].setNome('Emily Brontë');
      vVet[17].setCodigo(17);
      vVet[17].setNome('J. D. Salinger');
      vVet[18].setCodigo(18);
      vVet[18].setNome('Aluísio Azevedo');
      vVet[19].setCodigo(19);
      vVet[19].setNome('Scott Fitzgerald');
      vVet[20].setCodigo(20);
      vVet[20].setNome('Jane Austen');
      vVet[21].setCodigo(21);
      vVet[21].setNome('Luís de Camões');
      vVet[22].setCodigo(22);
      vVet[22].setNome('Ivan Turguêniev');
      vVet[23].setCodigo(23);
      vVet[23].setNome('William Shakespeare');
      vVet[24].setCodigo(24);
      vVet[24].setNome('Virginia Woolf');
      vVet[25].setCodigo(25);
      vVet[25].setNome('João Guimarães Rosa');
      vVet[26].setCodigo(26);
      vVet[26].setNome('José de Alencar');
      vVet[27].setCodigo(27);
      vVet[27].setNome('James Joyce');
      vVet[28].setCodigo(28);
      vVet[28].setNome('Graciliano Ramos');
      vVet[29].setCodigo(29);
      vVet[29].setNome('Jules Vernes');
      iPosicaoAtual := 29;
  end;

  Function oAutores.incluir(autInput:oAutor):boolean;
  Begin
    result := false;
    if (iPosicaoAtual < iLimite)
    then begin
      vVet[iPosicaoAtual] := autInput;
      result := true;
    end;
  End;

  Function oAutores.excluir(iCodAutor:Integer):boolean;
  Begin
    result := false;
  End;

  Function oAutores.consulta(iCodAutor:Integer):boolean;
  Begin
    result := false;
  End;

  Function oAutores.autorAtual:oAutor;
  Begin
    if (iPosicaoAtual = 0)
      then result :=nil
      else result :=vVet[iPosicaoAtual];
  End;

  Function oAutores.EhOUltimo:Boolean;
  Begin
    result := (iPosicaoAtual = iLimite);
  End;

  Function oAutores.EhOPrimeiro:Boolean;
  Begin
    result := (iPosicaoAtual=1);
  End;

  Procedure oAutores.vaiParaPrimeiro;
  Begin
    if (iLimite<>0)
      then iPosicaoAtual := 1
      else iPosicaoAtual := 0;
  End;

  Procedure oAutores.vaiParaUltimo;
  Begin
    iPosicaoAtual := iLimite;
  End;

  Procedure oAutores.vaiParaProximo;
  Begin
    iPosicaoAtual := iPosicaoAtual+1;
    if (iPosicaoAtual > iLimite)
      then iPosicaoAtual:=iLimite;
  End;

  Procedure oAutores.vaiParaAnterior;
  Begin
    iPosicaoAtual := iPosicaoAtual-1;
    if ((iPosicaoAtual < 1) and (iLimite <> 0))
      then
        iPosicaoAtual:=1
      else
        iPosicaoAtual:=0;
  End;

end.
