program Project2;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  decorator in 'decorator.pas';

var
  func: IDec;

begin
  try
    { TODO -oUser -cConsole メイン : ここにコードを記述してください }
    func := TDecClass.Create(TMyClass.Create);
    Writeln(func.print);
    Readln;
    func := nil;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
