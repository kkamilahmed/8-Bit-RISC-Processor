# 8-Bit RISC Processor

**8-Bit RISC Processor** is a simple, general-purpose processor implemented in **VHDL** and deployed on an **Altera FPGA board**.  
It integrates a complete processor pipeline including an **ALU**, **register file**, **control unit**, **decoder**, and **storage elements**, capable of performing arithmetic and logical operations in real-time.

---

## Objective

The goal of this project was to design, simulate, and implement a simple 8-bit processor, allowing hands-on understanding of:

- Arithmetic Logic Unit (ALU) design  
- Control unit and microprogram sequencing  
- Register and latch storage elements  
- Synchronous upcounters and decoders  
- Full processor integration on FPGA with LED and switch I/O

---

## Features

- **ALU Core**  
  Performs eight functions (ADD, SUB, NOT, NAND, NOR, AND, OR, XOR) on two 8-bit operands.  
  Controlled via 8-bit operation select signals (microcode).  

- **Control Unit**  
  Includes a **synchronous upcounter** and **3-to-8 decoder** to select ALU operations sequentially.  

- **Storage Elements / Latches**  
  Temporarily store input operands (A and B) and release data to the ALU on strobe signals.  

- **3-Stage Pipeline**  
  Fetch → Decode → Execute stages for instruction execution.  

- **FPGA Deployment**  
  - Inputs: DIP switches (SW0–SW15)  
  - Outputs: LED display (LEDG0–LEDG7)  
  - Clock control via push-button, reset via toggle switch  

---

## System Architecture

```mermaid
flowchart TD
    A_Input[DIP Switches A 7 to 0]
    B_Input[DIP Switches B 7 to 0]
    Latches[Latches / Storage Elements]
    ALU[ALU Core]
    Decoder[3-to-8 Decoder]
    UpCounter[Synchronous Upcounter]
    Control[Control Unit / Microcode]
    LED_Output[LED Display]

    A_Input --> Latches
    B_Input --> Latches
    Latches --> ALU
    UpCounter --> Decoder
    Decoder --> Control
    Control --> ALU
    ALU --> LED_Output

