within BuildingSystems.Technologies.SolarThermal.BaseClasses;
model IAM
  annotation (Documentation(info="<html>
The IAM is defined as the efficiency at the given incidence angle divided by the eddiciency at normal incidence and is thus equal to 1 for normal incidence of the direct radiation.

<h4>Main equations</h4>

<h4>Assumptions and Limitations</h4>
<p>
For standard flat plate collector the incidence angle modifier IAM is assumed to be the same in the transverse and the longitudinal direction.
</p>
<p>
For vollector with an asymmetric IAM, separate IAMs need to be determined in two or more of the quadrant from east to west (transversal IAM) and from north to south (longitudinal IAM).
</p>

<h4>References</h4>
<p>
Quality Assurance in Solar Heating and Cooling Technology. A Guido to the Standard EN 12975
</p>
</html>"));
end IAM;
