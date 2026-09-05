v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 25 45 25 105 {lab=Vin}
N -345 65 -345 165 {lab=GND}
N -345 165 -215 165 {lab=GND}
N -215 65 -215 165 {lab=GND}
N -345 -55 -345 5 {lab=VDD}
N -215 -55 -215 5 {lab=Vbias}
N -95 15 -15 15 {lab=Vbias}
N 25 165 25 195 {lab=GND}
N -285 165 -285 205 {lab=GND}
N 25 -25 25 -15 {lab=Vout}
N 25 -135 25 -115 {lab=#net1}
N 25 -55 25 -25 {lab=Vout}
N 25 -45 175 -45 {lab=Vout}
N 145 105 145 195 {lab=GND}
N 145 -45 145 45 {lab=Vout}
N 25 -255 25 -195 {lab=VDD}
N 25 15 85 15 {lab=GND}
N 85 15 85 185 {lab=GND}
N 85 185 85 195 {lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 5 15 0 0 {name=M1
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
C {res.sym} 25 -165 0 0 {name=RD
value=8k
footprint=1206
device=resistor
m=1}
C {capa.sym} 145 75 0 0 {name=CL
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} -345 35 0 0 {name=VDD value=1.8 savecurrent=false}
C {vsource.sym} -215 35 0 0 {name=Vbias value=0.9 savecurrent=false}
C {vsource.sym} 25 135 0 0 {name=VSS value="sin(0 1m 1k)" savecurrent=false}
C {lab_wire.sym} -345 -55 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -215 -55 0 1 {name=p2 sig_type=std_logic lab=Vbias}
C {lab_wire.sym} -95 15 0 0 {name=p3 sig_type=std_logic lab=Vbias}
C {gnd.sym} 25 195 0 0 {name=l1 lab=GND}
C {gnd.sym} -285 205 0 0 {name=l2 lab=GND}
C {vsource.sym} 25 -85 0 0 {name=Vcm value=0 savecurrent=false}
C {opin.sym} 175 -45 0 0 {name=p4 lab=Vout}
C {gnd.sym} 145 195 0 0 {name=l3 lab=GND}
C {lab_wire.sym} 25 -255 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {devices/code.sym} -345 -205 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} 245 -125 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* DC ANALYSIS OF THE CIRCUIT
.temp 27
.tran 10n 10m

.control
run

set color0 = white
set color1 = black

plot v(vin) v(vout)
plot i(vcm)
plot v(vout)

.endc
.end

"}
C {gnd.sym} 85 195 0 0 {name=l4 lab=GND}
C {lab_wire.sym} 25 85 0 0 {name=p6 sig_type=std_logic lab=Vin}
