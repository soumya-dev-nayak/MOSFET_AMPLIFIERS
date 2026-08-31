v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -170 40 -170 60 {lab=#net1}
N -170 120 -170 160 {lab=Vout}
N -270 190 -270 230 {lab=Vin}
N -270 190 -210 190 {lab=Vin}
N -170 220 -170 320 {lab=GND}
N -480 270 -480 330 {lab=GND}
N -480 330 -390 330 {lab=GND}
N -390 270 -390 330 {lab=GND}
N -430 330 -430 350 {lab=GND}
N -480 180 -480 210 {lab=VDD}
N -390 180 -390 210 {lab=Vb}
N -170 -70 -170 -20 {lab=VDD}
N -280 10 -210 10 {lab=Vb}
N -170 130 -40 130 {lab=Vout}
N -270 290 -270 320 {lab=GND}
N -60 130 -60 210 {lab=Vout}
N -60 270 -60 310 {lab=GND}
N -60 310 -60 320 {lab=GND}
N -170 190 -130 190 {lab=GND}
N -130 190 -130 240 {lab=GND}
N -160 240 -130 240 {lab=GND}
N -170 240 -160 240 {lab=GND}
N -170 10 -130 10 {lab=VDD}
N -130 -40 -130 10 {lab=VDD}
N -170 -40 -130 -40 {lab=VDD}
C {sky130_fd_pr/nfet_01v8.sym} -190 190 0 0 {name=M1
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
C {sky130_fd_pr/pfet_01v8_lvt.sym} -190 10 0 0 {name=M2
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
C {vsource.sym} -170 90 0 0 {name=Vcm value=0 savecurrent=false}
C {vsource.sym} -270 260 0 0 {name=VG value="DC 0.85 AC 1 sin(0.835 1m 1k)" savecurrent=false}
C {gnd.sym} -170 320 0 0 {name=l1 lab=GND}
C {gnd.sym} -270 320 0 0 {name=l2 lab=GND}
C {vsource.sym} -390 240 0 0 {name=Vb value=0.45 savecurrent=false}
C {vsource.sym} -480 240 0 0 {name=VDD value=1.8 savecurrent=false}
C {gnd.sym} -430 350 0 0 {name=l3 lab=GND}
C {lab_wire.sym} -390 180 0 0 {name=p1 sig_type=std_logic lab=Vb}
C {lab_wire.sym} -480 180 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -170 -70 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -280 10 0 0 {name=p4 sig_type=std_logic lab=Vb}
C {ipin.sym} -270 190 0 0 {name=p5 lab=Vin}
C {opin.sym} -40 130 0 0 {name=p6 lab=Vout}
C {capa.sym} -60 240 0 0 {name=CL
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -60 320 0 0 {name=l4 lab=GND}
C {simulator_commands_shown.sym} 50 -70 0 0 {name=COMMANDS
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
C {devices/code.sym} -500 -10 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
