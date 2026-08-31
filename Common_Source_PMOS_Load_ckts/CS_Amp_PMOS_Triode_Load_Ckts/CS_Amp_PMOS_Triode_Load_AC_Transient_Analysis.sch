v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 70 -130 70 -110 {lab=#net1}
N 70 -50 70 -10 {lab=Vout}
N -30 20 -30 60 {lab=Vin}
N -30 20 30 20 {lab=Vin}
N 70 50 70 150 {lab=GND}
N -240 100 -240 160 {lab=GND}
N -240 160 -150 160 {lab=GND}
N -150 100 -150 160 {lab=GND}
N -190 160 -190 180 {lab=GND}
N -240 10 -240 40 {lab=VDD}
N -150 10 -150 40 {lab=Vb}
N 70 -240 70 -190 {lab=VDD}
N -40 -160 30 -160 {lab=Vb}
N 70 -40 200 -40 {lab=Vout}
N -30 120 -30 150 {lab=GND}
N 180 -40 180 40 {lab=Vout}
N 180 100 180 140 {lab=GND}
N 180 140 180 150 {lab=GND}
N 70 20 110 20 {lab=GND}
N 110 20 110 70 {lab=GND}
N 80 70 110 70 {lab=GND}
N 70 70 80 70 {lab=GND}
N 70 -160 110 -160 {lab=VDD}
N 110 -210 110 -160 {lab=VDD}
N 70 -210 110 -210 {lab=VDD}
C {sky130_fd_pr/nfet_01v8.sym} 50 20 0 0 {name=M1
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
C {sky130_fd_pr/pfet_01v8_lvt.sym} 50 -160 0 0 {name=M2
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
C {vsource.sym} 70 -80 0 0 {name=Vcm value=0 savecurrent=false}
C {vsource.sym} -30 90 0 0 {name=VG value="DC 0.85 AC 1 sin(0.85 1m 1k)" savecurrent=false}
C {gnd.sym} 70 150 0 0 {name=l1 lab=GND}
C {gnd.sym} -30 150 0 0 {name=l2 lab=GND}
C {vsource.sym} -150 70 0 0 {name=Vb value=0.4 savecurrent=false}
C {vsource.sym} -240 70 0 0 {name=VDD value=1.8 savecurrent=false}
C {gnd.sym} -190 180 0 0 {name=l3 lab=GND}
C {lab_wire.sym} -150 10 0 0 {name=p1 sig_type=std_logic lab=Vb}
C {lab_wire.sym} -240 10 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 70 -240 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -40 -160 0 0 {name=p4 sig_type=std_logic lab=Vb}
C {ipin.sym} -30 20 0 0 {name=p5 lab=Vin}
C {opin.sym} 200 -40 0 0 {name=p6 lab=Vout}
C {capa.sym} 180 70 0 0 {name=CL
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 180 150 0 0 {name=l4 lab=GND}
C {simulator_commands_shown.sym} 290 -180 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.temp 27
.tran 10n 10m

.control
run

set color0  = white
set color1 = black

plot v(vout) v(vin)
plot i(vcm)
plot v(vout)

.endc
.end

"}
C {devices/code.sym} -260 -180 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
