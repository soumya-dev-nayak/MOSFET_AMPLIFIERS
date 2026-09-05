v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -340 120 -340 180 {lab=Vin}
N -710 140 -710 240 {lab=GND}
N -710 240 -580 240 {lab=GND}
N -580 140 -580 240 {lab=GND}
N -710 20 -710 80 {lab=VDD}
N -580 20 -580 80 {lab=Vbias}
N -460 90 -380 90 {lab=Vbias}
N -340 240 -340 270 {lab=GND}
N -650 240 -650 280 {lab=GND}
N -340 50 -340 60 {lab=Vout}
N -340 -60 -340 -40 {lab=#net1}
N -340 20 -340 50 {lab=Vout}
N -340 30 -190 30 {lab=Vout}
N -220 180 -220 270 {lab=GND}
N -220 30 -220 120 {lab=Vout}
N -340 -180 -340 -120 {lab=VDD}
N -340 90 -280 90 {lab=GND}
N -280 90 -280 260 {lab=GND}
N -280 260 -280 270 {lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} -360 90 0 0 {name=M1
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
C {res.sym} -340 -90 0 0 {name=RD
value=8k
footprint=1206
device=resistor
m=1}
C {capa.sym} -220 150 0 0 {name=CL
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} -710 110 0 0 {name=VDD value=1.8 savecurrent=false}
C {vsource.sym} -580 110 0 0 {name=Vbias value=0.9 savecurrent=false}
C {vsource.sym} -340 210 0 0 {name=VSS value="DC 0 AC 1" savecurrent=false}
C {lab_wire.sym} -710 20 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -580 20 0 1 {name=p2 sig_type=std_logic lab=Vbias}
C {lab_wire.sym} -460 90 0 0 {name=p3 sig_type=std_logic lab=Vbias}
C {gnd.sym} -340 270 0 0 {name=l1 lab=GND}
C {gnd.sym} -650 280 0 0 {name=l2 lab=GND}
C {vsource.sym} -340 -10 0 0 {name=Vcm value=0 savecurrent=false}
C {opin.sym} -190 30 0 0 {name=p4 lab=Vout}
C {gnd.sym} -220 270 0 0 {name=l3 lab=GND}
C {lab_wire.sym} -340 -180 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {devices/code.sym} -710 -130 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} -120 -170 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* DC ANALYSIS OF THE CIRCUIT
.temp 27
.ac dec 100 1 50G

.control
run

set color0 = white
set color1 = black

*Plotting the Voltages and Current
plot v(vout)
plot i(vcm)

*Plotting the Gain & Phase
let gain_db = db(v(vout))
let phase = ph(vout) * (180/pi)

plot gain_db
plot phase

MEAS ac UGB when gain_db = 0

*Finding the Pole Frequency
let A0 = gain_db[0]
let A3dB = A0 - 3

MEAS ac Pole_Freq WHEN gain_db = A3dB

*Finding the ZERO FREQUENCY
let slope = deriv(gain_db) * frequency * ln(10)
plot slope
MEAS AC Zero_Freq WHEN slope = -10 CROSS = 2

.endc
.end

"}
C {gnd.sym} -280 270 0 0 {name=l4 lab=GND}
C {lab_wire.sym} -340 160 0 0 {name=p6 sig_type=std_logic lab=Vin}
