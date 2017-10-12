within BuildingSystems.Buildings.BaseClasses;
partial model OpeningDiscretized
  "Opening model using discretization along height coordinate"
  extends BuildingSystems.Airflow.Multizone.BaseClasses.DoorDiscretized
  annotation (IconMap(primitivesVisible=false),DiagramMap(primitivesVisible=true));

  annotation (
Documentation(info="<html>
<p>
This is a partial model for the bi-directional air flow through an opening.
</p>
<p>
To compute the bi-directional flow,
the opening is discretize along the height coordinate, and uses
an orifice equation to compute the flow for each compartment.
</p>
<p>
The compartment area <code>dA</code> is a variable, which allows
using the model for a door that can be open or closed.
</p>
</html>",
revisions="<html>
<ul>
<li>
March 21, 2017, by Christoph Nytsch-Geusen:<br/>
Adaption of the class
<a href=\"modelica://BuildingSystems.Airflow.Multizone.BaseClasses.DoorDiscretized\">
BuildingSystems.Airflow.Multizone.BaseClasses.DoorDiscretized</a>.
for general openings for doors and Windows (door icon disabled).
</li>
</ul>
</html>"));
end OpeningDiscretized;
