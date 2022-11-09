unit Part1_3Window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.OleCtrls, SHDocVw,
  Vcl.Imaging.pngimage;

type
  TPart1_3 = class(TForm)
    WebBrowser1: TWebBrowser;
    Image1: TImage;
    Image2: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Part1_3: TPart1_3;

implementation

{$R *.dfm}

uses EducationWindow;

procedure TPart1_3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TPart1_3.FormShow(Sender: TObject);
begin
  WebBrowser1.Navigate(ExtractFilePath(Application.ExeName)+'files\part1_3.html');
  Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\acceptbutton.png');
  Part1_3.Icon.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\icon.ico');
end;

procedure TPart1_3.Image2Click(Sender: TObject);
begin
  Education.Show;
  Part1_3.Hide;
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
    AssignFile(f,'files\1levelinfo.txt');
    Rewrite(f);
    s:='3';
    writeln(f,s);
    CloseFile(f);
  end;
end;

end.
