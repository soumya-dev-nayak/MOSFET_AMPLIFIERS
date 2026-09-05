v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 160 -60 160 0 {lab=Vin}
N -210 -40 -210 60 {lab=GND}
N -210 60 -80 60 {lab=GND}
N -80 -40 -80 60 {lab=GND}
N -210 -160 -210 -100 {lab=VDD}
N -80 -160 -80 -100 {lab=Vbias}
N 40 -90 120 -90 {lab=Vbias}
N 160 60 160 90 {lab=GND}
N -150 60 -150 100 {lab=GND}
N 160 -130 160 -120 {lab=Vout}
N 160 -240 160 -220 {lab=#net1}
N 160 -160 160 -130 {lab=Vout}
N 160 -150 310 -150 {lab=Vout}
N 280 0 280 90 {lab=GND}
N 280 -150 280 -60 {lab=Vout}
N 160 -360 160 -300 {lab=VDD}
N 160 -90 220 -90 {lab=GND}
N 220 -90 220 80 {lab=GND}
N 220 80 220 90 {lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 140 -90 0 0 {name=M1
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
C {res.sym} 160 -270 0 0 {name=RD
value=8k
footprint=1206
device=resistor
m=1}
C {capa.sym} 280 -30 0 0 {name=CL
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} -210 -70 0 0 {name=VDD value=1.8 savecurrent=false}
C {vsource.sym} -80 -70 0 0 {name=Vbias value=0.9 savecurrent=false}
C {vsource.sym} 160 30 0 0 {name=VSS value=0 savecurrent=false}
C {lab_wire.sym} -210 -160 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -80 -160 0 1 {name=p2 sig_type=std_logic lab=Vbias}
C {lab_wire.sym} 40 -90 0 0 {name=p3 sig_type=std_logic lab=Vbias}
C {gnd.sym} 160 90 0 0 {name=l1 lab=GND}
C {gnd.sym} -150 100 0 0 {name=l2 lab=GND}
C {vsource.sym} 160 -190 0 0 {name=Vcm value=0 savecurrent=false}
C {opin.sym} 310 -150 0 0 {name=p4 lab=Vout}
C {gnd.sym} 280 90 0 0 {name=l3 lab=GND}
C {lab_wire.sym} 160 -360 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {devices/code.sym} -210 -310 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} 380 -350 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* DC ANALYSIS OF THE CIRCUIT
.temp 27
.dc VSS 0 1.8 1m

.control
run

set color0 = white
set color1 = black

plot v(vout) v(vin)
plot i(Vcm)

plot deriv(v(vout)) title 'Gain plot'

.endc
.end

"}
C {gnd.sym} 220 90 0 0 {name=l4 lab=GND}
C {lab_wire.sym} 160 -20 0 0 {name=p6 sig_type=std_logic lab=Vin}
