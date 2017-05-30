unit uLeitor;

interface
  Type oLeitor = class
    protected
      iCodigo: Integer;
      sNome: String;

    public
      // Construtor do Objeto
      Constructor Criar();

      // Procedimentos para preencher o valor dos atributos
      Procedure setCodigo(iInput: Integer);
      Procedure setNome(sInput: String);

      // Funções para indicar qual o valor dos atributos
      Function getCodigo:Integer;
      Function getNome:String;
  end;

implementation
      Constructor oLeitor.Criar();
      begin
        iCodigo := 0;
        sNome := '';
      end;

      Procedure oLeitor.setCodigo(iInput: Integer);
      begin
        if (iInput > 0) then
          iCodigo := iInput;
      end;

      Procedure oLeitor.setNome(sInput: String);
      begin
          if (sInput <> '') then sNome := sInput;
      end;

      Function oLeitor.getCodigo: Integer;
      begin
        result := iCodigo;
      end;

      Function oLeitor.getNome: String;
      begin
        result := sNome;
      end;

end.

