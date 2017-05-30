unit uLocacao;

interface
  Type oLocacao = class
    protected
      iCodLivro: Integer;
      sTitulo: String;
      iCodLeitor: Integer;
      sDataLocacao: String;
      sDataDevolucao: String;
      bDevolvido: Boolean;

    public
      // Construtor do Objeto
      Constructor Criar;

      // Procedimentos para preencher o valor dos atributos
      Procedure setCodLivro(iCodigo: Integer);
      Procedure setCodLeitor(iLeitor: Integer);
      Procedure setTitulo(sInput: String);
      Procedure setDataLocacao(sData: String);
      Procedure setDataDevolucao(sData: String);
      Procedure setDevolvido(bDev: Boolean);

      // Funções para indicar qual o valor dos atributos
      Function getCodLivro: Integer;
      Function getTitulo: String;
      Function getCodLeitor: Integer;
      Function getDataLocacao: String;
      Function getDataDevolucao: String;
      Function getDevolvido: Boolean;

  end;

implementation
  Constructor oLocacao.Criar();
  begin
     iCodLivro := 0;
     sTitulo := '';
     iCodLeitor := 0;
     sDataLocacao := '';
     sDataDevolucao  := '';
     bDevolvido := true;
  end;

  Procedure oLocacao.setCodLivro(iCodigo: Integer);
  begin
    if (iCodigo > 0) then iCodLivro := iCodigo;
  end;

  Procedure oLocacao.setTitulo(sInput: String);
  Begin
    if (sInput <> '') then sTitulo := sInput;
  End;

  Procedure oLocacao.setCodLeitor(iLeitor: Integer);
  begin
    if (iLeitor > 0) then iCodLeitor := iLeitor;
  end;

  Procedure oLocacao.setDataLocacao(sData: string);
  begin
    if (sData <> '') then sDataLocacao := sData;
  end;

  Procedure oLocacao.setDataDevolucao(sData: string);
  begin
    if (sData <> '') then sDataDevolucao := sData;
  end;

  Procedure oLocacao.setDevolvido(bDev: Boolean);
  begin
    bDevolvido := bDev;
  end;

  Function oLocacao.getCodLivro;
  begin
    result := iCodLivro;
  end;

  Function oLocacao.getTitulo: String;
  Begin
    result := sTitulo;
  End;

  Function oLocacao.getCodLeitor;
  begin
    result := iCodLeitor;
  end;

  Function oLocacao.getDataLocacao;
  begin
    result := sDataLocacao;
  end;

  Function oLocacao.getDataDevolucao;
  begin
    result := sDataDevolucao;
  end;

  Function oLocacao.getDevolvido;
  begin
    result := bDevolvido;
  end;
end.
