unit node;

interface

uses
  SysUtils;

type
  INode = interface
    function GetLeft: INode;
    function GetRight: INode;
    function GetKey: integer;
    procedure SetLeft(const Value: INode);
    procedure SetRight(const Value: INode);
    procedure SetKey(const Value: integer);
    property Left: INode read GetLeft write SetLeft;
    property Right: INode read GetRight write SetRight;
    property Key: integer read GetKey write SetKey;
  end;

  TMyNode = class(TInterfacedObject, INode)
  private
    FLeft, FRight: INode;
    FKey: integer;
    function GetLeft: INode;
    function GetRight: INode;
    procedure SetLeft(const Value: INode);
    procedure SetRight(const Value: INode);
    procedure SetKey(const Value: integer);
    function GetKey: integer;
  public
    constructor Create(k: integer);
    property Key: integer read GetKey write SetKey;
  end;

function extractMaxNode(p: INode): INode;
procedure print(p: INode);
procedure addNode(k: integer; p: INode);
function search(k: integer; p: INode): INode;
function removeNode(k: integer; p: INode): INode;
function createNode(args: array of integer): INode;

var
  extractedNode: INode;

implementation

{ TTreeNode }

procedure addNode(k: integer; p: INode);
var
  iobj: INode;
begin
  if p = nil then
    extractedNode := TMyNode.Create(k);
  if k < p.Key then
  begin
    iobj := p;
    if iobj.Left = nil then
      iobj.Left := TMyNode.Create(k)
    else
    begin
      extractedNode := iobj.Left;
      addNode(k, extractedNode);
    end;
  end
  else if p.Key < k then
  begin
    iobj := p;
    if iobj.Right = nil then
      iobj.Right := TMyNode.Create(k)
    else
    begin
      extractedNode := iobj.Right;
      addNode(k, extractedNode);
    end;
  end;
end;

function createNode(args: array of integer): INode;
var
  i: integer;
  s: INode;
begin
  result := TMyNode.Create(args[0]);
  s := result;
  for i in args do
    addNode(i, s);
end;

function extractMaxNode(p: INode): INode;
begin
  if (p.Left = nil) and (p.Right = nil) then
    result := p
  else if p.Right = nil then
  begin
    extractedNode := p;
    result := extractMaxNode(p.Left);
  end
  else
  begin
    extractedNode := p;
    result := extractMaxNode(p.Right);
  end;
end;

procedure print(p: INode);
begin
  if p <> nil then
  begin
    Write(p.Key, ' ');
    print(p.Left);
    print(p.Right);
  end;
end;

function removeNode(k: integer; p: INode): INode;
var
  r: INode;
begin
  if p <> nil then
  begin
    if k < p.Key then
    begin
      extractedNode := p;
      result := removeNode(k, p.Left);
    end
    else if p.Key < k then
    begin
      extractedNode := p;
      result := removeNode(k, p.Right);
    end
    else
    begin
      if (p.Left = nil) and (p.Right = nil) then
      begin
        r := extractedNode;
        if r.Left = p then
          r.Left := nil
        else
          r.Right := nil;
        extractedNode := nil;
        result := nil;
        Exit;
      end
      else if p.Left = nil then
        r := p.Right
      else if p.Right = nil then
        r := p.Left
      else
      begin
        extractedNode := p.Left;
        r := extractMaxNode(p.Left);
        p.Key := r.Key;
        if p.Left = r then
          p.Left := nil
        else
        begin
          if extractedNode.Right = nil then
            extractedNode.Left := nil;
          extractedNode.Right := nil;
        end;
        result := p;
        Exit;
      end;
      p.Key := r.Key;
      p.Left := r.Left;
      p.Right := r.Right;
      result := p;
      Exit;
    end;
  end
  else
    result := nil;
end;

function search(k: integer; p: INode): INode;
begin
  if p <> nil then
  begin
    if k < p.Key then
      p := search(k, p.Left)
    else if p.Key < k then
      p := search(k, p.Right);
  end;
  result := p;
end;

{ TMyNode }

constructor TMyNode.Create(k: integer);
begin
  inherited Create;
  Key := k;
end;

function TMyNode.GetKey: integer;
begin
  result := FKey;
end;

function TMyNode.GetLeft: INode;
begin
  result := FLeft;
end;

function TMyNode.GetRight: INode;
begin
  result := FRight;
end;

procedure TMyNode.SetKey(const Value: integer);
begin
  FKey := Value;
end;

procedure TMyNode.SetLeft(const Value: INode);
begin
  FLeft := Value;
end;

procedure TMyNode.SetRight(const Value: INode);
begin
  FRight := Value;
end;

end.
