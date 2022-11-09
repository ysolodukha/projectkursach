unit Part3_1Window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.OleCtrls, SHDocVw,
  Vcl.Imaging.pngimage;

type
  TPart3_1 = class(TForm)
    WebBrowser1: TWebBrowser;
    Image1: TImage;
    Image3: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Part3_1: TPart3_1;

implementation

{$R *.dfm}

uses Education3Window;

procedure TPart3_1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TPart3_1.FormShow(Sender: TObject);
begin
  WebBrowser1.Navigate(ExtractFilePath(Application.ExeName)+'files\part3_1.html');
  Image3.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\acceptbutton.png');
  Part3_1.Icon.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\icon.ico');
end;

procedure TPart3_1.Image3Click(Sender: TObject);
begin
  Education3.Show;
  Part3_1.Hide;
  if(StrToInt(s)>=1) then
  begin
    ShowMessage('[Подсказка]: Вы уже изучили эту главу ранее, прогресс не будет увеличен.');
  end;
  if(StrToInt(s)=0) then
  begin
    AssignFile(f,'files\3levelinfo.txt');
    Rewrite(f);
    s:='1';
    writeln(f,s);
    CloseFile(f);
  end;
end;

end.
