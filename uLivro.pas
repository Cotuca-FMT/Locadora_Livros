unit uLivro;

interface
  Type oLivro = class
    protected
      iCodigo: Integer;
      sTitulo: String;
      iCodAutor: Integer;

    public
      // Construtor do Objeto
      Constructor Criar;

      // Procedimentos para preencher o valor dos atributos
      Procedure setCodigo(iInput:Integer);
      Procedure setTitulo(sInput:String);
      Procedure setCodAutor(iCod:Integer);
      Procedure setLivro(iInput: Integer; sInput: String; iCod: Integer);

      // Funções para indicar qual o valor dos atributos
      Function getCodigo:Integer;
      Function getTitulo:String;
      Function getCodAutor:Integer;
  end;
implementation

uses System.SysUtils;

   Constructor oLivro.Criar();
   begin
     iCodigo := 0;
     sTitulo := '';
     iCodAutor := 0;
   end;

   Procedure oLivro.setCodigo(iInput: Integer);
   Begin
     if (iInput > 0) then iCodigo := iInput;
   end;

   Procedure oLivro.setTitulo(sInput: String);
   Begin
     if (sInput <> '') then sTitulo := sInput;
   End;

   Procedure oLivro.setCodAutor(iCod:Integer);
   Begin
     if (iCod > 0) then iCodAutor := iCod;
   End;

  Procedure oLivro.setLivro(iInput: Integer; sInput: String; iCod: Integer);
  Begin
     if (iInput > 0) then iCodigo := iInput;
     if (sInput <> '') then sTitulo := sInput;
     if (iCod > 0) then iCodAutor := iCod;
  End;

  Function oLivro.getCodigo:Integer;
  Begin
    result := iCodigo;
  End;

  Function oLivro.getTitulo:String;
  Begin
    result := sTitulo;
  End;

  Function oLivro.getCodAutor:Integer;
  Begin
    result := iCodAutor;
  End;
end.

