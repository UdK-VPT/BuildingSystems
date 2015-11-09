within BuildingSystems.UsersGuide;
class Conventions "Conventions"
  extends Modelica.Icons.Information;
  annotation (Documentation(info="<html>
    <p>This library follows the conventions of the <a href=\"modelica://Modelica.UsersGuide.Conventions\">Modelica Standard Library</a>, which are as follows: </p>
    <p>Note, in the html documentation of any Modelica library, the headings &quot;h1, h2, h3&quot; should not be used, because they are utilized from the automatically generated documentation/headings. Additional headings in the html documentation should start with &quot;h4&quot;. </p>
    <p>In the Modelica package the following conventions are used: </p>
    <ol>
    <li><b>Class and instance names</b> are written in upper and lower case letters, e.g., &quot;PipeStraight&quot;. An underscore is only used at the end of a name to characterize a lower or upper index, e.g., &quot;port_1&quot;.<br/>&nbsp; </li>
    <li><b>Class names</b> start always with an upper case letter.<br/>&nbsp; </li>
    <li><b>Instance names</b>, i.e., names of component instances and of variables (with the exception of constants), start usually with a lower case letter with only a few exceptions if this is common sense (such as &quot;T&quot; for a temperature variable).<br/>&nbsp; </li>
    <li><b>Constant names</b>, i.e., names of variables declared with the &quot;constant&quot; prefix, follow the usual naming conventions (= upper and lower case letters) and start usually with an upper case letter, e.g. UniformGravity, SteadyState.<br/>&nbsp;</li>
    <li>The <b>instance name</b> of a component is always displayed in its icon (= text string &quot;&#37;name&quot;) in <b>blue color</b>. A connector class has the instance name definition in the diagram layer and not in the icon layer. <b>Parameter</b> values, e.g., resistance, mass, gear ratio, are displayed in the icon in <b>black color</b> in a smaller font size as the instance name. <br/>&nbsp;</li>
    <li>A main package has usually the following subpackages: </li>
    <li><ul>
      <li><b>UsersGuide</b> containing an overall description of the library and how to use it. </li>
      <li><b>Examples</b> containing models demonstrating the usage of the library. </li>
      <li><b>Interfaces</b> containing connectors and partial models. </li>
      <li><b>Types</b> containing type, enumeration and choice definitions. </li>
    </ul></li>
    </ol>

    <p>The <code>BuildingSystems</code> library uses the following conventions in addition to the ones of the Modelica Standard Library: </p>
    <ol>
    <li>a </li>
    <li>b </li>
    <li>b </li>
    </ol>
    </html>"));
end Conventions;
