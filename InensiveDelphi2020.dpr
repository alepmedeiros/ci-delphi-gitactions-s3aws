program InensiveDelphi2020;

uses
  Vcl.Forms,
  Main in 'Main.pas' {frmMain},
  Calculadora in 'Calculadora.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
