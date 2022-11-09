unit Part3_2Window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TPart3_2 = class(TForm)
    WebBrowser1: TWebBrowser;
    Image1: TImage;
    Part1_2Accept: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Part1_2AcceptClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Part3_2: TPart3_2;

implementation

{$R *.dfm}

uses Education3Window;

procedure TPart3_2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TPart3_2.FormShow(Sender: TObject);
begin
  WebBrowser1.Navigate(ExtractFilePath(Application.ExeName)+'files\part3_2.html');
  Part1_2Accept.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\acceptbutton.png');
  Part3_2.Icon.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\icon.ico');
end;

procedure TPart3_2.Part1_2AcceptClick(Sender: TObject);
begin
  Education3.Show;
  Part3_2.Hide;
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
    AssignFile(f,'files\3levelinfo.txt');
    Rewrite(f);
    s:='2';
    writeln(f,s);
    CloseFile(f);
  end;
end;

end.
