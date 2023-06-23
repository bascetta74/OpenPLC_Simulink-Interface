model tank_model
  Modelica.Fluid.Vessels.OpenTank tank(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, crossArea = 10, height = 6, level_start = 2.5, nPorts = 2, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.4), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.4, height = 5)}, use_HeatTransfer = true, use_portsData = true) annotation(
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe out_pipe(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, diameter = 0.4, height_ab = -1, length = 1) annotation(
    Placement(visible = true, transformation(origin = {20, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe in_pipe(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, diameter = 0.4, height_ab = 1, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-20, -10}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {90, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression level_sensor(y = tank.level) annotation(
    Placement(visible = true, transformation(origin = {50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveDiscrete out_valve(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, dp_nominal = 25000, m_flow_nominal = 1000)  annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary sink(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, nPorts = 1, p = 0.75E+5)  annotation(
    Placement(visible = true, transformation(origin = {90, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveDiscrete in_valve(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, dp_nominal = 99999.99999999999, m_flow_nominal = 1000) annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary source(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, nPorts = 1, p = 2.2E+5) annotation(
    Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor annotation(
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput tank_temperature annotation(
    Placement(visible = true, transformation(origin = {130, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {130, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput tank_level annotation(
    Placement(visible = true, transformation(origin = {130, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {140, 102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.LessThreshold low_threshold(threshold = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {90, 40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterThreshold high_threshold(threshold = 4.5)  annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanOutput tank_low_level_switch annotation(
    Placement(visible = true, transformation(origin = {130, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {128, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanOutput tank_high_level_switch annotation(
    Placement(visible = true, transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {138, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor heating_resistor(R(displayUnit = "kOhm") = 10000, alpha = 0.03, useHeatPort = true)  annotation(
    Placement(visible = true, transformation(origin = {-42, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Analog.Sources.SignalCurrent current_generator annotation(
    Placement(visible = true, transformation(origin = {-70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput heater_current annotation(
    Placement(visible = true, transformation(origin = {-140, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-132, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput in_valve_cmd annotation(
    Placement(visible = true, transformation(origin = {-140, -10}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-176, -8}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput out_valve_cmd annotation(
    Placement(visible = true, transformation(origin = {-140, -70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-166, 2}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(out_pipe.port_a, tank.ports[1]) annotation(
    Line(points = {{20, 0}, {20, 10}, {0, 10}, {0, 20}}, color = {0, 127, 255}));
  connect(in_pipe.port_b, tank.ports[2]) annotation(
    Line(points = {{-20, 0}, {-20, 10}, {0, 10}, {0, 20}}, color = {0, 127, 255}));
  connect(out_valve.port_a, out_pipe.port_b) annotation(
    Line(points = {{40, -30}, {20, -30}, {20, -20}}, color = {0, 127, 255}));
  connect(out_valve.port_b, sink.ports[1]) annotation(
    Line(points = {{60, -30}, {80, -30}}, color = {0, 127, 255}));
  connect(in_valve.port_b, in_pipe.port_a) annotation(
    Line(points = {{-40, -30}, {-20, -30}, {-20, -20}}, color = {0, 127, 255}));
  connect(source.ports[1], in_valve.port_a) annotation(
    Line(points = {{-80, -30}, {-60, -30}}, color = {0, 127, 255}));
  connect(temperatureSensor.T, tank_temperature) annotation(
    Line(points = {{100, 90}, {130, 90}}, color = {0, 0, 127}));
  connect(level_sensor.y, tank_level) annotation(
    Line(points = {{61, 70}, {130, 70}}, color = {0, 0, 127}));
  connect(temperatureSensor.port, tank.heatPort) annotation(
    Line(points = {{80, 90}, {-26, 90}, {-26, 40}, {-20, 40}}, color = {191, 0, 0}));
  connect(low_threshold.u, level_sensor.y) annotation(
    Line(points = {{83, 40}, {70, 40}, {70, 70}, {62, 70}}, color = {0, 0, 127}));
  connect(high_threshold.u, level_sensor.y) annotation(
    Line(points = {{83, 10}, {70, 10}, {70, 70}, {62, 70}}, color = {0, 0, 127}));
  connect(low_threshold.y, tank_low_level_switch) annotation(
    Line(points = {{97, 40}, {130, 40}}, color = {255, 0, 255}));
  connect(high_threshold.y, tank_high_level_switch) annotation(
    Line(points = {{97, 10}, {130, 10}}, color = {255, 0, 255}));
  connect(heating_resistor.heatPort, tank.heatPort) annotation(
    Line(points = {{-32, 40}, {-20, 40}}, color = {191, 0, 0}));
  connect(current_generator.p, ground.p) annotation(
    Line(points = {{-70, 30}, {-70, 20}}, color = {0, 0, 255}));
  connect(heating_resistor.p, ground.p) annotation(
    Line(points = {{-42, 30}, {-42, 24}, {-70, 24}, {-70, 20}}, color = {0, 0, 255}));
  connect(current_generator.n, heating_resistor.n) annotation(
    Line(points = {{-70, 50}, {-70, 56}, {-42, 56}, {-42, 50}}, color = {0, 0, 255}));
  connect(heater_current, current_generator.i) annotation(
    Line(points = {{-140, 40}, {-82, 40}}, color = {0, 0, 127}));
  connect(in_valve_cmd, in_valve.open) annotation(
    Line(points = {{-140, -10}, {-50, -10}, {-50, -22}}, color = {255, 0, 255}));
  connect(out_valve_cmd, out_valve.open) annotation(
    Line(points = {{-140, -70}, {30, -70}, {30, -10}, {50, -10}, {50, -22}}, color = {255, 0, 255}));
  annotation(
    uses(Modelica(version = "4.0.0")),
  experiment(StartTime = 0, StopTime = 120, Tolerance = 1e-6, Interval = 0.24));
end tank_model;