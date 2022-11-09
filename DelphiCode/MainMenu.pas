unit MainMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Menus, ShellAPI;

type
  TForm3 = class(TForm)
    Image1: TImage;
    Image3: TImage;
    Image2: TImage;
    Image5: TImage;
    Timer1: TTimer;
    Label1: TLabel;
    Timer2: TTimer;
    Image4: TImage;
    RefreshButton: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    procedure Image5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image2MouseLeave(Sender: TObject);
    procedure Image3MouseEnter(Sender: TObject);
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image5MouseEnter(Sender: TObject);
    procedure Image5MouseLeave(Sender: TObject);
    procedure FormShowTimer(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Label1ClickTimer(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure RefreshButtonMouseEnter(Sender: TObject);
    procedure RefreshButtonMouseLeave(Sender: TObject);
    procedure N1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  f:text;
  s:string;

implementation


{$R *.dfm}

uses EducationWindow,StartTestWindow;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\secondmainbackground.jpg');
  Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\Start.png');
  Image3.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\Test.png');
  Image5.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\exit.png');
  Image4.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\python.png');
  Form3.Icon.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\icon.ico');
end;

procedure TForm3.FormShowTimer(Sender: TObject);
begin
  if(Image4.Left>=-220) and (Image4.Left<=820) then Image4.Left:=Image4.Left+5
  else Image4.Left:=-220;
end;

procedure TForm3.Image2Click(Sender: TObject);
begin
  Education.Show;
  Form3.Hide;
end;

procedure TForm3.Image2MouseEnter(Sender: TObject);
begin
  if(Image2.Proportional=True) then Image2.Proportional:=False;
end;

procedure TForm3.Image2MouseLeave(Sender: TObject);
begin
  if(Image2.Proportional=False) then Image2.Proportional:=True;
end;

procedure TForm3.Image3Click(Sender: TObject);
begin
  Form3.Hide;
  StartTest.Show;
end;

procedure TForm3.Image3MouseEnter(Sender: TObject);
begin
  if(Image3.Proportional=True) then Image3.Proportional:=False;
end;

procedure TForm3.Image3MouseLeave(Sender: TObject);
begin
  if(Image3.Proportional=False) then Image3.Proportional:=True;
end;

procedure TForm3.Image4Click(Sender: TObject);
begin
  if(Timer1.Enabled=True) then Timer1.Enabled:=False
  else Timer1.Enabled:=True;
end;

procedure TForm3.Image5Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm3.Image5MouseEnter(Sender: TObject);
begin
  if(Image5.Proportional=True) then Image5.Proportional:=False;
end;

procedure TForm3.Image5MouseLeave(Sender: TObject);
begin
  if(Image5.Proportional=False) then Image5.Proportional:=True;
end;

procedure TForm3.RefreshButtonClick(Sender: TObject);
begin
  if MessageDlg('�� ������ �������� �������� ��������?', mtCustom, [mbYes,mbCancel], 0) = mrYes then
  begin
    AssignFile(f,'files\1levelinfo.txt');
    Rewrite(f);
    s:='0';
    writeln(f,s);
    CloseFile(f);
    AssignFile(f,'files\2levelinfo.txt');
    Rewrite(f);
    writeln(f,s);
    CloseFile(f);
    AssignFile(f,'files\3levelinfo.txt');
    Rewrite(f);
    writeln(f,s);
    CloseFile(f);
  end;
end;

procedure TForm3.RefreshButtonMouseEnter(Sender: TObject);
begin
  if(RefreshButton.Proportional=True) then RefreshButton.Proportional:=False;
end;

procedure TForm3.RefreshButtonMouseLeave(Sender: TObject);
begin
  if(RefreshButton.Proportional=False) then RefreshButton.Proportional:=True;
end;

procedure TForm3.Label1ClickTimer(Sender: TObject);
begin
  if(Label1.Visible=True) then Label1.Visible:=False
  else Label1.Visible:=True;
end;

procedure TForm3.N1Click(Sender: TObject);
begin
  ShellExecute(0,PChar('Open'),PChar('Delphihelp.chm'),nil,nil,SW_SHOW);
end;

end.
