program pFinal;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils ,
  uAutor in 'uAutor.pas',
  uLeitor in 'uLeitor.pas',
  uLivro in 'uLivro.pas',
  uLocacao in 'uLocacao.pas',
  uLocacoes in 'uLocacoes.pas',
  uAutores in 'uAutores.pas',
  uLeitores in 'uLeitores.pas',
  uLivros in 'uLivros.pas';

var bResp: Boolean;
    cEscolha: char;
    sInput: String;
    locSistema: oLocacoes;
    locItem: oLocacao;
begin
  try
    sInput := '';
    locSistema := oLocacoes.Criar();
    locItem := oLocacao.Criar();
    while (sInput <> 'n') do
    begin
       //ClrScr;
       WriteLn('Benvindo ao sistema de alocação de livros Cotuca 2017');
       Write('Quer alugar (a) ou devolver (d): ');
       ReadLn(sInput);
       if (sInput = 'a')
         then begin
           Write('Qual livro deseja alugar? ');
           Readln(sInput);
           locItem := locSistema.ConsultaLivro(sInput);
           if (locItem <> nil)
             then bResp := locSistema.Alugar(locItem)
             else bResp := false;
           if (bResp)
             then WriteLn('Livro alugado com sucesso')
             else WriteLn('Falha na locação do livro');
         end;
       Write('Deseja continuar (s/n)? ');
       ReadLn(sInput);
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
