
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental {C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/utils_1/imports/synth_1/test_double_mux.dcp}Z12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/utils_1/imports/synth_1/test_double_mux.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
j
Command: %s
53*	vivadotcl29
7synth_design -top test_double_mux -part xc7a35tcpg236-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
z
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2	
xc7a35tZ17-347h px� 
j
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2	
xc7a35tZ17-349h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
16092Z8-7075h px� 
�
%s*synth2u
sStarting Synthesize : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 862.691 ; gain = 470.789
h px� 
�
synthesizing module '%s'638*oasys2
test_double_mux2�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
1388@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

double_mux2�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
872
test_instance2

double_mux2�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
1538@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2

double_mux2�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
1008@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Mux02�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
52
	Mux0_inst2
Mux02�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
1278@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
Mux02�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
178@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
Mux02
02
12�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
178@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Mux12�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
532
	Mux1_inst2
Mux12�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
1288@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
Mux12�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
658@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
Mux2To12�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
312
Mux12	
Mux2To12�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
778@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2	
Mux2To12�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
408@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2	
Mux2To12
02
12�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
408@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
Mux2To12�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
312
Mux22	
Mux2To12�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
788@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
Mux2To12�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
312
Mux32	
Mux2To12�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
798@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
Mux12
02
12�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
658@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2

double_mux2
02
12�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
1008@Z8-256h px� 
�
&ignoring unsynthesizable construct: %s312*oasys2!
wait statement with no conditon2�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
1628@Z8-312h px� 
�
&ignoring unsynthesizable construct: %s312*oasys2!
wait statement with no conditon2�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
1708@Z8-312h px� 
�
&ignoring unsynthesizable construct: %s312*oasys2!
wait statement with no conditon2�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
1788@Z8-312h px� 
�
&ignoring unsynthesizable construct: %s312*oasys2!
wait statement with no conditon2�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
1868@Z8-312h px� 
�
&ignoring unsynthesizable construct: %s312*oasys2!
wait statement with no conditon2�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
1948@Z8-312h px� 
�
&ignoring unsynthesizable construct: %s312*oasys2!
wait statement with no conditon2�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
2028@Z8-312h px� 
�
&ignoring unsynthesizable construct: %s312*oasys2!
wait statement with no conditon2�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
2108@Z8-312h px� 
�
&ignoring unsynthesizable construct: %s312*oasys2!
wait statement with no conditon2�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
2188@Z8-312h px� 
�
&ignoring unsynthesizable construct: %s312*oasys2!
wait statement with no conditon2�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
2268@Z8-312h px� 
�
&ignoring unsynthesizable construct: %s312*oasys2!
wait statement with no conditon2�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
2348@Z8-312h px� 
�
&ignoring unsynthesizable construct: %s312*oasys2!
wait statement with no conditon2�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
2428@Z8-312h px� 
�
&ignoring unsynthesizable construct: %s312*oasys2!
wait statement with no conditon2�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
2508@Z8-312h px� 
�
&ignoring unsynthesizable construct: %s312*oasys2!
wait statement with no conditon2�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
2588@Z8-312h px� 
�
&ignoring unsynthesizable construct: %s312*oasys2!
wait statement with no conditon2�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
2668@Z8-312h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
test_double_mux2
02
12�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.srcs/sources_1/new/Step5.vhd2
1388@Z8-256h px� 
�
%s*synth2u
sFinished Synthesize : Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 968.004 ; gain = 576.102
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
~Finished Constraint Validation : Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 968.004 ; gain = 576.102
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Loading part: xc7a35tcpg236-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 968.004 ; gain = 576.102
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
Loading part %s157*device2
xc7a35tcpg236-1Z21-403h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 968.004 ; gain = 576.102
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
p
%s
*synth2X
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:11 ; elapsed = 00:00:11 . Memory (MB): peak = 1100.770 ; gain = 708.867
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:11 ; elapsed = 00:00:11 . Memory (MB): peak = 1125.605 ; gain = 733.703
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:11 ; elapsed = 00:00:11 . Memory (MB): peak = 1125.605 ; gain = 733.703
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:00:14 ; elapsed = 00:00:15 . Memory (MB): peak = 1327.785 ; gain = 935.883
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:14 ; elapsed = 00:00:15 . Memory (MB): peak = 1327.785 ; gain = 935.883
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:14 ; elapsed = 00:00:15 . Memory (MB): peak = 1327.785 ; gain = 935.883
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:14 ; elapsed = 00:00:15 . Memory (MB): peak = 1327.785 ; gain = 935.883
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:14 ; elapsed = 00:00:15 . Memory (MB): peak = 1327.785 ; gain = 935.883
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:14 ; elapsed = 00:00:15 . Memory (MB): peak = 1327.785 ; gain = 935.883
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
| |BlackBox name |Instances |
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
+
%s*synth2
+-+-----+------+
h px� 
+
%s*synth2
| |Cell |Count |
h px� 
+
%s*synth2
+-+-----+------+
h px� 
+
%s*synth2
+-+-----+------+
h px� 
3
%s
*synth2

Report Instance Areas: 
h p
x
� 
<
%s
*synth2$
"+------+---------+-------+------+
h p
x
� 
<
%s
*synth2$
"|      |Instance |Module |Cells |
h p
x
� 
<
%s
*synth2$
"+------+---------+-------+------+
h p
x
� 
<
%s
*synth2$
"|1     |top      |       |     0|
h p
x
� 
<
%s
*synth2$
"+------+---------+-------+------+
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:14 ; elapsed = 00:00:15 . Memory (MB): peak = 1327.785 ; gain = 935.883
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
a
%s
*synth2I
GSynthesis finished with 0 errors, 0 critical warnings and 15 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:14 ; elapsed = 00:00:15 . Memory (MB): peak = 1327.785 ; gain = 935.883
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:14 ; elapsed = 00:00:15 . Memory (MB): peak = 1327.785 ; gain = 935.883
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1328.8202
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1451.2192
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

8f518ca8Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
302
152
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:162

00:00:182

1451.2192

1064.555Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2�
�C:/Users/kimsv/OneDrive - Mlardalens universitet/Workspace/VivsdoProjects/DVA494_Lab1.5/DVA494_Lab1.5.runs/synth_1/test_double_mux.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2i
greport_utilization -file test_double_mux_utilization_synth.rpt -pb test_double_mux_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Sun Jan 26 16:17:31 2025Z17-206h px� 


End Record