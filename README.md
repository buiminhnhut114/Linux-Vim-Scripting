# PULPissimo

## Citing
If you are using the PULPissimo IPs for an academic publication, please cite the following paper:

```
@INPROCEEDINGS{8640145,
  author={Schiavone, Pasquale Davide and Rossi, Davide and Pullini, Antonio and Di Mauro, Alfio and Conti, Francesco and Benini, Luca},
  booktitle={2018 IEEE SOI-3D-Subthreshold Microelectronics Technology Unified Conference (S3S)}, 
  title={Quentin: an Ultra-Low-Power PULPissimo SoC in 22nm FDX}, 
  year={2018},
  volume={},
  number={},
  pages={1-3},
  doi={10.1109/S3S.2018.8640145}}
```

![](doc/pulpissimo_archi.png)

PULPissimo is the microcontroller architecture of the more recent PULP chips,
part of the ongoing "PULP platform" collaboration between ETH Zurich and the
University of Bologna - started in 2013.

PULPissimo, like PULPino, is a single-core platform. However, it represents a
significant step ahead in terms of completeness and complexity with respect to
PULPino - in fact, the PULPissimo system is used as the main System-on-Chip
controller for all recent multi-core PULP chips, taking care of autonomous I/O,
advanced data pre-processing, external interrupts, etc.
The PULPissimo architecture includes:

- Either the RI5CY core or the Ibex one as main core
- Autonomous Input/Output subsystem (uDMA)
- New memory subsystem
- Support for Hardware Processing Engines (HWPEs)
- New simple interrupt controller
- New peripherals
- New SDK

RISCY is an in-order, single-issue core with 4 pipeline stages and it has
an IPC close to 1, full support for the base integer instruction set (RV32I),
compressed instructions (RV32C) and multiplication instruction set extension
(RV32M). It can be configured to have single-precision floating-point
instruction set extension (RV32F). It implements several ISA extensions
such as: hardware loops, post-incrementing load and store instructions,
bit-manipulation instructions, MAC operations, support fixed-point operations,
packed-SIMD instructions and the dot product. It has been designed to increase
the energy efficiency of in ultra-low-power signal processing applications.
RISCY implementes a subset of the 1.10 privileged specification.
It includes an optional PMP and the possibility to have a subset of the USER MODE.
RISCY implement the RISC-V Debug spec 0.13.
Further information about the core can be found at
http://ieeexplore.ieee.org/abstract/document/7864441/
and in the documentation of the IP.

Ibex, formely Zero-riscy, is an in-order, single-issue core with 2 pipeline
stages. It has full support for the base integer instruction set (RV32I
version 2.1) and compressed instructions (RV32C version 2.0).
It can be configured to support the multiplication instruction set extension
(RV32M version 2.0) and the reduced number of registers extension (RV32E
version 1.9). Ibex implementes the Machine ISA version 1.11 and has RISC-V
External Debug Support version 0.13.2. Ibex has been originally designed at
ETH to target ultra-low-power and ultra-low-area constraints. Ibex is now
maintained and further developed by the non-for-profit community interest
company lowRISC. Further information about the core can be found at
http://ieeexplore.ieee.org/document/8106976/
and in the documentation of the IP at
https://ibex-core.readthedocs.io/en/latest/index.html

PULPissimo includes a new efficient I/O subsystem via a uDMA (micro-DMA) which
communicates with the peripherals autonomously. The core just needs to program
the uDMA and wait for it to handle the transfer.
Further information about the core can be found at
http://ieeexplore.ieee.org/document/8106971/
and in the documentation of the IP.

PULPissimo supports I/O on interfaces such as:

- SPI (as master)
- I2S
- Camera Interface (CPI)
- I2C
- UART
- Hyperbus
- JTAG

