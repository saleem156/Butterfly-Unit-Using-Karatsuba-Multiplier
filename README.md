# Butterfly-Unit-Using-Karatsuba-Multiplier
The main objective of this project is to design an optimized RTL architecture that performs butterfly computations while reducing the multiplication complexity through the Karatsuba multiplication algorithm.

The Butterfly Unit accepts two input data values and a multiplication factor (twiddle factor) and performs the required arithmetic operations to generate two output values. In a typical radix-2 butterfly operation, the inputs are combined with a multiplication operation followed by addition and subtraction:

X = A + (B × W)

Y = A - (B × W)

where A and B are the input operands and W represents the twiddle factor or multiplication coefficient.

Instead of using a conventional multiplier, this design incorporates a Karatsuba multiplier to perform the multiplication of B and W. Karatsuba multiplication divides the input operands into smaller sections and computes the product using three smaller multiplications along with additions and subtractions. This approach can reduce the multiplication complexity and provide an efficient architecture for hardware implementations.

The complete design is written in SystemVerilog RTL and is suitable for synthesis and implementation on FPGA or ASIC platforms. The architecture can be evaluated using parameters such as area, power, operating frequency, latency, and resource utilization. The design can also be extended to support larger operand widths and different butterfly architectures.

Key Features
SystemVerilog RTL implementation
Radix-2 Butterfly Unit architecture
Karatsuba-based multiplication
Addition and subtraction butterfly operations
Suitable for FPGA and ASIC implementation
Reduced multiplication complexity
Scalable operand width
Suitable for pipelined architectures
Compatible with cryptographic and signal-processing applications
Applications

The Butterfly Unit can be used as a building block for FFT processors, NTT accelerators, digital signal processing systems, wireless communication systems, image processing, polynomial multiplication, and hardware cryptographic accelerators.

The combination of a Butterfly Unit and Karatsuba multiplier provides a useful architecture for exploring area-efficient and high-performance arithmetic hardware in modern VLSI systems.
