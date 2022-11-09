unit Part2_3Window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.OleCtrls, SHDocVw,
  Vcl.Imaging.pngimage;

type
  TPart2_3 = class(TForm)
    WebBrowser1: TWebBrowser;
    Image1: TImage;
    Image2: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Part2_3: TPart2_3;

implementation

{$R *.dfm}

uses Education2Window;

procedure TPart2_3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TPart2_3.FormShow(Sender: TObject);
begin
  WebBrowser1.Navigate(ExtractFilePath(Application.ExeName)+'files\part2_3.html');
  Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\acceptbutton.png');
  Part2_3.Icon.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\icon.ico');
end;

procedure TPart2_3.Image2Click(Sender: TObject);
begin
  Education2.Show;
  Part2_3.Hide;
  if(StrToInt(s)=0) or (StrToInt(s)=1) then
  begin
    ShowMessage('[���������]: ����� ��������� �������� ��������, ����� ������� �������� ���������������.');
  end;
  if(StrToInt(s)>=3) then
  begin
    ShowMessage('[���������]: �� ��� ������� ��� ����� �����, �������� �� ����� ��������.');
  end;
  if(StrToInt(s)=2) then
  begin
    AssignFile(f,'files\2levelinfo.txt');
    Rewrite(f);
    s:='3';
    writeln(f,s);
    CloseFile(f);
  end;
end;

end.
