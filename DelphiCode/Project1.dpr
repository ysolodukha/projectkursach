program Project1;

uses
  Vcl.Forms,
  Unit1 in 'LoadWindow.pas' {Form1},
  Unit3 in 'MainMenu.pas' {Form3},
  Unit2 in 'EducationWindow.pas' {Education},
  Unit4 in 'Part1_1Window.pas' {Part1_1},
  Unit5 in 'Part1_2Window.pas' {Part1_2},
  Unit6 in 'Part1_3Window.pas' {Part1_3},
  Unit7 in 'Part1_4Window.pas' {Part1_4},
  Unit8 in 'Education2Window.pas' {Education2},
  Unit9 in 'Part2_1Window.pas' {Part2_1},
  Unit10 in 'Part2_2Window.pas' {Part2_2},
  Unit11 in 'Part2_3Window.pas' {Part2_3},
  Unit12 in 'Part2_4Window.pas' {Part2_4},
  Unit13 in 'Education3Window.pas' {Education3},
  Unit14 in 'Part3_1Window.pas' {Part3_1},
  Unit15 in 'Part3_2Window.pas' {Part3_2},
  Unit16 in 'Part3_3Window.pas' {Part3_3},
  Unit17 in 'Part3_4Window.pas' {Part3_4},
  Unit18 in 'StartTestWindow.pas' {StartTest},
  Unit19 in 'TestWindow.pas' {Test};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TEducation, Education);
  Application.CreateForm(TPart1_1, Part1_1);
  Application.CreateForm(TPart1_2, Part1_2);
  Application.CreateForm(TPart1_3, Part1_3);
  Application.CreateForm(TPart1_4, Part1_4);
  Application.CreateForm(TEducation2, Education2);
  Application.CreateForm(TPart2_1, Part2_1);
  Application.CreateForm(TPart2_2, Part2_2);
  Application.CreateForm(TPart2_3, Part2_3);
  Application.CreateForm(TPart2_4, Part2_4);
  Application.CreateForm(TEducation3, Education3);
  Application.CreateForm(TPart3_1, Part3_1);
  Application.CreateForm(TPart3_2, Part3_2);
  Application.CreateForm(TPart3_3, Part3_3);
  Application.CreateForm(TPart3_4, Part3_4);
  Application.CreateForm(TStartTest, StartTest);
  Application.CreateForm(TTest, Test);
  Application.Run;
end.
