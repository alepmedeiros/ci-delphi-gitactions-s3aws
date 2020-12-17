unit UpdateIntensiveDelphi2020.View;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, shellapi, WinInet;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Memo1: TMemo;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    FTamanhoTotal : Integer;
    function GetPathApplication : String;
    function GetFileSize(Value : TFileName) : Int64;
    procedure DownloadUpdate;
    procedure ChecksUpdate;
    procedure DescompactUpdate;
    function VerificarExisteConexaoComInternet: boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.dfm}

{ TForm1 }

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  BitBtn1.Enabled := False;

  Label2.Caption := 'Aguarde...';
  Application.ProcessMessages;

  try
    if not VerificarExisteConexaoComInternet then
      exit;

      ChecksUpdate;
      DownloadUpdate;

      ShowMessage('O sistema foi atualizado com sucesso!');
  finally

  end;
end;

procedure TForm1.ChecksUpdate;
var
  lData : TDateTime;
  arq : TStringList;
  dttime:string;
begin
  Label2.Caption := 'Verificando Atualização';

  ShellExecute(0, nil, 'cmd.exe', PWideChar('/c aws s3 ls s3://intensivedephi/IntensiveDelphi2020.zip > '+
      GetPathApplication + 'status.txt'), nil,0);
  Sleep(3000);

  arq := TStringList.Create;
  try
    arq.LoadFromFile(GetPathApplication+'status.txt');
    dttime := arq[0];
    dttime := copy(dttime,9,2)+'/'+copy(dttime,6,2)+'/'+copy(dttime,1,4)+' '+copy(dttime,12,8);
  finally
    arq.Free;
    DeleteFile(GetPathApplication + 'status.txt');
  end;

  if FileExists(GetPathApplication + 'IntenseveDelphi2020.exe') then
  begin
    if StrToDateTime(dttime)>
      FileDateToDateTime(FileAge(GetPathApplication + 'IntenseveDelphi2020.exe')) then
  end;
end;

procedure TForm1.DescompactUpdate;
var
  lNameUp : String;
begin
  Label2.Caption := 'Descompactando..';
  if FileExists(GetPathApplication + 'IntensiveDelphi2020_BKP.exe') then
    DeleteFile(GetPathApplication + 'IntensiveDelphi2020_BKP.exe');

  if FileExists(GetPathApplication + 'IntensiveDelphi2020.exe') then
    RenameFile(GetPathApplication + 'IntensiveDelphi2020.exe',
      GetPathApplication + 'IntensiveDelphi2020_BKP.exe');

  lNameUp := GetPathApplication + 'IntensiveDelphi2020.zip';

  ShellExecute(0, nil, 'cmd.exe', PWideChar('/c c:\lixo\7z x '+lNameUp+' -o'+GetPathApplication), nil,0);
end;

procedure TForm1.DownloadUpdate;
begin
  Label2.Caption := 'Download...';
  if FileExists(GetPathApplication + 'IntensiveDelphi2020.zip') then
    DeleteFile(GetPathApplication + 'IntensiveDelphi2020.zip');

  ShellExecute(0, nil, 'cmd.exe', PWideChar('/c aws s3 cp s3://intensivedephi/IntensiveDelphi2020.zip ' +
      GetPathApplication), nil,0);

  while not FileExists(GetPathApplication + 'IntensiveDelphi2020.zip') do
    Label2.Caption := 'Download...';

  DescompactUpdate;
end;

function TForm1.GetFileSize(Value: TFileName): Int64;
begin
  with TFileStream.Create(Value, fmOpenRead or fmShareExclusive) do
  try
    Result := Size;
  finally
   Free;
  end;
end;

function TForm1.GetPathApplication: String;
begin
  result := ExtractFilePath(Application.ExeName);
end;

function TForm1.VerificarExisteConexaoComInternet: boolean;
var
  nFlags: Cardinal;
begin
  result := InternetGetConnectedState(@nFlags, 0);
end;

end.
