library randArray;

{ DLL のメモリ管理に関する重要なメモ: パラメータまたは関数結果として文字列を渡す
  手続きまたは関数を DLL がエクスポートする場合は、ShareMem をライブラリの
  uses 句およびプロジェクトの uses 句 ([プロジェクト｜ソースの表示] を選択) の
  最初に記載する必要があります。これは、
  DLL との間で渡されるすべての文字列に当てはまります。レコードやクラスに
  ネストされているものも同様です。ShareMem は共有メモリ マネージャ BORLNDMM.DLL に対するインターフェイス
  ユニットです。この DLL は作成対象の DLL と一緒に配置する必要が
  あります。BORLNDMM.DLL を使用しないようにするには、PChar 型または ShortString 型の
  パラメータを使って文字列情報を渡します。 }

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections;

{$R *.res}

function randomArray(low, high, count: integer): TArray<integer>;
var
  list: TList<integer>;
  i: integer;
begin
  list := TList<integer>.Create;
  try
    for i := low to high do
      list.Add(i);
    result := [];
    Randomize;
    while (count > 0) and (list.count > 0) do
    begin
      i := Random(list.count);
      result := result + [list[i]];
      list.Delete(i);
      dec(count);
    end;
  finally
    list.Free;
  end;
end;

exports randomArray;

begin

end.
