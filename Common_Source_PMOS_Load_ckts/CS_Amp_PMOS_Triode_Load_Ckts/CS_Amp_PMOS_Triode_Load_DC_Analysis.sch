v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 10 -110 10 -90 {lab=#net1}
N 10 -30 10 10 {lab=Vout}
N -90 40 -90 80 {lab=Vin}
N -90 40 -30 40 {lab=Vin}
N 10 70 10 170 {lab=GND}
N -300 120 -300 180 {lab=GND}
N -300 180 -210 180 {lab=GND}
N -210 120 -210 180 {lab=GND}
N -250 180 -250 200 {lab=GND}
N -300 30 -300 60 {lab=VDD}
N -210 30 -210 60 {lab=Vb}
N 10 -220 10 -170 {lab=VDD}
N -100 -140 -30 -140 {lab=Vb}
N 10 -20 140 -20 {lab=Vout}
N -90 140 -90 170 {lab=GND}
N 120 -20 120 60 {lab=Vout}
N 120 120 120 160 {lab=GND}
N 120 160 120 170 {lab=GND}
N 10 40 50 40 {lab=GND}
N 50 40 50 90 {lab=GND}
N 20 90 50 90 {lab=GND}
N 10 90 20 90 {lab=GND}
N 10 -140 50 -140 {lab=VDD}
N 50 -190 50 -140 {lab=VDD}
N 10 -190 50 -190 {lab=VDD}
C {sky130_fd_pr/nfet_01v8.sym} -10 40 0 0 {name=M1
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
C {sky130_fd_pr/pfet_01v8_lvt.sym} -10 -140 0 0 {name=M2
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
C {vsource.sym} 10 -60 0 0 {name=Vcm value=0 savecurrent=false}
C {vsource.sym} -90 110 0 0 {name=VG value=0 savecurrent=false}
C {gnd.sym} 10 170 0 0 {name=l1 lab=GND}
C {gnd.sym} -90 170 0 0 {name=l2 lab=GND}
C {vsource.sym} -210 90 0 0 {name=Vb value=0 savecurrent=false}
C {vsource.sym} -300 90 0 0 {name=VDD value=1.8 savecurrent=false}
C {gnd.sym} -250 200 0 0 {name=l3 lab=GND}
C {lab_wire.sym} -210 30 0 0 {name=p1 sig_type=std_logic lab=Vb}
C {lab_wire.sym} -300 30 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 10 -220 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -100 -140 0 0 {name=p4 sig_type=std_logic lab=Vb}
C {ipin.sym} -90 40 0 0 {name=p5 lab=Vin}
C {opin.sym} 140 -20 0 0 {name=p6 lab=Vout}
C {capa.sym} 120 90 0 0 {name=CL
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 120 170 0 0 {name=l4 lab=GND}
C {simulator_commands_shown.sym} 220 -130 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.temp 27
.dc VG 0 1.8 1m vb 0 1.8 0.6

.control
run

set color0  = white
set color1 = black

plot v(vout) v(vin)
plot i(vcm)

.endc
.end

"}
C {devices/code.sym} -320 -160 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
