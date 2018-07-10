Code Generation
===============

This folder includes examples for automatic Modelica code generation of building and plant simulation models.

For this purpose the template based code generation tool [CoTeTo](https://github.com/UdK-VPT/CoTeTo.git) is used.

A short introduction into CoTeTo you can find under [CoTeTo/README.md](https://github.com/UdK-VPT/BuildingSystems/blob/master/README.md).

## Usage
1. Clone or download CoTeTo (https://github.com/UdK-VPT/CoTeTo.git)

2. Install CoTeTo on your machine.

3. Copy the folder with the respective code generator (e.g. https://github.com/UdK-VPT/BuildingSystems/blob/master/BuildingSystems/Resources/CodeGeneration/CoTeTo/Generators/SolarThermalSystem) in the folder CoTeTo/Generators.

4. Start the GUI of CoTeTo and select the generator of your interest, in this case `SolarThermalSystem`.

![CoTeTo-GUI](https://github.com/UdK-VPT/BuildingSystems/blob/master/BuildingSystems/Resources/CodeGeneration/CoTeTo/Images/CoTeTo.png)

5. Name the output file (e.g. SolarThermalSystem.mo) and press **Generate**.

6. Open the generated .mo-File in your Modelica simulation environment and simulate it.