PULPissimo also supports integration of hardware accelerators (Hardware
Processing Engines) that share memory with the RI5CY core and are programmed on
the memory map. An example accelerator, performing multiply-accumulate on a
vector of fixed-point values, can be found in `ips/hwpe-mac-engine` (after
updating the IPs: see below in the Getting Started section).
The `ips/hwpe-stream` and `ips/hwpe-ctrl` folders contain the IPs necessary to
plug streaming accelerators into a PULPissimo or PULP system on the data and
control plane.
For further information on how to design and integrate such accelerators,
see `ips/hwpe-stream/doc` and https://arxiv.org/abs/1612.05974.

## Documentation

- The [datasheet](doc/datasheet/datasheet.pdf) contains details about Memory Map, Peripherals, Registers etc. This may not be fully up-to-date.
- PULPissimo was presented at the Week of Open Source Hardware (WOSH) 2019 at ETH Zurich.
  - [Slides](https://pulp-platform.org/docs/riscv_workshop_zurich/schiavone_wosh2019_tutorial.pdf)
  - [Video](https://www.youtube.com/watch?v=27tndT6cBH0)

## Getting Started
We provide a [simple runtime](#simple-runtime) and a [full featured
runtime](#software-development-kit) for PULPissimo. We recommend you try out
first the minimal runtime and when you hit its limitations you can try the full
runtime by installing the SDK.

After having chosen a runtime you can run software by either [simulating the
hardware](#building-the-rtl-simulation-platform) or running it in a [software
emulation](#building-and-using-the-virtual-platform).

### Prerequisites
PULPissimo is a Microcontroller provided in SystemVerilog RTL description. As such,
it can be used and evaluated with many different tools. Out of the box, we provide Makefile
targets for RTL simulation with Mentor Questa SIM (Intel/Altera Modelsim is not supported at the moment)
and Cadence Xcelium. Being purely written in SystemVerilog, in theory the whole design can be simulated 
with any RTL simulator with (deccent!) SystemVerilog support. While an open source simulation target is 
definitely on our wish- and todo-list (e.g. out-of-the box support for Verilator), this currently
still requires more extensive modifications to the RTL and scripts.

For FPGA implementation (see [FPGA Section](#FPGA)) we generate ready-made scripts for Synthesis and Implementation 
for Xilinx Vivado for a number of different development boards.

### Simple Runtime
The simple runtime is here to get you started quickly. Using it can run and
write programs that don't need any advanced features.

The toolchain is in the same level as pulpenix directory

installed (either by compiling it or using one of the binary releases under
available under the release tab) and point `PULP_RISCV_GCC_TOOLCHAIN` to it:

```bash
export PULP_RISCV_GCC_TOOLCHAIN=YOUR_PULP_TOOLCHAIN_PATH
```
Add the pulp-toolchain to your PATH variable:

```bash
export PATH=$PULP_RISCV_GCC_TOOLCHAIN/bin:$PATH
```


The simple runtime supports many different hardware configurations. We want PULPissimo.

Then, to use the CV32E40P (formely RI5CY) core, type:

```bash
source sw/pulp-runtime/configs/pulpissimo_cv32.sh
```

### Building the RTL simulation platform
Note you need Questasim or Xcelium to do an RTL simulation of PULPissimo
(verilator support planned, but not finished). Intel Modelsim for Intel FPGAs
does *not* work.

To build the RTL simulation platform, start by getting the latest version of the
IPs composing the PULP system:

```bash
make build
```
This command builds a version of the simulation platform with no dependencies on
external models for peripherals. See below (Proprietary verification IPs) for
details on how to plug in some models of real SPI, I2C, I2S peripherals.

For more advanced usage have a look at `./utils/bin/bender --help` for bender.


Also check out the output of `make help` for more useful Makefile targets.


### Downloading and running examples

Now you can change directory to your favourite test e.g.: for an hello world
test for the SDK, run
```bash
cd ../
git clone https://github.com/pulp-platform/pulp-rt-examples.git
cd pulp-rt-examples/hello
make clean all run
```
