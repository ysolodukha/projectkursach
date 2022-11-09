unit Part2_2Window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.OleCtrls, SHDocVw,
  Vcl.Imaging.pngimage;

type
  TPart2_2 = class(TForm)
    WebBrowser1: TWebBrowser;
    Image1: TImage;
    Part2_2Accept: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Part2_2AcceptClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Part2_2: TPart2_2;

implementation

{$R *.dfm}

Uses Education2Window;

procedure TPart2_2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TPart2_2.FormShow(Sender: TObject);
begin
  WebBrowser1.Navigate(ExtractFilePath(Application.ExeName)+'files\part2_2.html');
  Part2_2Accept.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\acceptbutton.png');
  Part2_2.Icon.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\icon.ico');
end;

procedure TPart2_2.Part2_2AcceptClick(Sender: TObject);
begin
  Education2.Show;
  Part2_2.Hide;
  if(StrToInt(s)=0) then
  begin
    ShowMessage('[���������]: ����� ��������� �������� ��������, ����� ������� �������� ���������������.');
  end;
  if(StrToInt(s)>=2) then
  begin
    ShowMessage('[���������]: �� ��� ������� ��� ����� �����, �������� �� ����� ��������.');
  end;
  if(StrToInt(s)=1) then
  begin
    AssignFile(f,'files\2levelinfo.txt');
    Rewrite(f);
    s:='2';
    writeln(f,s);
    CloseFile(f);
  end;
end;

end.
