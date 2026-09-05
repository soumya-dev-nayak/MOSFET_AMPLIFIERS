v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 100 -70 100 -20 {lab=vin}
N 100 -70 160 -70 {lab=vin}
N 200 -40 200 80 {lab=GND}
N 100 40 100 80 {lab=GND}
N 100 80 200 80 {lab=GND}
N 200 -70 230 -70 {lab=GND}
N 230 -70 230 -10 {lab=GND}
N 200 -10 230 -10 {lab=GND}
N -40 40 -40 70 {lab=GND}
N -40 -80 -40 -20 {lab=Vdd}
N 200 -120 200 -100 {lab=vout}
N 200 -200 200 -180 {lab=#net1}
N 200 -280 200 -260 {lab=Vdd}
N 200 -110 330 -110 {lab=vout}
N 310 -110 310 -70 {lab=vout}
N 200 80 310 80 {lab=GND}
N 310 -10 310 80 {lab=GND}
C {devices/code.sym} -280 -50 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {sky130_fd_pr/nfet_01v8.sym} 180 -70 0 0 {name=M1
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
C {res.sym} 200 -230 0 0 {name=Rd
value=8k
footprint=1206
device=resistor
m=1}
C {vsource.sym} 100 10 0 0 {name=V1 value=0 savecurrent=false}
C {gnd.sym} 200 80 0 0 {name=l1 lab=GND}
C {vsource.sym} -40 10 0 0 {name=V2 value=1.8 savecurrent=false}
C {lab_wire.sym} -40 -80 0 0 {name=p1 sig_type=std_logic lab=Vdd}
C {gnd.sym} -40 70 0 0 {name=l2 lab=GND}
C {lab_wire.sym} 200 -280 0 0 {name=p2 sig_type=std_logic lab=Vdd}
C {vsource.sym} 200 -150 0 0 {name=Vcm value=0 savecurrent=false}
C {simulator_commands_shown.sym} 430 -210 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* DC Analysis Simulation
.dc v1 0 1.8 1m

.control
run

*Setting the color scale
set color0 = white
set color1 = black

*VTC
plot v(vin) v(vout)
plot i(vcm) title 'Drain current'

let gain = -deriv(v(vout))
plot gain title 'Gain plot'

* Get VDS at 90uA and 110uA
meas dc vds90 FIND v(vout) WHEN i(vcm)=90u
meas dc vds110 FIND v(vout) WHEN i(vcm)=110u

let rout = -(vds110 - vds90) / (110u - 90u)
print rout

.endc
.end

"}
C {opin.sym} 330 -110 0 0 {name=p3 lab=vout}
C {capa.sym} 310 -40 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {ipin.sym} 100 -70 0 0 {name=p4 lab=vin}
