v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 280 -70 310 -70 {lab=#net1}
N 280 -70 280 -20 {lab=#net1}
N 350 170 350 230 {lab=GND}
N 350 -120 350 -100 {lab=VDD}
N 350 80 500 80 {lab=Vout}
N 470 80 470 120 {lab=Vout}
N 470 180 470 230 {lab=GND}
N 220 230 350 230 {lab=GND}
N 220 220 220 230 {lab=GND}
N 220 140 220 160 {lab=Vin}
N 220 140 310 140 {lab=Vin}
N 350 140 380 140 {lab=GND}
N 380 140 380 180 {lab=GND}
N 350 180 380 180 {lab=GND}
N 350 -70 420 -70 {lab=VDD}
N 100 190 100 230 {lab=GND}
N 100 90 100 130 {lab=VDD}
N 350 -140 350 -120 {lab=VDD}
N 350 60 350 110 {lab=Vout}
N 350 50 350 60 {lab=Vout}
N 350 -40 350 -10 {lab=#net1}
N 280 -20 350 -20 {lab=#net1}
N 350 -120 420 -120 {lab=VDD}
N 420 -120 420 -70 {lab=VDD}
C {devices/code.sym} 40 -90 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {gnd.sym} 350 230 0 0 {name=l1 lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 330 140 0 0 {name=M1
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
C {sky130_fd_pr/pfet_01v8.sym} 330 -70 0 0 {name=M2
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
model=pfet_01v8
spiceprefix=X
}
C {vsource.sym} 350 20 0 0 {name=Vcm value=0 savecurrent=false}
C {capa.sym} 470 150 0 0 {name=CL
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {opin.sym} 500 80 0 0 {name=p1 lab=Vout}
C {gnd.sym} 470 230 0 0 {name=l2 lab=GND}
C {vsource.sym} 220 190 0 0 {name=VG value=0 savecurrent=false}
C {vsource.sym} 100 160 0 0 {name=VDD value=1.8 savecurrent=false}
C {gnd.sym} 100 230 0 0 {name=l3 lab=GND}
C {lab_wire.sym} 100 90 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 350 -140 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {ipin.sym} 220 140 0 0 {name=p4 lab=Vin}
C {simulator_commands_shown.sym} 580 -100 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.temp 27
.dc VG 0 1.8 1m

.control
run

set color0 = white
set color1 = black

plot v(vout)
plot i(vcm)
plot v(vout) v(vin)
let gain =  -deriv(v(vout))
plot gain

* Get VDS at 90uA and 110uA
meas dc vds90 FIND v(vout) WHEN i(vcm)=90u
meas dc vds110 FIND v(vout) WHEN i(vcm)=110u

let rout = -(vds110 - vds90) / (110u - 90u)
print rout

.endc
.end
"}
