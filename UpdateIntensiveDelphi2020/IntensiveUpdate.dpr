program IntensiveUpdate;

uses
  Vcl.Forms,
  UpdateIntensiveDelphi2020.View in 'View\UpdateIntensiveDelphi2020.View.pas' {Form1},
  UpdateIntensiveDelphi2020.Interfaces.Controller in 'Controller\UpdateIntensiveDelphi2020.Interfaces.Controller.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
