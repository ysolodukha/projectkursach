unit LoadWindow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.Samples.Gauges, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.Menus,ShellAPI;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Gauge1: TGauge;
    Timer1: TTimer;
    Label1: TLabel;
    Timer2: TTimer;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    procedure Label1ClickTimer(Sender: TObject);
    procedure Image1ClickTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses MainMenu;


procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\mainbackground.jpeg');
  Form1.Icon.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\icon.ico');
end;

procedure TForm1.Image1ClickTimer(Sender: TObject);
begin
  if(Gauge1.Visible=False) then
  begin
    Gauge1.Visible:=True;
    Label1.Visible:=False;
    Timer2.Enabled:=False;
    Timer1.Enabled:=True;
  end;
  Gauge1.Progress:=Gauge1.Progress+1;
  if(Gauge1.Progress=100) then
  begin
    Timer1.Enabled:=False;
    Form1.Hide;
    Form3.Show;
  end;
end;

procedure TForm1.Label1ClickTimer(Sender: TObject);
begin
  if(Label1.Visible=True) then Label1.Visible:=False
  else Label1.Visible:=True;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  ShellExecute(0,PChar('Open'),PChar('Delphihelp.chm'),nil,nil,SW_SHOW);
end;

end.
