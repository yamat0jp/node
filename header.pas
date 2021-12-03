unit header;

interface

function randomArray(x,y,count:integer): TArray<integer>;

implementation

function randomArray; external 'randArray';

end.
