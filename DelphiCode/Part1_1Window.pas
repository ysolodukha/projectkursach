unit Part1_1Window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.StdCtrls;

type
  TPart1_1 = class(TForm)
    WebBrowser1: TWebBrowser;
    Image1: TImage;
    Image3: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Image3MouseEnter(Sender: TObject);
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Part1_1: TPart1_1;
  f:TextFile;

implementation

{$R *.dfm}

uses EducationWindow;


procedure TPart1_1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TPart1_1.FormShow(Sender: TObject);
begin
  WebBrowser1.Navigate(ExtractFilePath(Application.ExeName)+'files\part1_1.html');
  Image3.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\acceptbutton.png');
  Part1_1.Icon.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\icon.ico');
end;

procedure TPart1_1.Image3Click(Sender: TObject);
begin
  Education.Show;
  Part1_1.Hide;
  if(StrToInt(s)>=1) then
  begin
    ShowMessage('[���������]: �� ��� ������� ��� ����� �����, �������� �� ����� ��������.');
  end;
  if(StrToInt(s)=0) then
  begin
    AssignFile(f,'files\1levelinfo.txt');
    Rewrite(f);
    s:='1';
    writeln(f,s);
    CloseFile(f);
  end;
end;

procedure TPart1_1.Image3MouseEnter(Sender: TObject);
begin
  if(Image3.Proportional=True) then Image3.Proportional:=False;
end;

procedure TPart1_1.Image3MouseLeave(Sender: TObject);
begin
  if(Image3.Proportional=False) then Image3.Proportional:=True;
end;

end.
