v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 340 -390 340 -350 {lab=GND}
N 430 -390 430 -350 {lab=GND}
N 210 -580 210 -490 {lab=vin}
N 210 -620 300 -620 {lab=vin}
N 210 -430 210 -350 {lab=GND}
N 100 -440 100 -350 {lab=GND}
N 100 -550 100 -500 {lab=VDD}
N 340 -710 340 -650 {lab=VDD}
N 340 -620 390 -620 {lab=VDD}
N 390 -670 390 -620 {lab=VDD}
N 340 -670 390 -670 {lab=VDD}
N 340 -490 340 -450 {lab=vout}
N 340 -470 430 -470 {lab=vout}
N 430 -470 460 -470 {lab=vout}
N 430 -470 430 -450 {lab=vout}
N 340 -590 340 -570 {lab=#net1}
N 340 -510 340 -490 {lab=vout}
N 210 -610 210 -580 {lab=vin}
N 210 -620 210 -610 {lab=vin}
C {res.sym} 340 -420 0 0 {name=R1
value=8k
footprint=1206
device=resistor
m=1}
C {capa.sym} 430 -420 0 0 {name=CL
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} 210 -460 0 0 {name=VG value="sin(0.9 50m 1k)" savecurrent=false}
C {opin.sym} 460 -470 0 0 {name=p1 lab=vout}
C {gnd.sym} 340 -350 0 0 {name=l1 lab=GND}
C {gnd.sym} 430 -350 0 0 {name=l2 lab=GND}
C {gnd.sym} 210 -350 0 0 {name=l3 lab=GND}
C {vsource.sym} 100 -470 0 0 {name=VDD value=1.8 savecurrent=false}
C {gnd.sym} 100 -350 0 0 {name=l4 lab=GND}
C {lab_wire.sym} 100 -550 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 340 -710 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {ipin.sym} 210 -620 0 0 {name=p4 lab=vin}
C {simulator_commands_shown.sym} 540 -680 0 0 {name=COMMANDS
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

plot v(vout) v(vin)
plot i(vcm)
plot v(vout)

.endc
.end

"}
C {devices/code.sym} 30 -720 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {vsource.sym} 340 -540 0 0 {name=vcm value=0 savecurrent=false}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 320 -620 0 0 {name=M1
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
