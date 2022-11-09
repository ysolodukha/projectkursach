unit Part2_4Window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.OleCtrls, SHDocVw,
  Vcl.Imaging.pngimage;

type
  TPart2_4 = class(TForm)
    WebBrowser1: TWebBrowser;
    Image1: TImage;
    ConfirmButton: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ConfirmButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Part2_4: TPart2_4;

implementation

{$R *.dfm}

Uses Education2Window;

procedure TPart2_4.ConfirmButtonClick(Sender: TObject);
begin
  Education2.Show;
  Part2_4.Hide;
  if(StrToInt(s)>=0) and (StrToInt(s)<=2) then
  begin
    ShowMessage('[ѕодсказка]: „тобы увеличить прогресс изучени€, нужно изучать материал последовательно.');
  end;
  if(StrToInt(s)=4) then
  begin
    ShowMessage('[ѕодсказка]: ¬ы уже изучили эту главу ранее, прогресс не будет увеличен.');
  end;
  if(StrToInt(s)=3) then
  begin
    AssignFile(f,'files\2levelinfo.txt');
    Rewrite(f);
    s:='4';
    writeln(f,s);
    CloseFile(f);
  end;
end;

procedure TPart2_4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TPart2_4.FormShow(Sender: TObject);
begin
  WebBrowser1.Navigate(ExtractFilePath(Application.ExeName)+'files\part2_4.html');
  ConfirmButton.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\acceptbutton.png');
  Part2_4.Icon.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\icon.ico');
end;

end.
