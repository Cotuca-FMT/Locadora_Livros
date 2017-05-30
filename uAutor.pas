unit uAutor;

interface
  Type oAutor = class
    protected
      iCodigo: Integer;
      sNome:String;

    public
      // Construtor do Objeto
      Constructor Criar;

      // Procedimentos para preencher o valor dos atributos
      Procedure setCodigo(iInput:Integer);
      Procedure setNome(sInput:String);

      // Funções para indicar qual o valor dos atributos
      Function getCodigo:Integer;
      Function getNome:String;
  end;

implementation
      Constructor oAutor.Criar();
      begin
        iCodigo := 0;
        sNome := '';
      end;

      Procedure oAutor.setCodigo(iInput: Integer);
      begin
        if (iInput > 0) then
          iCodigo := iInput;
      end;

      Procedure oAutor.setNome(sInput: String);
      begin
          if (sInput <> '') then sNome := sInput;
      end;

      Function oAutor.getCodigo: Integer;
      begin
        result := iCodigo;
      end;

      Function oAutor.getNome: String;
      begin
        result := sNome;
      end;
end.
