unit uLocacoes;

interface

Uses uLivro, uLivros, uLocacao;

Const MAX_LOCACOES = 100;

Type
  // Definir um tipo para representar o Vetor
  vLocacoes = Array[1..MAX_LOCACOES] of oLocacao;

  // Definir um tipo para representar o Objeto
  oLocacoes = class
    protected
      vVet: vLocacoes;  // o vetor de objetos
      iLimite: Integer;  // o limite logico
      iPosicaoAtual: Integer;  // a posição atual de navegação no vetor
      // Definir livros disponíveis para locação
      lLivrosDisp: oLivros;

    public
      // Construtor do Objeto
      Constructor Criar;

      // Operações de locação e devolução
      Function Alugar(locAluga: oLocacao):boolean;
      Function Devolver(iCodLivro: Integer):Boolean;

      // Opções de Relatorio
      //Function ConsultaLivro(iCodLivro: Integer):oLocacao;
      Function ConsultaLivro(sTitulo: String):oLocacao;
      Function LivrosComLeitorAgora(iCodLeitor: Integer):vLocacoes;
      Function LivrosLocadosPeloLeitor(iCodLeitor: Integer):vLocacoes;

      // Funções relativas ao caminhar no vetor pelo "posicao"
      Function locacacaoAtual:oLocacao;
      Function EhOUltimo:Boolean;
      Function EhOPrimeiro:Boolean;

      Procedure vaiParaPrimeiro;
      Procedure vaiParaUltimo;
      Procedure vaiParaProximo;
      Procedure vaiParaAnterior;
  end;

implementation
  Constructor oLocacoes.Criar;
  var i: Integer;
      lAtual: oLivro;
  begin
     iPosicaoAtual := 0;
     iLimite := MAX_LOCACOES;
     lLivrosDisp := oLivros.Criar();
     // inicialização
     for i := 1 to iLimite do
       vVet[i] := oLocacao.Criar();
     // inicializar a biblioteca de livros
     lLivrosDisp.vaiParaPrimeiro();
     for i := 1 to lLivrosDisp.livrosTotal() do
     Begin
       lAtual := lLivrosDisp.livroAtual();
       if (lAtual <> nil) then
       Begin
         vVet[i].setCodLivro(lAtual.getCodigo());
         vVet[i].setTitulo(lAtual.getTitulo());
       End;
     End;
  end;

  Function oLocacoes.Alugar(locAluga: oLocacao): boolean;
  begin
    result := false;
    if (iPosicaoAtual < iLimite)
    then
      begin
         iPosicaoAtual := iPosicaoAtual+1;
         vVet[iPosicaoAtual] := locAluga;
         result := true;
      end;
  end;

  Function oLocacoes.Devolver(iCodLivro: Integer): boolean;
  var i: Integer;
      sData: String;
  begin
    result := false;
    if (iCodLivro > 0)
    then
      begin
        i := 1;
        while ((i < iLimite) and (vVet[1].getCodLivro() <> iCodLivro)) do
          i := i+1;
        if (vVet[1].getCodLivro() <> iCodLivro) then
        begin
          // livro encontrado

          vVet[i].setDataDevolucao(sData);
          result := true;
        end;
      end;
  end;

  {Function oLocacoes.ConsultaLivro(iCodLivro: Integer): oLocacao;
  var i: Integer;
  begin
     i := 0;
     result := nil;
     while ((i < iLimite) and (vVet[i].getCodLivro() <> iCodLivro))
       do i := i +1;
     if (vVet[i].getCodLivro() = iCodLivro)
       then result := vVet[i];
  end; }

  Function oLocacoes.ConsultaLivro(sTitulo: String):oLocacao;
  var i: Integer;
  begin
     i := 1;
     result := nil;
     while ((i < iLimite) and (vVet[i].getTitulo() <> sTitulo))
       do i := i +1;
     if (vVet[i].getTitulo() = sTitulo)
       then result := vVet[i];
  end;

  Function oLocacoes.LivrosComLeitorAgora(iCodLeitor: Integer):vLocacoes;
  Begin
    result := vVet;
  End;
  {*******
    Função locacacaoAtual, retorna a locação que está na
      posição atual do vetor.
      Caso não existam elementos no vetor, retorna nil
  }
  Function oLocacoes.locacacaoAtual:oLocacao;
  Begin
    if (iPosicaoAtual = 0)
      then result := nil
      else result := vVet[iPosicaoAtual];
  End;

  {*******
    Função EhOUltimo retorna true caso o atributo
    posicaoAtual esteja sobre o ultimo elemento
    do vetor e false caso contrário
  }
  Function oLocacoes.EhOUltimo:Boolean;
  Begin
    result := (iPosicaoAtual = iLimite);
  End;

  {*******
    Função EhOPrimeiro retorna true caso o atributo
    posicaoAtual esteja sobre o primeiro elemento
    do vetor e false caso contrário
  }
  Function oLocacoes.EhOPrimeiro:Boolean;
  Begin
    result := (iPosicaoAtual = 1);
  End;

  {*******
     Procedimento vaiParaPrimeiro posiciona o atributo
     posicaoAtual sobre o primeiro elemento do vetor,
     caso ele tenha elementos. Caso ele não tenha elementos
     o atributo fica em zero.
  }
  Procedure oLocacoes.vaiParaPrimeiro;
  Begin
    if (iLimite <> 0)
      then iPosicaoAtual := 1
      else iPosicaoAtual := 0;
  End;

  {*******
     Procedimento vaiParaUltimo posiciona o atributo
     posicaoAtual sobre o ultimo elemento do vetor,
     caso ele tenha elementos. Caso ele não tenha elementos
     o atributo fica em zero, como indica o limite logico.
  }
  Procedure oLocacoes.vaiParaUltimo;
  Begin
    iPosicaoAtual := iLimite;
  End;

  {*******
     Procedimento vaiParaProximo posiciona o atributo
     posicaoAtual sobre o proximo elemento do vetor.
     Caso a posicao atual seja a ultima, ele deve permanecer
     onde estava
  }
  Procedure oLocacoes.vaiParaProximo;
  Begin
    iPosicaoAtual := iPosicaoAtual+1;
    if (iPosicaoAtual > iLimite)
      then iPosicaoAtual := iLimite;
  End;

  {*******
     Procedimento vaiParaAnterior posiciona o atributo
     posicaoAtual sobre o elemento anterior do vetor.
     Caso a posicao atual seja a primeira, ele deve permanecer
     onde estava
  }
  Procedure oLocacoes.vaiParaAnterior;
  Begin
    iPosicaoAtual := iPosicaoAtual-1;
    if (iPosicaoAtual < 1) and (iLimite <> 0)
    then
      iPosicaoAtual := 1
    else
      iPosicaoAtual := 0;
  End;

  Function oLocacoes.LivrosLocadosPeloLeitor(iCodLeitor:Integer):vLocacoes;
 var
  locacoesLeitor : vLocacoes;
  index          : integer;
 begin
  index := 0;

  vaiParaPrimeiro;
  while not EhOUltimo do
    if (vVet[iPosicaoAtual].getCodLeitor = iCodLeitor)
    then
      if (vVet[iPosicaoAtual].getDevolvido()) then
      begin
        locacoesLeitor[index] := vVet[iPosicaoAtual];
        index := index + 1;
        vaiParaProximo;
      end;


  result := locacoesLeitor;
 end;

end.

