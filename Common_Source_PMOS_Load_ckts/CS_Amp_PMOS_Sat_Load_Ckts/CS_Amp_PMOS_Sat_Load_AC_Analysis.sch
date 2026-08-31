v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -610 120 -610 140 {lab=#net1}
N -610 200 -610 240 {lab=Vout}
N -710 270 -710 310 {lab=Vin}
N -710 270 -650 270 {lab=Vin}
N -610 300 -610 400 {lab=GND}
N -920 350 -920 410 {lab=GND}
N -920 410 -830 410 {lab=GND}
N -830 350 -830 410 {lab=GND}
N -870 410 -870 430 {lab=GND}
N -920 260 -920 290 {lab=VDD}
N -830 260 -830 290 {lab=Vb}
N -610 10 -610 60 {lab=VDD}
N -720 90 -650 90 {lab=Vb}
N -610 210 -480 210 {lab=Vout}
N -710 370 -710 400 {lab=GND}
N -500 210 -500 290 {lab=Vout}
N -500 350 -500 390 {lab=GND}
N -500 390 -500 400 {lab=GND}
N -610 270 -570 270 {lab=GND}
N -570 270 -570 320 {lab=GND}
N -600 320 -570 320 {lab=GND}
N -610 320 -600 320 {lab=GND}
N -610 90 -570 90 {lab=VDD}
N -570 40 -570 90 {lab=VDD}
N -610 40 -570 40 {lab=VDD}
C {sky130_fd_pr/nfet_01v8.sym} -630 270 0 0 {name=M1
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
C {sky130_fd_pr/pfet_01v8_lvt.sym} -630 90 0 0 {name=M2
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
C {vsource.sym} -610 170 0 0 {name=Vcm value=0 savecurrent=false}
C {vsource.sym} -710 340 0 0 {name=VG value="DC 0.835 AC 1 sin(0.835 1m 1k)" savecurrent=false}
C {gnd.sym} -610 400 0 0 {name=l1 lab=GND}
C {gnd.sym} -710 400 0 0 {name=l2 lab=GND}
C {vsource.sym} -830 320 0 0 {name=Vb value=0.9 savecurrent=false}
C {vsource.sym} -920 320 0 0 {name=VDD value=1.8 savecurrent=false}
C {gnd.sym} -870 430 0 0 {name=l3 lab=GND}
C {lab_wire.sym} -830 260 0 0 {name=p1 sig_type=std_logic lab=Vb}
C {lab_wire.sym} -920 260 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -610 10 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -720 90 0 0 {name=p4 sig_type=std_logic lab=Vb}
C {ipin.sym} -710 270 0 0 {name=p5 lab=Vin}
C {opin.sym} -480 210 0 0 {name=p6 lab=Vout}
C {capa.sym} -500 320 0 0 {name=CL
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -500 400 0 0 {name=l4 lab=GND}
C {simulator_commands_shown.sym} -390 10 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.temp 27
.ac dec 10 1 10G

.control
run

set color0  = white
set color1 = black

plot v(vout) v(vin)
plot i(vcm)

let gain_db = vdb(vout)
let phase = cph(vout)

plot gain_db
plot phase

*UGB
meas ac UGB when gain_db = 0

*POle Frequency
let A0 = gain_db[0]
let A3dB = A0 - 3

meas ac Pole_Freq when gain_db = A3dB

.endc
.end

"}
C {devices/code.sym} -940 70 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
