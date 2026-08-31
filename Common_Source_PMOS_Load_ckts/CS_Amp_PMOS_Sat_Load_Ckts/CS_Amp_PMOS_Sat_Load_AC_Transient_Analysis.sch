v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 380 -340 380 -320 {lab=#net1}
N 380 -260 380 -220 {lab=Vout}
N 280 -190 280 -150 {lab=Vin}
N 280 -190 340 -190 {lab=Vin}
N 380 -160 380 -60 {lab=GND}
N 70 -110 70 -50 {lab=GND}
N 70 -50 160 -50 {lab=GND}
N 160 -110 160 -50 {lab=GND}
N 120 -50 120 -30 {lab=GND}
N 70 -200 70 -170 {lab=VDD}
N 160 -200 160 -170 {lab=Vb}
N 380 -450 380 -400 {lab=VDD}
N 270 -370 340 -370 {lab=Vb}
N 380 -250 510 -250 {lab=Vout}
N 280 -90 280 -60 {lab=GND}
N 490 -250 490 -170 {lab=Vout}
N 490 -110 490 -70 {lab=GND}
N 490 -70 490 -60 {lab=GND}
N 380 -190 420 -190 {lab=GND}
N 420 -190 420 -140 {lab=GND}
N 390 -140 420 -140 {lab=GND}
N 380 -140 390 -140 {lab=GND}
N 380 -370 420 -370 {lab=VDD}
N 420 -420 420 -370 {lab=VDD}
N 380 -420 420 -420 {lab=VDD}
C {sky130_fd_pr/nfet_01v8.sym} 360 -190 0 0 {name=M1
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
C {sky130_fd_pr/pfet_01v8_lvt.sym} 360 -370 0 0 {name=M2
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
C {vsource.sym} 380 -290 0 0 {name=Vcm value=0 savecurrent=false}
C {vsource.sym} 280 -120 0 0 {name=VG value="DC 0.85 AC 1 sin(0.85 1m 1k)" savecurrent=false}
C {gnd.sym} 380 -60 0 0 {name=l1 lab=GND}
C {gnd.sym} 280 -60 0 0 {name=l2 lab=GND}
C {vsource.sym} 160 -140 0 0 {name=Vb value=0.9 savecurrent=false}
C {vsource.sym} 70 -140 0 0 {name=VDD value=1.8 savecurrent=false}
C {gnd.sym} 120 -30 0 0 {name=l3 lab=GND}
C {lab_wire.sym} 160 -200 0 0 {name=p1 sig_type=std_logic lab=Vb}
C {lab_wire.sym} 70 -200 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 380 -450 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 270 -370 0 0 {name=p4 sig_type=std_logic lab=Vb}
C {ipin.sym} 280 -190 0 0 {name=p5 lab=Vin}
C {opin.sym} 510 -250 0 0 {name=p6 lab=Vout}
C {capa.sym} 490 -140 0 0 {name=CL
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 490 -60 0 0 {name=l4 lab=GND}
C {simulator_commands_shown.sym} 600 -390 0 0 {name=COMMANDS
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
C {devices/code.sym} 50 -390 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
