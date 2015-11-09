within BuildingSystems.HAM.HeatAndMoistureTransport.Functions;
function interpol
  "Calculates a value y for a given value x based on discrete tuple of values"
  input Real x
    "Independent value";
  input Real tabX[:]
    "Discrete independent value list";
  input Real tabY[:]
    "Discrete dependent value list";
  input Integer mode
    "1: linear interpolation; 2: exponential interpolation";
  output Real y
    "dependent value";
protected
  Real grad;
  Integer i;
  Integer j;
  Integer m;
  Integer mp;

algorithm
  i := 1;
  j := size(tabX,1);
  m := integer((i+j)/2);
  while m <> i loop
    if x < tabX[m] then
      j := m;
    else
      i := m;
    end if;
    m := integer((i+j)/2);
  end while;
  mp := m + 1;
  grad := (x - tabX[m]) / (tabX[mp] - tabX[m]);
  if mode == 1 then
    // Linear interpolation
    y := (1.0 - grad) * tabY[m] + grad * tabY[mp];
  else
    // Exponential interpolation
    y := (tabY[m])^(1.0-grad) * (tabY[mp])^(grad);
  end if;
end interpol;
