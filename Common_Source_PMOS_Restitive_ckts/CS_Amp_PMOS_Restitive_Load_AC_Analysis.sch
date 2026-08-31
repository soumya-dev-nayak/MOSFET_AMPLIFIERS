v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -620 370 -620 410 {lab=GND}
N -530 370 -530 410 {lab=GND}
N -750 180 -750 270 {lab=vin}
N -750 140 -660 140 {lab=vin}
N -750 330 -750 410 {lab=GND}
N -860 320 -860 410 {lab=GND}
N -860 210 -860 260 {lab=VDD}
N -620 50 -620 110 {lab=VDD}
N -620 140 -570 140 {lab=VDD}
N -570 90 -570 140 {lab=VDD}
N -620 90 -570 90 {lab=VDD}
N -620 270 -620 310 {lab=vout}
N -620 290 -530 290 {lab=vout}
N -530 290 -500 290 {lab=vout}
N -530 290 -530 310 {lab=vout}
N -620 170 -620 190 {lab=#net1}
N -620 250 -620 270 {lab=vout}
N -750 150 -750 180 {lab=vin}
N -750 140 -750 150 {lab=vin}
C {res.sym} -620 340 0 0 {name=R1
value=8k
footprint=1206
device=resistor
m=1}
C {capa.sym} -530 340 0 0 {name=CL
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} -750 300 0 0 {name=VG value="DC 0.9 AC 1" savecurrent=false}
C {opin.sym} -500 290 0 0 {name=p1 lab=vout}
C {gnd.sym} -620 410 0 0 {name=l1 lab=GND}
C {gnd.sym} -530 410 0 0 {name=l2 lab=GND}
C {gnd.sym} -750 410 0 0 {name=l3 lab=GND}
C {vsource.sym} -860 290 0 0 {name=VDD value=1.8 savecurrent=false}
C {gnd.sym} -860 410 0 0 {name=l4 lab=GND}
C {lab_wire.sym} -860 210 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -620 50 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {ipin.sym} -750 140 0 0 {name=p4 lab=vin}
C {simulator_commands_shown.sym} -400 70 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.temp 27
.ac dec 10 10 10G

.control
run

set color0 = white
set color1 = black

plot v(vout) v(vin)
plot i(vcm)

let gain_db = db(v(vout))
let phase = cph(v(vout))

plot gain_db
plot phase
plot -(v(vout)/v(vin))

*Measuring the UGB
meas ac UGB when gain_db = 0

let A0 = gain_db[0]
let A3dB = gain_db[0] - 3

*Measuring the pole Frequency
meas ac Pole_Freq when gain_db = A3dB

*Measuring the Zero Frequnecy

.endc
.end

"}
C {devices/code.sym} -930 40 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {vsource.sym} -620 220 0 0 {name=vcm value=0 savecurrent=false}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -640 140 0 0 {name=M1
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
