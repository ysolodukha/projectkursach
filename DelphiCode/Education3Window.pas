unit Education3Window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Samples.Gauges, Vcl.Menus,ShellAPI;

type
  TEducation3 = class(TForm)
    Image1: TImage;
    Level: TImage;
    BackButton: TImage;
    Label2: TLabel;
    FirstLevel: TImage;
    SecondLevel: TImage;
    ThirdLevel: TImage;
    FourthLevel: TImage;
    Label1: TLabel;
    Gauge1: TGauge;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BackButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BackButtonMouseEnter(Sender: TObject);
    procedure BackButtonMouseLeave(Sender: TObject);
    procedure FirstLevelMouseEnter(Sender: TObject);
    procedure FirstLevelMouseLeave(Sender: TObject);
    procedure SecondLevelMouseEnter(Sender: TObject);
    procedure SecondLevelMouseLeave(Sender: TObject);
    procedure ThirdLevelMouseEnter(Sender: TObject);
    procedure FourthLevelMouseEnter(Sender: TObject);
    procedure FourthLevelMouseLeave(Sender: TObject);
    procedure ThirdLevelMouseLeave(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FirstLevelClick(Sender: TObject);
    procedure SecondLevelClick(Sender: TObject);
    procedure ThirdLevelClick(Sender: TObject);
    procedure FourthLevelClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Education3: TEducation3;
  f:TextFile;
  s:string;

implementation

{$R *.dfm}

uses MainMenu,Part3_1Window,Part3_2Window,Part3_3Window,Part3_4Window;

procedure TEducation3.BackButtonClick(Sender: TObject);
begin
  Education3.Hide;
  Form3.Show;
end;

procedure TEducation3.BackButtonMouseEnter(Sender: TObject);
begin
  if(BackButton.Proportional=True) then BackButton.Proportional:=False;
end;

procedure TEducation3.BackButtonMouseLeave(Sender: TObject);
begin
  if(BackButton.Proportional=False) then BackButton.Proportional:=True;
end;

procedure TEducation3.FirstLevelClick(Sender: TObject);
begin
  Education3.Hide;
  Part3_1.Show;
end;

procedure TEducation3.FirstLevelMouseEnter(Sender: TObject);
begin
  if(FirstLevel.Proportional=True) then FirstLevel.Proportional:=False;
end;

procedure TEducation3.FirstLevelMouseLeave(Sender: TObject);
begin
  if(FirstLevel.Proportional=False) then FirstLevel.Proportional:=True;
end;

procedure TEducation3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TEducation3.FormPaint(Sender: TObject);
begin
  AssignFile(f,'files\3levelinfo.txt');
  Reset(f);
  while not eof(f) do begin
    Readln(f,s);
  end;
  Gauge1.Progress:=25*StrToInt(s);
  CloseFile(f);
end;

procedure TEducation3.FormShow(Sender: TObject);
begin
  Level.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\level3.png');
  Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\educationbackground.png');
  BackButton.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\backbutton.png');
  FirstLevel.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\part3_1.png');
  SecondLevel.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\part3_2.png');
  ThirdLevel.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\part3_3.png');
  FourthLevel.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\part3_4.png');
  Education3.Icon.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\icon.ico');
end;

procedure TEducation3.FourthLevelClick(Sender: TObject);
begin
  Education3.Hide;
  Part3_4.Show;
end;

procedure TEducation3.FourthLevelMouseEnter(Sender: TObject);
begin
  if(FourthLevel.Proportional=True) then FourthLevel.Proportional:=False;
end;

procedure TEducation3.FourthLevelMouseLeave(Sender: TObject);
begin
  if(FourthLevel.Proportional=False) then FourthLevel.Proportional:=True;
end;

procedure TEducation3.N1Click(Sender: TObject);
begin
  ShellExecute(0,PChar('Open'),PChar('Delphihelp.chm'),nil,nil,SW_SHOW);
end;

procedure TEducation3.SecondLevelClick(Sender: TObject);
begin
  Education3.Hide;
  Part3_2.Show;
end;

procedure TEducation3.SecondLevelMouseEnter(Sender: TObject);
begin
  if(SecondLevel.Proportional=True) then SecondLevel.Proportional:=False;
end;

procedure TEducation3.SecondLevelMouseLeave(Sender: TObject);
begin
  if(SecondLevel.Proportional=False) then SecondLevel.Proportional:=True;
end;

procedure TEducation3.ThirdLevelClick(Sender: TObject);
begin
  Education3.Hide;
  Part3_3.Show;
end;

procedure TEducation3.ThirdLevelMouseEnter(Sender: TObject);
begin
  if(ThirdLevel.Proportional=True) then ThirdLevel.Proportional:=False;
end;

procedure TEducation3.ThirdLevelMouseLeave(Sender: TObject);
begin
  if(ThirdLevel.Proportional=False) then ThirdLevel.Proportional:=True;
end;

end.
