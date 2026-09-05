v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -270 -40 -270 20 {lab=#net1}
N -640 -20 -640 80 {lab=GND}
N -640 80 -510 80 {lab=GND}
N -510 -20 -510 80 {lab=GND}
N -640 -140 -640 -80 {lab=VDD}
N -510 -140 -510 -80 {lab=Vbias}
N -390 -70 -310 -70 {lab=Vbias}
N -270 80 -270 110 {lab=GND}
N -580 80 -580 120 {lab=GND}
N -270 -110 -270 -100 {lab=Vout}
N -270 -220 -270 -200 {lab=#net2}
N -270 -140 -270 -110 {lab=Vout}
N -270 -130 -120 -130 {lab=Vout}
N -150 20 -150 110 {lab=GND}
N -150 -130 -150 -40 {lab=Vout}
N -270 -340 -270 -280 {lab=VDD}
N -270 -70 -210 -70 {lab=GND}
N -210 -70 -210 100 {lab=GND}
N -210 100 -210 110 {lab=GND}
N -40 -70 40 -70 {lab=GND}
N 80 -110 80 -100 {lab=#net3}
N 80 -220 80 -200 {lab=#net4}
N 80 -140 80 -110 {lab=#net3}
N 160 20 160 110 {lab=GND}
N 160 -130 160 -40 {lab=#net3}
N 80 -340 80 -280 {lab=VDD}
N 260 -130 260 -30 {lab=#net3}
N 200 -130 260 -130 {lab=#net3}
N 260 30 260 110 {lab=GND}
N 80 -40 80 110 {lab=GND}
N 80 -70 120 -70 {lab=GND}
N 120 -70 120 -20 {lab=GND}
N 80 -20 120 -20 {lab=GND}
N 80 -130 200 -130 {lab=#net3}
N -40 -70 -40 -20 {lab=GND}
N -40 -20 80 -20 {lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} -290 -70 0 0 {name=M1
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
C {res.sym} -270 -250 0 0 {name=RD
value=8k
footprint=1206
device=resistor
m=1}
C {capa.sym} -150 -10 0 0 {name=CL
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} -640 -50 0 0 {name=VDD value=1.8 savecurrent=false}
C {vsource.sym} -510 -50 0 0 {name=Vbias value=0.9 savecurrent=false}
C {vsource.sym} -270 50 0 0 {name=VSS value="DC 0 AC 1" savecurrent=false}
C {lab_wire.sym} -640 -140 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -510 -140 0 1 {name=p2 sig_type=std_logic lab=Vbias}
C {lab_wire.sym} -390 -70 0 0 {name=p3 sig_type=std_logic lab=Vbias}
C {gnd.sym} -270 110 0 0 {name=l1 lab=GND}
C {gnd.sym} -580 120 0 0 {name=l2 lab=GND}
C {vsource.sym} -270 -170 0 0 {name=Vcm value=0 savecurrent=false}
C {opin.sym} -120 -130 0 0 {name=p4 lab=Vout}
C {gnd.sym} -150 110 0 0 {name=l3 lab=GND}
C {lab_wire.sym} -270 -340 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {devices/code.sym} -640 -290 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} 340 -350 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* DC ANALYSIS OF THE CIRCUIT
.temp 27
.ac dec 10 1 1Meg

.control
run

*Input Resistance

MEAS AC Iin FIND i(vcm) AT=1K
let Rin = 1/abs(Iin)
print Rin

*Output Resistance

reset

ac dec 10 1 1Meg
run

MEAS AC Iout FIND i(vtest) at=1k
let Rout = 1/abs(Iout)
print Rout
.endc
.end

"}
C {gnd.sym} -210 110 0 0 {name=l4 lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 60 -70 0 0 {name=M2
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
C {res.sym} 80 -250 0 0 {name=RD1
value=8k
footprint=1206
device=resistor
m=1}
C {capa.sym} 160 -10 0 0 {name=CL1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 80 110 0 0 {name=l5 lab=GND}
C {vsource.sym} 80 -170 0 0 {name=Vcm1 value=0 savecurrent=false}
C {gnd.sym} 160 110 0 0 {name=l6 lab=GND}
C {lab_wire.sym} 80 -340 0 0 {name=p9 sig_type=std_logic lab=VDD}
C {vsource.sym} 260 0 0 0 {name=VTEST value="DC 0 AC 1" savecurrent=false}
C {gnd.sym} 260 110 0 0 {name=l8 lab=GND}
