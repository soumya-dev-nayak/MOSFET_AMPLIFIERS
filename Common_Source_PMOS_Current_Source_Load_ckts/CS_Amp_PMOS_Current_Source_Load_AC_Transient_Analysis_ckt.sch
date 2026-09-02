v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 220 -100 220 -50 {lab=VDD}
N 220 -100 390 -100 {lab=VDD}
N 390 -100 390 -50 {lab=VDD}
N 390 120 390 130 {lab=#net1}
N 220 190 220 220 {lab=GND}
N 220 220 390 220 {lab=GND}
N 390 190 390 220 {lab=GND}
N 310 220 310 250 {lab=GND}
N 220 160 390 160 {lab=GND}
N 310 160 310 220 {lab=GND}
N 260 -20 350 -20 {lab=#net2}
N 310 -20 310 30 {lab=#net2}
N 220 30 310 30 {lab=#net2}
N -210 160 -210 230 {lab=GND}
N -210 230 -100 230 {lab=GND}
N -100 160 -100 230 {lab=GND}
N -210 20 -210 100 {lab=Vb}
N -100 20 -100 100 {lab=Vin}
N -310 160 -310 230 {lab=GND}
N -310 230 -210 230 {lab=GND}
N -310 20 -310 100 {lab=VDD}
N -210 230 -210 260 {lab=GND}
N 430 160 490 160 {lab=Vin}
N 130 160 180 160 {lab=Vb}
N 310 -140 310 -100 {lab=VDD}
N 180 -20 220 -20 {lab=VDD}
N 180 -60 180 -20 {lab=VDD}
N 180 -60 220 -60 {lab=VDD}
N 390 -20 430 -20 {lab=VDD}
N 430 -60 430 -20 {lab=VDD}
N 390 -60 430 -60 {lab=VDD}
N 220 100 220 130 {lab=#net3}
N 220 10 220 40 {lab=#net2}
N 390 100 390 120 {lab=#net1}
N 390 10 390 40 {lab=Vout}
N 390 30 510 30 {lab=Vout}
N 510 30 570 30 {lab=Vout}
N 540 30 540 90 {lab=Vout}
N 540 150 540 240 {lab=GND}
N 540 240 540 250 {lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 200 160 0 0 {name=M1
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
C {sky130_fd_pr/pfet_01v8_lvt.sym} 240 -20 0 1 {name=M2
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
C {sky130_fd_pr/pfet_01v8_lvt.sym} 370 -20 0 0 {name=M3
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
C {gnd.sym} 310 250 0 0 {name=l1 lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 410 160 0 1 {name=M4
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
C {vsource.sym} -210 130 0 0 {name=Vb value=0.9 savecurrent=false}
C {vsource.sym} -100 130 0 0 {name=Vin value="DC 0.9 AC 1 sin(0.9 1m 1k)" savecurrent=false}
C {lab_wire.sym} -210 20 0 0 {name=p1 sig_type=std_logic lab=Vb}
C {vsource.sym} -310 130 0 0 {name=VDD value=1.8 savecurrent=false}
C {lab_wire.sym} -310 20 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -100 20 0 0 {name=p3 sig_type=std_logic lab=Vin}
C {gnd.sym} -210 260 0 0 {name=l2 lab=GND}
C {lab_wire.sym} 130 160 0 0 {name=p5 sig_type=std_logic lab=Vb}
C {lab_wire.sym} 310 -140 0 0 {name=p6 sig_type=std_logic lab=VDD}
C {vsource.sym} 220 70 0 0 {name=Vcm1 value=0 savecurrent=false}
C {vsource.sym} 390 70 0 0 {name=Vcm2 value=0 savecurrent=false}
C {simulator_commands_shown.sym} 640 -120 0 0 {name=COMMANDS
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

*Plotting the Outputs 
plot v(vout)
plot v(vout) v(vin)
plot i(vcm1) i(vcm2)
plot i(vcm2)

.endc
.end


"}
C {opin.sym} 570 30 0 0 {name=p7 lab=Vout}
C {capa.sym} 540 120 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {ipin.sym} 490 160 1 1 {name=p8 lab=Vin}
C {gnd.sym} 540 250 0 0 {name=l3 lab=GND}
C {devices/code.sym} -260 -150 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
