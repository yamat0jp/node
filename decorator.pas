unit decorator;

interface

type
  IDec = Interface
    function print: string;
  end;

  TMyClass = class(TInterfacedObject, IDec)
  public
    function print: string;
  end;

  TDecClass = class(TInterfacedObject, IDec)
  protected
    iobj: IDec;
    function print: string;
  public
    constructor Create(obj: IDec);
  end;

implementation

{ TMyClass }

function TMyClass.print: string;
begin
  result:='test';
end;

{ TDecClass }

constructor TDecClass.Create(obj: IDec);
begin
  iobj:=obj;
end;

function TDecClass.print: string;
begin
  result:='<html><body>'+iobj.print+'</body></html>';
end;

end.
