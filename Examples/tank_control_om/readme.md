This is a more complex example showing a communication between OpenPLC and Simulink based on digital and analogue variables. The PLC program will fill in, heat and empty a tank. Simulink diagram represents the tank level and thermal model and sensor models.

The interface.cfg was configured for a system that is running everything (OpenPLC, Simulink and SimLink) on the same computer (localhost).

Files:  
tank_control -> PLCOpen Editor project with PLC SFC diagram  
tank_control.slx -> Simulink 2022 model using FMU block to integrate Modelica plant model
tank_control.mo -> OpenModelica model of the plant
tank_control.fmu -> FMU of tank model simulator generated using OpenModelica
interface.cfg -> File to be used to configure SimLink. Must be in the same folder of the executable
