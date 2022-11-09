unit TestWindow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TTest = class(TForm)
    Image1: TImage;
    BackButton: TImage;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    NextButton: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NextButtonClick(Sender: TObject);
    procedure NextButtonMouseEnter(Sender: TObject);
    procedure NextButtonMouseLeave(Sender: TObject);
    procedure BackButtonMouseEnter(Sender: TObject);
    procedure BackButtonMouseLeave(Sender: TObject);
    procedure BackButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Test: TTest;

implementation

{$R *.dfm}

uses StartTestWindow;

procedure TTest.BackButtonClick(Sender: TObject);
begin
  RadioGroup1.Caption:='';
  RadioGroup1.Items.Clear;
  Test.Hide;
  StartTest.Show;
end;

procedure TTest.BackButtonMouseEnter(Sender: TObject);
begin
  if(BackButton.Proportional=True) then BackButton.Proportional:=False;
end;

procedure TTest.BackButtonMouseLeave(Sender: TObject);
begin
  if(BackButton.Proportional=False) then BackButton.Proportional:=True;
end;

procedure TTest.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TTest.FormShow(Sender: TObject);
begin
  Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\testbackground.png');
  BackButton.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\testbackbutton.png');
  NextButton.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\NextButton.png');
  Test.Icon.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\icon.ico');
end;

procedure TTest.NextButtonClick(Sender: TObject);
begin
  if (RadioGroup1.ItemIndex>-1) and (not Eof(f)) then
  begin
    if RadioGroup1.ItemIndex = numoftrue-1 then
      begin
      Label1.Caption := '���������!';
      ball:=ball+1; //���� ��������� ������� ������������� ������ ������� ������, �� ���� ������������ � ��������� ���� ��� ���������� �������
      end
    else
       Label1.Caption := '�� ���������!';
  RadioGroup1.Items.Clear;
  Repeat
    if (s[1]='-') then
    begin
      delete(s,1,1);
      RadioGroup1.Caption:=s;
    end
    else
    if s[1]='*' then
    begin
      delete(s,1,1);
      numoftrue:=StrToInt(s);
    end
    else
    RadioGroup1.Items.Add(s);
    readln(f,s);
  until (s[1]='-') or (Eof(f));
  end
//���� ����� ����� ���������, ������ ������� �����������
  Else if Eof(f) then
  begin
    delete(s,1,1);
    numoftrue:=StrToInt(s);
    if RadioGroup1.ItemIndex = numoftrue-1 then
      ball:=ball+1;
    CloseFile(f);
    Application.Title := '���������';
    if MessageDlg('���� ���������� ������: ' + IntToStr(ball), mtCustom, [mbOK], 0) = mrOK then
    begin
      RadioGroup1.Caption:='';
      RadioGroup1.Items.Clear;
      StartTest.Show;
      Test.Hide;
    end;
  end;
end;

procedure TTest.NextButtonMouseEnter(Sender: TObject);
begin
  if(NextButton.Proportional=True) then NextButton.Proportional:=False;
end;

procedure TTest.NextButtonMouseLeave(Sender: TObject);
begin
  if(NextButton.Proportional=False) then NextButton.Proportional:=True;
end;

end.
