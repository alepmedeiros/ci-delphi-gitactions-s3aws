unit Calculadora;

interface

type
  TCalculadora = class
    function Add(Value1, Value2 : Integer) : Integer;
  end;

implementation

{ TCalculadora }

function TCalculadora.Add(Value1, Value2: Integer): Integer;
begin
  result := value1 + value2;
end;

end.
