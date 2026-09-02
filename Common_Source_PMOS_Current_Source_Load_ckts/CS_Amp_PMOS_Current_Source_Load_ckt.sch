v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -50 -190 -50 -140 {lab=VDD}
N -50 -190 120 -190 {lab=VDD}
N 120 -190 120 -140 {lab=VDD}
N 120 30 120 40 {lab=#net1}
N -50 100 -50 130 {lab=GND}
N -50 130 120 130 {lab=GND}
N 120 100 120 130 {lab=GND}
N 40 130 40 160 {lab=GND}
N -50 70 120 70 {lab=GND}
N 40 70 40 130 {lab=GND}
N -10 -110 80 -110 {lab=#net2}
N 40 -110 40 -60 {lab=#net2}
N -50 -60 40 -60 {lab=#net2}
N -330 60 -330 130 {lab=GND}
N -330 130 -220 130 {lab=GND}
N -220 60 -220 130 {lab=GND}
N -330 -80 -330 0 {lab=Vb}
N -220 -80 -220 0 {lab=Vin}
N -430 60 -430 130 {lab=GND}
N -430 130 -330 130 {lab=GND}
N -430 -80 -430 0 {lab=VDD}
N -330 130 -330 160 {lab=GND}
N 160 70 220 70 {lab=Vin}
N -140 70 -90 70 {lab=Vb}
N 40 -230 40 -190 {lab=VDD}
N -90 -110 -50 -110 {lab=VDD}
N -90 -150 -90 -110 {lab=VDD}
N -90 -150 -50 -150 {lab=VDD}
N 120 -110 160 -110 {lab=VDD}
N 160 -150 160 -110 {lab=VDD}
N 120 -150 160 -150 {lab=VDD}
N -50 10 -50 40 {lab=#net3}
N -50 -80 -50 -50 {lab=#net2}
N 120 10 120 30 {lab=#net1}
N 120 -80 120 -50 {lab=Vout}
N 120 -60 240 -60 {lab=Vout}
N 240 -60 300 -60 {lab=Vout}
N 270 -60 270 0 {lab=Vout}
N 270 60 270 150 {lab=GND}
N 270 150 270 160 {lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} -70 70 0 0 {name=M1
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
C {sky130_fd_pr/pfet_01v8_lvt.sym} -30 -110 0 1 {name=M2
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
C {sky130_fd_pr/pfet_01v8_lvt.sym} 100 -110 0 0 {name=M3
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
C {gnd.sym} 40 160 0 0 {name=l1 lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 140 70 0 1 {name=M4
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
C {vsource.sym} -330 30 0 0 {name=Vb value=0.9 savecurrent=false}
C {vsource.sym} -220 30 0 0 {name=Vin value=0 savecurrent=false}
C {lab_wire.sym} -330 -80 0 0 {name=p1 sig_type=std_logic lab=Vb}
C {vsource.sym} -430 30 0 0 {name=VDD value=1.8 savecurrent=false}
C {lab_wire.sym} -430 -80 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -220 -80 0 0 {name=p3 sig_type=std_logic lab=Vin}
C {gnd.sym} -330 160 0 0 {name=l2 lab=GND}
C {lab_wire.sym} -140 70 0 0 {name=p5 sig_type=std_logic lab=Vb}
C {lab_wire.sym} 40 -230 0 0 {name=p6 sig_type=std_logic lab=VDD}
C {vsource.sym} -50 -20 0 0 {name=Vcm1 value=0 savecurrent=false}
C {vsource.sym} 120 -20 0 0 {name=Vcm2 value=0 savecurrent=false}
C {simulator_commands_shown.sym} 370 -250 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.temp 27
.dc Vin 0 1.8 1m

.control
run

set color0 = white
set color1 = black

plot v(vin) v(vout)
plot v(vout)
plot i(Vcm2)
plot i(Vcm1) i(Vcm2)

let gain = -deriv(v(vout))
plot gain 

plot i(vcm2) vs v(vout)

*Rout Finding 

meas dc id04 FIND i(Vcm2) WHEN v(Vout) = 0.4
meas dc id05 FIND i(Vcm2) WHEN v(vout) = 0.5

let rout = (0.5-0.4)/(id04-id05)

echo *Rout Value*
print rout

.endc
.end


"}
C {opin.sym} 300 -60 0 0 {name=p7 lab=Vout}
C {capa.sym} 270 30 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {ipin.sym} 220 70 1 1 {name=p8 lab=Vin}
C {gnd.sym} 270 160 0 0 {name=l3 lab=GND}
C {devices/code.sym} -400 -230 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
