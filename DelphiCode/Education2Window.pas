unit Education2Window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Samples.Gauges, Vcl.Menus,ShellAPI;

type
  TEducation2 = class(TForm)
    Image1: TImage;
    Label2: TLabel;
    FirstLevel: TImage;
    SecondLevel: TImage;
    ThirdLevel: TImage;
    FourthLevel: TImage;
    Label1: TLabel;
    Gauge1: TGauge;
    Image2: TImage;
    BackButton: TImage;
    Level: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BackButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BackButtonMouseEnter(Sender: TObject);
    procedure BackButtonMouseLeave(Sender: TObject);
    procedure FirstLevelMouseEnter(Sender: TObject);
    procedure FirstLevelMouseLeave(Sender: TObject);
    procedure SecondLevelMouseEnter(Sender: TObject);
    procedure ThirdLevelMouseEnter(Sender: TObject);
    procedure FourthLevelMouseEnter(Sender: TObject);
    procedure FourthLevelMouseLeave(Sender: TObject);
    procedure ThirdLevelMouseLeave(Sender: TObject);
    procedure SecondLevelMouseLeave(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image2MouseLeave(Sender: TObject);
    procedure FirstLevelClick(Sender: TObject);
    procedure SecondLevelClick(Sender: TObject);
    procedure ThirdLevelClick(Sender: TObject);
    procedure FourthLevelClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Education2: TEducation2;
  f:TextFile;
  s:string;

implementation

{$R *.dfm}

Uses EducationWindow,Part2_1Window,Part2_2Window,Part2_3Window,Part2_4Window,Education3Window;

procedure TEducation2.BackButtonClick(Sender: TObject);
begin
  Education2.Hide;
  Education.Show;
end;

procedure TEducation2.BackButtonMouseEnter(Sender: TObject);
begin
  if(BackButton.Proportional=True) then BackButton.Proportional:=False;
end;

procedure TEducation2.BackButtonMouseLeave(Sender: TObject);
begin
  if(BackButton.Proportional=False) then BackButton.Proportional:=True;
end;

procedure TEducation2.FirstLevelClick(Sender: TObject);
begin
  Education2.Hide;
  Part2_1.Show;
end;

procedure TEducation2.FirstLevelMouseEnter(Sender: TObject);
begin
  if(FirstLevel.Proportional=True) then FirstLevel.Proportional:=False;
end;

procedure TEducation2.FirstLevelMouseLeave(Sender: TObject);
begin
  if(FirstLevel.Proportional=False) then FirstLevel.Proportional:=True;
end;

procedure TEducation2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TEducation2.FormPaint(Sender: TObject);
begin
  AssignFile(f,'files\2levelinfo.txt');
  Reset(f);
  while not eof(f) do begin
    Readln(f,s);
  end;
  Gauge1.Progress:=25*StrToInt(s);
  CloseFile(f);
  if(Gauge1.Progress=100) then Image2.Visible:=True;
end;

procedure TEducation2.FormShow(Sender: TObject);
begin
  Level.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\level2.png');
  Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\educationbackground.png');
  Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\NextButton.png');
  BackButton.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\backbutton.png');
  FirstLevel.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\part2_1.png');
  SecondLevel.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\part2_2.png');
  ThirdLevel.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\part2_3.png');
  FourthLevel.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\part2_4.png');
  Education.Icon.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\icon.ico');
end;

procedure TEducation2.FourthLevelClick(Sender: TObject);
begin
  Part2_4.Show;
  Education2.Hide;
end;

procedure TEducation2.FourthLevelMouseEnter(Sender: TObject);
begin
  if(FourthLevel.Proportional=True) then FourthLevel.Proportional:=False;
end;

procedure TEducation2.FourthLevelMouseLeave(Sender: TObject);
begin
  if(FourthLevel.Proportional=False) then FourthLevel.Proportional:=True;
end;

procedure TEducation2.Image2Click(Sender: TObject);
begin
  Education2.Hide;
  Education3.Show;
end;

procedure TEducation2.Image2MouseEnter(Sender: TObject);
begin
  if(Image2.Proportional=True) then Image2.Proportional:=False;
end;

procedure TEducation2.Image2MouseLeave(Sender: TObject);
begin
  if(Image2.Proportional=False) then Image2.Proportional:=True;
end;

procedure TEducation2.N1Click(Sender: TObject);
begin
  ShellExecute(0,PChar('Open'),PChar('Delphihelp.chm'),nil,nil,SW_SHOW);
end;

procedure TEducation2.SecondLevelClick(Sender: TObject);
begin
  Education2.Hide;
  Part2_2.Show;
end;

procedure TEducation2.SecondLevelMouseEnter(Sender: TObject);
begin
  if(SecondLevel.Proportional=True) then SecondLevel.Proportional:=False;
end;

procedure TEducation2.SecondLevelMouseLeave(Sender: TObject);
begin
  if(SecondLevel.Proportional=False) then SecondLevel.Proportional:=True;
end;

procedure TEducation2.ThirdLevelClick(Sender: TObject);
begin
  Education2.Hide;
  Part2_3.Show;
end;

procedure TEducation2.ThirdLevelMouseEnter(Sender: TObject);
begin
  if(ThirdLevel.Proportional=True) then ThirdLevel.Proportional:=False;
end;

procedure TEducation2.ThirdLevelMouseLeave(Sender: TObject);
begin
  if(ThirdLevel.Proportional=False) then ThirdLevel.Proportional:=True;
end;

end.
