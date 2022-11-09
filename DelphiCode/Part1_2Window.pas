unit Part1_2Window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.OleCtrls, SHDocVw,
  Vcl.Imaging.pngimage;

type
  TPart1_2 = class(TForm)
    WebBrowser1: TWebBrowser;
    Image1: TImage;
    Part1_2Accept: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Part1_2AcceptClick(Sender: TObject);
    procedure Part1_2AcceptMouseEnter(Sender: TObject);
    procedure Part1_2AcceptMouseLeave(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Part1_2: TPart1_2;

implementation

{$R *.dfm}

uses EducationWindow;

procedure TPart1_2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Application.Terminate;
end;

procedure TPart1_2.FormShow(Sender: TObject);
begin
  WebBrowser1.Navigate(ExtractFilePath(Application.ExeName)+'files\part1_2.html');
  Part1_2Accept.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\acceptbutton.png');
  Part1_2.Icon.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\icon.ico');
end;

procedure TPart1_2.Part1_2AcceptClick(Sender: TObject);
begin
  Education.Show;
  Part1_2.Hide;
  if(StrToInt(s)=0) then
  begin
    ShowMessage('[ѕодсказка]: „тобы увеличить прогресс изучени€, нужно изучать материал последовательно.');
  end;
  if(StrToInt(s)>=2) then
  begin
    ShowMessage('[ѕодсказка]: ¬ы уже изучили эту главу ранее, прогресс не будет увеличен.');
  end;
  if(StrToInt(s)=1) then
  begin
    AssignFile(f,'files\1levelinfo.txt');
    Rewrite(f);
    s:='2';
    writeln(f,s);
    CloseFile(f);
  end;
end;

procedure TPart1_2.Part1_2AcceptMouseEnter(Sender: TObject);
begin
  if(Part1_2Accept.Proportional=True) then Part1_2Accept.Proportional:=False;
end;

procedure TPart1_2.Part1_2AcceptMouseLeave(Sender: TObject);
begin
  if(Part1_2Accept.Proportional=False) then Part1_2Accept.Proportional:=True;
end;

end.
