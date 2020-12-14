unit TesteProjeto;

interface
uses
  DUnitX.TestFramework,
  Calculadora;

type

  [TestFixture]
  TTesteProjeto = class(TObject)
  private
    FCalculadora : TCalculadora;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    // Sample Methods
    // Simple single Test
    [Test]
    procedure Test1;
    // Test with TestCase Attribute to supply parameters.
    [Test]
    [TestCase('TestA','1,2,3')]
    [TestCase('TestB','3,4,7')]
    procedure Test2(const AValue1 : Integer;const AValue2 : Integer; const aValue3 : Integer);
  end;

implementation

procedure TTesteProjeto.Setup;
begin
  FCalculadora := TCalculadora.Create;
end;

procedure TTesteProjeto.TearDown;
begin
  FCalculadora.Free;
end;

procedure TTesteProjeto.Test1;
begin
end;

procedure TTesteProjeto.Test2(const AValue1 : Integer;const AValue2 : Integer; const aValue3 : Integer);
var
  a : Integer;
begin
  a := FCalculadora.Add(aValue1,aValue2);
  if a=avalue3 then
    Assert.Pass('Passou')
  else
    Assert.Fail('Falhou');
end;

initialization
  TDUnitX.RegisterTestFixture(TTesteProjeto);
end.
