within BuildingSystems.Buildings.Comfort.Functions;
function PPD_DIN_EN_ISO_7730
  "Calculates the PPD index accordung to DIN EN ISO 7730"
  input Real PMV
    "Predicted mean vote";
  output Real PPD
    "Predicted percentage dissatisfied";
algorithm
  PPD := 1 - 0.95 * exp(-0.03353 * PMV^4 - 0.2179 * PMV^2);

annotation(
  Documentation(info="<html>
  <p>Function that calculates the PPD index regarding DIN EN ISO 7730.</p>
  </html>", revisions="<html>
  <ul>
  <li>
  January 2, 2020, by Christoph Nytsch-Geusen<br/>
  First implementation.
  </li>
  </ul>
  </html>"));
end PPD_DIN_EN_ISO_7730;
