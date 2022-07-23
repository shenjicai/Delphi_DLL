unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, MSCommLib_TLB, SPComm;

type
  TForm1 = class(TForm)
    btn1: TButton;
    edt1: TEdit;
    cm1: TComm;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function AE210_ComIni(comnum: integer; comspeed: integer): integer;
  stdcall; external 'AE210.DLL';
function AE210_CloseCom(hDevice: integer): integer; stdcall; external 'AE210.DLL';
function AE210_CAL(hDevice: integer): integer; stdcall; external 'AE210.DLL';
function AE210_AD(hDevicew: integer; Adch: integer; Adg: integer;
  sidi: integer; naver: integer): integer; stdcall; external 'AE210.DLL';

var
  Form1: TForm1;
   hDevice:DWORD ;
implementation

{$R *.dfm}



procedure TForm1.btn1Click(Sender: TObject);

begin

  Edt1.Text := IntToStr(AE210_CAL(hDevice));
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
 cm1.StartComm ;
  hDevice := AE210_ComIni(1, 115200);
end;

end.
