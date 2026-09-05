v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 100 -30 130 -30 {lab=#net1}
N 100 -30 100 20 {lab=#net1}
N 170 210 170 270 {lab=GND}
N 170 -80 170 -60 {lab=VDD}
N 170 120 320 120 {lab=Vout}
N 290 120 290 160 {lab=Vout}
N 290 220 290 270 {lab=GND}
N 40 270 170 270 {lab=GND}
N 40 260 40 270 {lab=GND}
N 40 180 40 200 {lab=Vin}
N 40 180 130 180 {lab=Vin}
N 170 180 200 180 {lab=GND}
N 200 180 200 220 {lab=GND}
N 170 220 200 220 {lab=GND}
N 170 -30 240 -30 {lab=VDD}
N -100 240 -100 280 {lab=GND}
N -100 140 -100 180 {lab=VDD}
N 170 -100 170 -80 {lab=VDD}
N 170 100 170 150 {lab=Vout}
N 170 90 170 100 {lab=Vout}
N 170 0 170 30 {lab=#net1}
N 100 20 170 20 {lab=#net1}
N 170 -80 240 -80 {lab=VDD}
N 240 -80 240 -30 {lab=VDD}
C {devices/code.sym} -160 -60 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {gnd.sym} 170 270 0 0 {name=l1 lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 150 180 0 0 {name=M1
W=1
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 150 -30 0 0 {name=M2
W=1
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {vsource.sym} 170 60 0 0 {name=Vcm value=0 savecurrent=false}
C {capa.sym} 290 190 0 0 {name=CL
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {opin.sym} 320 120 0 0 {name=p1 lab=Vout}
C {gnd.sym} 290 270 0 0 {name=l2 lab=GND}
C {vsource.sym} 40 230 0 0 {name=VG value="DC 0.850 AC 1 sin(0.850 1m 1k)" savecurrent=false}
C {vsource.sym} -100 210 0 0 {name=VDD value=1.8 savecurrent=false}
C {gnd.sym} -100 280 0 0 {name=l3 lab=GND}
C {lab_wire.sym} -100 140 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 170 -100 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {ipin.sym} 40 180 0 0 {name=p4 lab=Vin}
C {simulator_commands_shown.sym} 380 -50 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.temp 27
.tran 10n 10m

.control
run

set color0 = white
set color1 = black

plot v(vout)
plot i(vcm)
plot v(vout) v(vin)

.endc
.end
"}
