v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -500 170 -500 190 {lab=#net1}
N -500 250 -500 290 {lab=Vout}
N -600 320 -600 360 {lab=Vin}
N -600 320 -540 320 {lab=Vin}
N -500 350 -500 450 {lab=GND}
N -810 400 -810 460 {lab=GND}
N -810 460 -720 460 {lab=GND}
N -720 400 -720 460 {lab=GND}
N -760 460 -760 480 {lab=GND}
N -810 310 -810 340 {lab=VDD}
N -720 310 -720 340 {lab=Vb}
N -500 60 -500 110 {lab=VDD}
N -610 140 -540 140 {lab=Vb}
N -500 260 -370 260 {lab=Vout}
N -600 420 -600 450 {lab=GND}
N -390 260 -390 340 {lab=Vout}
N -390 400 -390 440 {lab=GND}
N -390 440 -390 450 {lab=GND}
N -500 320 -460 320 {lab=GND}
N -460 320 -460 370 {lab=GND}
N -490 370 -460 370 {lab=GND}
N -500 370 -490 370 {lab=GND}
N -500 140 -460 140 {lab=VDD}
N -460 90 -460 140 {lab=VDD}
N -500 90 -460 90 {lab=VDD}
C {devices/code.sym} -830 110 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {sky130_fd_pr/nfet_01v8.sym} -520 320 0 0 {name=M1
W=5
L=2
nf=1 
mult=4
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -520 140 0 0 {name=M2
W=5
L=2
nf=1
mult=12
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {vsource.sym} -500 220 0 0 {name=Vcm value=0 savecurrent=false}
C {vsource.sym} -600 390 0 0 {name=VG value=0 savecurrent=false}
C {gnd.sym} -500 450 0 0 {name=l1 lab=GND}
C {gnd.sym} -600 450 0 0 {name=l2 lab=GND}
C {vsource.sym} -720 370 0 0 {name=Vb value=0.9 savecurrent=false}
C {vsource.sym} -810 370 0 0 {name=VDD value=1.8 savecurrent=false}
C {gnd.sym} -760 480 0 0 {name=l3 lab=GND}
C {lab_wire.sym} -720 310 0 0 {name=p1 sig_type=std_logic lab=Vb}
C {lab_wire.sym} -810 310 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -500 60 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -610 140 0 0 {name=p4 sig_type=std_logic lab=Vb}
C {ipin.sym} -600 320 0 0 {name=p5 lab=Vin}
C {opin.sym} -370 260 0 0 {name=p6 lab=Vout}
C {capa.sym} -390 370 0 0 {name=CL
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -390 450 0 0 {name=l4 lab=GND}
C {simulator_commands_shown.sym} -290 150 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.temp 27
.dc VG 0 1.8 1m 

.control
run

set color0  = white
set color1 = black

plot v(vout) v(vin)
plot i(vcm)

*Getting the Operating point Voltages
MEAS DC VDop FIND v(vout) when i(Vcm) = 100u
MEAS DC VGop FIND v(vin) when i(Vcm) = 100u

*Finding the Rout
MEAS DC Iout1 FIND i(vcm) when Vout = 1.5964
MEAS DC Iout2 FIND i(vcm) when Vout = 1.6164

let I_cng = Iout1 - Iout2
let Rout = (1.6164 - 1.5964)/I_cng
print Rout 


.endc
.end

"}
