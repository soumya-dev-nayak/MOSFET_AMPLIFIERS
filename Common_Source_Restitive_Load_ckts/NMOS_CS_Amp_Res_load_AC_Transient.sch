v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -200 -90 -200 -40 {lab=vin}
N -200 -90 -140 -90 {lab=vin}
N -100 -60 -100 60 {lab=GND}
N -200 20 -200 60 {lab=GND}
N -200 60 -100 60 {lab=GND}
N -100 -90 -70 -90 {lab=GND}
N -70 -90 -70 -30 {lab=GND}
N -100 -30 -70 -30 {lab=GND}
N -340 20 -340 50 {lab=GND}
N -340 -100 -340 -40 {lab=Vdd}
N -100 -140 -100 -120 {lab=vout}
N -100 -220 -100 -200 {lab=#net1}
N -100 -300 -100 -280 {lab=Vdd}
N -100 -130 30 -130 {lab=vout}
N 10 -130 10 -90 {lab=vout}
N -100 60 10 60 {lab=GND}
N 10 -30 10 60 {lab=GND}
C {devices/code.sym} -580 -70 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {sky130_fd_pr/nfet_01v8.sym} -120 -90 0 0 {name=M1
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
C {res.sym} -100 -250 0 0 {name=Rd
value=8k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -200 -10 0 0 {name=V1 value="dc 0.835 ac 1 sin(0.835 1m 1k)" savecurrent=false}
C {gnd.sym} -100 60 0 0 {name=l1 lab=GND}
C {vsource.sym} -340 -10 0 0 {name=V2 value=1.8 savecurrent=false}
C {lab_wire.sym} -340 -100 0 0 {name=p1 sig_type=std_logic lab=Vdd}
C {gnd.sym} -340 50 0 0 {name=l2 lab=GND}
C {lab_wire.sym} -100 -300 0 0 {name=p2 sig_type=std_logic lab=Vdd}
C {vsource.sym} -100 -170 0 0 {name=Vcm value=0 savecurrent=false}
C {simulator_commands_shown.sym} 110 -230 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* AC Transient Analysis Simulation
.tran 10n 5m

.control
run

*Setting the color scale
set color0 = white
set color1 = black

plot i(vcm) title 'Drain current'
plot v(vin) v(vout)
plot v(vin)
plot v(vout)

.endc
.end

"}
C {opin.sym} 30 -130 0 0 {name=p3 lab=vout}
C {capa.sym} 10 -60 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {ipin.sym} -200 -90 0 0 {name=p4 lab=vin}
