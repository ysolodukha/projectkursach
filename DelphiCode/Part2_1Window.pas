unit Part2_1Window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.OleCtrls, SHDocVw,
  Vcl.Imaging.pngimage;

type
  TPart2_1 = class(TForm)
    WebBrowser1: TWebBrowser;
    Image1: TImage;
    Image3: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Part2_1: TPart2_1;

implementation

{$R *.dfm}

Uses Education2Window;

procedure TPart2_1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TPart2_1.FormShow(Sender: TObject);
begin
  WebBrowser1.Navigate(ExtractFilePath(Application.ExeName)+'files\part2_1.html');
  Image3.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\acceptbutton.png');
  Part2_1.Icon.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\icon.ico');
end;

procedure TPart2_1.Image3Click(Sender: TObject);
begin
  Education2.Show;
  Part2_1.Hide;
  if(StrToInt(s)>=1) then
  begin
    ShowMessage('[���������]: �� ��� ������� ��� ����� �����, �������� �� ����� ��������.');
  end;
  if(StrToInt(s)=0) then
  begin
    AssignFile(f,'files\2levelinfo.txt');
    Rewrite(f);
    s:='1';
    writeln(f,s);
    CloseFile(f);
  end;
end;

end.
