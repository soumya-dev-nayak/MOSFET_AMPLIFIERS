v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 20 60 20 100 {lab=GND}
N 110 60 110 100 {lab=GND}
N -110 -130 -110 -40 {lab=vin}
N -110 -130 -20 -130 {lab=vin}
N -110 20 -110 100 {lab=GND}
N -220 10 -220 100 {lab=GND}
N -220 -100 -220 -50 {lab=VDD}
N 20 -220 20 -160 {lab=VDD}
N 20 -130 70 -130 {lab=VDD}
N 70 -180 70 -130 {lab=VDD}
N 20 -180 70 -180 {lab=VDD}
N 20 -40 20 -0 {lab=vout}
N 20 -20 110 -20 {lab=vout}
N 110 -20 140 -20 {lab=vout}
N 110 -20 110 -0 {lab=vout}
C {res.sym} 20 30 0 0 {name=R1
value=8k
footprint=1206
device=resistor
m=1}
C {capa.sym} 110 30 0 0 {name=CL
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {sky130_fd_pr/pfet_01v8.sym} 0 -130 0 0 {name=M1
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
model=pfet_01v8
spiceprefix=X
}
C {vsource.sym} -110 -10 0 0 {name=VG value=0 savecurrent=false}
C {opin.sym} 140 -20 0 0 {name=p1 lab=vout}
C {gnd.sym} 20 100 0 0 {name=l1 lab=GND}
C {gnd.sym} 110 100 0 0 {name=l2 lab=GND}
C {gnd.sym} -110 100 0 0 {name=l3 lab=GND}
C {vsource.sym} -220 -20 0 0 {name=VDD value=1.8 savecurrent=false}
C {gnd.sym} -220 100 0 0 {name=l4 lab=GND}
C {lab_wire.sym} -220 -100 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 20 -220 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {ipin.sym} -110 -130 0 0 {name=p4 lab=vin}
C {simulator_commands_shown.sym} 220 -160 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.temp 27
.dc VG 0 1.8 1m

.control
run

set color0 = white
set color1 = black

plot v(vout) v(vin)
let gain = -deriv(v(vout))
plot gain
plot i(vcm)

.endc
.end
"}
C {devices/code.sym} -290 -270 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {vsource.sym} 20 -70 0 0 {name=vcm value=0 savecurrent=false}
