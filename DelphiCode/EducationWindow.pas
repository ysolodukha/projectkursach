unit EducationWindow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Samples.Gauges, Vcl.ComCtrls, Vcl.OleCtrls, SHDocVw,
  Vcl.Menus,ShellAPI;

type
  TEducation = class(TForm)
    Image1: TImage;
    BackButton: TImage;
    Label1: TLabel;
    Label2: TLabel;
    FirstLevel: TImage;
    SecondLevel: TImage;
    ThirdLevel: TImage;
    FourthLevel: TImage;
    Level: TImage;
    Gauge1: TGauge;
    Image2: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BackButtonClick(Sender: TObject);
    procedure BackButtonMouseEnter(Sender: TObject);
    procedure BackButtonMouseLeave(Sender: TObject);
    procedure FirstLevelMouseEnter(Sender: TObject);
    procedure FirstLevelMouseLeave(Sender: TObject);
    procedure SecondLevelMouseEnter(Sender: TObject);
    procedure SecondLevelMouseLeave(Sender: TObject);
    procedure ThirdLevelMouseEnter(Sender: TObject);
    procedure ThirdLevelMouseLeave(Sender: TObject);
    procedure FourthLevelMouseEnter(Sender: TObject);
    procedure FourthLevelMouseLeave(Sender: TObject);
    procedure FirstLevelClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SecondLevelClick(Sender: TObject);
    procedure ThirdLevelClick(Sender: TObject);
    procedure FourthLevelClick(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image2MouseLeave(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Education: TEducation;
  f:TextFile;
  s:string;

implementation

{$R *.dfm}

uses MainMenu,Part1_1Window,Part1_2Window,Part1_3Window,Part1_4Window,Education2Window;

procedure TEducation.FormPaint(Sender: TObject);
begin
  AssignFile(f,'files\1levelinfo.txt');
  Reset(f);
  while not eof(f) do begin
    Readln(f,s);
  end;
  Gauge1.Progress:=25*StrToInt(s);
  CloseFile(f);
  if(Gauge1.Progress=100) then Image2.Visible:=True;
end;

procedure TEducation.FormShow(Sender: TObject);
begin
  Level.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\level.png');
  Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\educationbackground.png');
  Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\NextButton.png');
  BackButton.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\backbutton.png');
  FirstLevel.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\part1_1.png');
  SecondLevel.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\part1_2.png');
  ThirdLevel.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\part1_3.png');
  FourthLevel.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\part1_4.png');
  Education.Icon.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\icon.ico');
end;

procedure TEducation.BackButtonMouseEnter(Sender: TObject);
begin
  if(BackButton.Proportional=True) then BackButton.Proportional:=False;
end;

procedure TEducation.BackButtonMouseLeave(Sender: TObject);
begin
  if(BackButton.Proportional=False) then BackButton.Proportional:=True;
end;

procedure TEducation.FirstLevelClick(Sender: TObject);
begin
  Part1_1.Show;
  Education.Hide;
end;

procedure TEducation.FirstLevelMouseEnter(Sender: TObject);
begin
  if(FirstLevel.Proportional=True) then FirstLevel.Proportional:=False;
end;

procedure TEducation.FirstLevelMouseLeave(Sender: TObject);
begin
  if(FirstLevel.Proportional=False) then FirstLevel.Proportional:=True;
end;

procedure TEducation.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;


procedure TEducation.FourthLevelClick(Sender: TObject);
begin
  Part1_4.Show;
  Education.Hide;
end;

procedure TEducation.FourthLevelMouseEnter(Sender: TObject);
begin
  if(FourthLevel.Proportional=True) then FourthLevel.Proportional:=False;
end;

procedure TEducation.FourthLevelMouseLeave(Sender: TObject);
begin
  if(FourthLevel.Proportional=False) then FourthLevel.Proportional:=True;
end;

procedure TEducation.Image2Click(Sender: TObject);
begin
  Education.Hide;
  Education2.Show;
end;

procedure TEducation.Image2MouseEnter(Sender: TObject);
begin
  if(Image2.Proportional=True) then Image2.Proportional:=False;
end;

procedure TEducation.Image2MouseLeave(Sender: TObject);
begin
  if(Image2.Proportional=False) then Image2.Proportional:=True;
end;

procedure TEducation.N1Click(Sender: TObject);
begin
  ShellExecute(0,PChar('Open'),PChar('Delphihelp.chm'),nil,nil,SW_SHOW);
end;

procedure TEducation.SecondLevelClick(Sender: TObject);
begin
  Part1_2.Show;
  Education.Hide;
end;

procedure TEducation.SecondLevelMouseEnter(Sender: TObject);
begin
  if(SecondLevel.Proportional=True) then SecondLevel.Proportional:=False;
end;

procedure TEducation.SecondLevelMouseLeave(Sender: TObject);
begin
  if(SecondLevel.Proportional=False) then SecondLevel.Proportional:=True;
end;

procedure TEducation.ThirdLevelClick(Sender: TObject);
begin
  Part1_3.Show;
  Education.Hide;
end;

procedure TEducation.ThirdLevelMouseEnter(Sender: TObject);
begin
  if(ThirdLevel.Proportional=True) then ThirdLevel.Proportional:=False;
end;

procedure TEducation.ThirdLevelMouseLeave(Sender: TObject);
begin
  if(ThirdLevel.Proportional=False) then ThirdLevel.Proportional:=True;
end;

procedure TEducation.BackButtonClick(Sender: TObject);
begin
  Education.Hide;
  Form3.Show;
end;

end.
