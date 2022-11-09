unit StartTestWindow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,ShellAPI,
  Vcl.StdCtrls, Vcl.Menus;

type
  TStartTest = class(TForm)
    backgroundtest: TImage;
    BackButton: TImage;
    SecondLevel: TImage;
    ThirdLevel: TImage;
    Label1: TLabel;
    FirstLevel: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BackButtonClick(Sender: TObject);
    procedure FirstLevelClick(Sender: TObject);
    procedure BackButtonMouseEnter(Sender: TObject);
    procedure BackButtonMouseLeave(Sender: TObject);
    procedure SecondLevelClick(Sender: TObject);
    procedure ThirdLevelClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StartTest: TStartTest;
  f:text;
  s:string;
  numoftrue,ball:integer;

implementation

{$R *.dfm}

uses MainMenu,TestWindow;

procedure TStartTest.BackButtonMouseEnter(Sender: TObject);
begin
  if(BackButton.Proportional=True) then BackButton.Proportional:=False;
end;

procedure TStartTest.BackButtonMouseLeave(Sender: TObject);
begin
  if(BackButton.Proportional=False) then BackButton.Proportional:=True;
end;

procedure TStartTest.FirstLevelClick(Sender: TObject);
begin
  AssignFile(f ,ExtractFilePath(Application.ExeName)+'files\test.txt');
  reset(f); //��������� ���� ��� ������
  readln(f,s); //��������� ������ ������ �� �����
  ball:=0;
  repeat
    if (s[1]='-') then
    begin //���� ������ ������ ������ �-� ������ ��� ������
      delete(s,1,1);
      Test.RadioGroup1.Caption:=s;
    end
    else
    if s[1]='*' then
    begin //���� ���� ������ �*� ������ ��� ����� ������� ������
      delete(s,1,1);
      numoftrue:=StrToInt(s);
    end
    else
      Test.RadioGroup1.Items.Add(s); //����� ��� ������� ������
      readln(f,s); //��������� ��������� ������ �� �����
    until (s[1]='-') or (Eof(f));
    StartTest.Hide;
    Test.Show;
end;

procedure TStartTest.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TStartTest.FormShow(Sender: TObject);
begin
  backgroundtest.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\testbackground.png');
  BackButton.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\testbackbutton.png');
  FirstLevel.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\level.png');
  SecondLevel.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\level2.png');
  ThirdLevel.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\level3.png');
  StartTest.Icon.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\icon.ico');
end;

procedure TStartTest.N1Click(Sender: TObject);
begin
  ShellExecute(0,PChar('Open'),PChar('Delphihelp.chm'),nil,nil,SW_SHOW);
end;

procedure TStartTest.SecondLevelClick(Sender: TObject);
begin
  AssignFile(f ,ExtractFilePath(Application.ExeName)+'files\test1.txt');
  reset(f); //��������� ���� ��� ������
  readln(f,s); //��������� ������ ������ �� �����
  ball:=0;
  repeat
    if (s[1]='-') then
    begin //���� ������ ������ ������ �-� ������ ��� ������
      delete(s,1,1);
      Test.RadioGroup1.Caption:=s;
    end
    else
    if s[1]='*' then
    begin //���� ���� ������ �*� ������ ��� ����� ������� ������
      delete(s,1,1);
      numoftrue:=StrToInt(s);
    end
    else
      Test.RadioGroup1.Items.Add(s); //����� ��� ������� ������
      readln(f,s); //��������� ��������� ������ �� �����
    until (s[1]='-') or (Eof(f));
    StartTest.Hide;
    Test.Show;
end;

procedure TStartTest.ThirdLevelClick(Sender: TObject);
begin
  AssignFile(f ,ExtractFilePath(Application.ExeName)+'files\test2.txt');
  reset(f); //��������� ���� ��� ������
  readln(f,s); //��������� ������ ������ �� �����
  ball:=0;
  repeat
    if (s[1]='-') then
    begin //���� ������ ������ ������ �-� ������ ��� ������
      delete(s,1,1);
      Test.RadioGroup1.Caption:=s;
    end
    else
    if s[1]='*' then
    begin //���� ���� ������ �*� ������ ��� ����� ������� ������
      delete(s,1,1);
      numoftrue:=StrToInt(s);
    end
    else
      Test.RadioGroup1.Items.Add(s); //����� ��� ������� ������
      readln(f,s); //��������� ��������� ������ �� �����
    until (s[1]='-') or (Eof(f));
    StartTest.Hide;
    Test.Show;
end;

procedure TStartTest.BackButtonClick(Sender: TObject);
begin
  StartTest.Hide;
  Form3.Show;
end;

end.
