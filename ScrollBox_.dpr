program ScrollBox_;

uses
  Forms,
  ScrollBox in 'ScrollBox.pas' {PlanoArquitectonico};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPlanoArquitectonico, PlanoArquitectonico);
  Application.Run;
end.
