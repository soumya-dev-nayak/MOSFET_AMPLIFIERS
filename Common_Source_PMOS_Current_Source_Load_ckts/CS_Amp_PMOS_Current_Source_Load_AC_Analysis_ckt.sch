v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -230 -480 -230 -430 {lab=VDD}
N -230 -480 -60 -480 {lab=VDD}
N -60 -480 -60 -430 {lab=VDD}
N -60 -260 -60 -250 {lab=#net1}
N -230 -190 -230 -160 {lab=GND}
N -230 -160 -60 -160 {lab=GND}
N -60 -190 -60 -160 {lab=GND}
N -140 -160 -140 -130 {lab=GND}
N -230 -220 -60 -220 {lab=GND}
N -140 -220 -140 -160 {lab=GND}
N -190 -400 -100 -400 {lab=#net2}
N -140 -400 -140 -350 {lab=#net2}
N -230 -350 -140 -350 {lab=#net2}
N -660 -220 -660 -150 {lab=GND}
N -660 -150 -550 -150 {lab=GND}
N -550 -220 -550 -150 {lab=GND}
N -660 -360 -660 -280 {lab=Vb}
N -550 -360 -550 -280 {lab=Vin}
N -760 -220 -760 -150 {lab=GND}
N -760 -150 -660 -150 {lab=GND}
N -760 -360 -760 -280 {lab=VDD}
N -660 -150 -660 -120 {lab=GND}
N -20 -220 40 -220 {lab=Vin}
N -320 -220 -270 -220 {lab=Vb}
N -140 -520 -140 -480 {lab=VDD}
N -270 -400 -230 -400 {lab=VDD}
N -270 -440 -270 -400 {lab=VDD}
N -270 -440 -230 -440 {lab=VDD}
N -60 -400 -20 -400 {lab=VDD}
N -20 -440 -20 -400 {lab=VDD}
N -60 -440 -20 -440 {lab=VDD}
N -230 -280 -230 -250 {lab=#net3}
N -230 -370 -230 -340 {lab=#net2}
N -60 -280 -60 -260 {lab=#net1}
N -60 -370 -60 -340 {lab=Vout}
N -60 -350 60 -350 {lab=Vout}
N 60 -350 120 -350 {lab=Vout}
N 90 -350 90 -290 {lab=Vout}
N 90 -230 90 -140 {lab=GND}
N 90 -140 90 -130 {lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} -250 -220 0 0 {name=M1
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
C {sky130_fd_pr/pfet_01v8_lvt.sym} -210 -400 0 1 {name=M2
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
C {sky130_fd_pr/pfet_01v8_lvt.sym} -80 -400 0 0 {name=M3
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
C {gnd.sym} -140 -130 0 0 {name=l1 lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} -40 -220 0 1 {name=M4
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
C {vsource.sym} -660 -250 0 0 {name=Vb value=0.9 savecurrent=false}
C {vsource.sym} -550 -250 0 0 {name=Vin value="DC 0.9 AC 1 sin(0.9 1m 1k)" savecurrent=false}
C {lab_wire.sym} -660 -360 0 0 {name=p1 sig_type=std_logic lab=Vb}
C {vsource.sym} -760 -250 0 0 {name=VDD value=1.8 savecurrent=false}
C {lab_wire.sym} -760 -360 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -550 -360 0 0 {name=p3 sig_type=std_logic lab=Vin}
C {gnd.sym} -660 -120 0 0 {name=l2 lab=GND}
C {lab_wire.sym} -320 -220 0 0 {name=p5 sig_type=std_logic lab=Vb}
C {lab_wire.sym} -140 -520 0 0 {name=p6 sig_type=std_logic lab=VDD}
C {vsource.sym} -230 -310 0 0 {name=Vcm1 value=0 savecurrent=false}
C {vsource.sym} -60 -310 0 0 {name=Vcm2 value=0 savecurrent=false}
C {simulator_commands_shown.sym} 190 -550 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.temp 27
.ac dec 10 1 10G

.control
run

set color0 = white
set color1 = black

plot v(vout) v(vin)
plot i(vcm1) i(vcm2)
plot i(vcm2)

*Find the Gain in dB & Phase
let gain_db = vdb(vout)
let phase = ph(v(vout)) * (180/pi)

plot gain_db
plot phase
plot gain_db phase

*Normal Gain
plot -(v(vout)/v(vin))

*Finding the UGB
meas ac UGB when gain_db = 0

*Finding the Pole Frequency
let A0 = gain_db[0]
let A3dB = gain_db[0] - 3

meas ac Pole_Freq WHEN gain_db = A3dB

*Measuring the Zero Frequency

let slope = deriv(gain_db) * frequency * ln(10)
plot slope
MEAS AC Zero_Freq WHEN slope = -10 CROSS = 2

.endc
.end


"}
C {opin.sym} 120 -350 0 0 {name=p7 lab=Vout}
C {capa.sym} 90 -260 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {ipin.sym} 40 -220 1 1 {name=p8 lab=Vin}
C {gnd.sym} 90 -130 0 0 {name=l3 lab=GND}
C {devices/code.sym} -710 -530 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
