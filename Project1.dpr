program Project1;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  node in 'node.pas',
  header in 'header.pas';

var
  i: integer;
  a: TArray<integer>;
  s, t: INode;

begin
  try
    { TODO -oUser -cConsole メイン : ここにコードを記述してください }
    a := randomArray(1,100,10);
    for i in a do
    begin
      s := createNode(a);
      print(s);
      Writeln;
      t := removeNode(i, s);
      if t = nil then
        Writeln('Only deleted ', i)
      else
        Writeln('Changed ', i, ' to ', t.key);
      print(s);
      Writeln;
      Writeln;
    end;
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
