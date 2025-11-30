# 🔢 Seven Segment Decoder — FPGA (Verilog)

### Terasic DE10-Standard • Quartus Prime • Computer Architecture Lab

## 📘 Overview

This project implements a **Seven-Segment Decoder** using Verilog and deployed on the **Terasic DE10-Standard FPGA board**.  
The decoder accepts a **4-bit binary input (0–9)** and outputs the appropriate **7-segment display pattern** for a common-cathode HEX display.

This work is part of the **Computer Architecture** module in the **ITI (Information Technology Institute), Egypt — Telco-Cloud Track**.

* * *

## 🧠 Features

-   Hexadecimal **Seven-Segment Decoder**
    
-   Supports digits **0 → 9**
    
-   Clean and readable **Verilog implementation**
    
-   Full **testbench** for ModelSim simulation
    
-   Quartus Prime project included
    
-   Works on **DE10-Standard FPGA board**
    

* * *

## 📂 Project Structure

```
seven_segment/
│
├── seven.v                 # Verilog: seven-segment decoder module
├── seven_tb.v              # Verilog: testbench module
│
├── quartus/                # Quartus Prime project files
├── pinplanning/            # Pin assignment files
├── work/                   # ModelSim work directory
│
├── seven_segment.mpf       # ModelSim project file
├── seven_segment.cr.mti    # Simulation record file
└── vsim.wlf                # Waveform file (ModelSim)
```

* * *

## 🧩 Verilog Module (`seven.v`)

```verilog
module seven_segment (
    input  wire [3:0] num,
    output reg  [6:0] seg
);

// seg = {a,b,c,d,e,f,g} for HEX display (common-cathode)
always @(*) begin
    case (num)
        4'd0: seg = 7'b0000001;
        4'd1: seg = 7'b1001111;
        4'd2: seg = 7'b0010010;
        4'd3: seg = 7'b0000110;
        4'd4: seg = 7'b1001100;
        4'd5: seg = 7'b0100100;
        4'd6: seg = 7'b0100000;
        4'd7: seg = 7'b0001111;
        4'd8: seg = 7'b0000000;
        4'd9: seg = 7'b0000100;

        default: seg = 7'b1111111;  // blank
    endcase
end

endmodule
```

* * *

## 🧪 Testbench (`seven_tb.v`)

```verilog
module seven_segment_tb;

    wire [6:0] seg;
    reg  [3:0] num;

    seven_segment uut (
        .num(num),
        .seg(seg)
    );
    
    initial begin
        num = 0; #10;
        num = 1; #10;
        num = 2; #10;
        num = 3; #10;
        num = 4; #10;
        num = 5; #10;
        num = 6; #10;
        num = 7; #10;
        num = 8; #10;
        num = 9; #10;
    end

endmodule
```


## 💡 Building on Quartus Prime

1.  Open **Quartus Prime**
    
2.  Create a new project OR open the included `/quartus` directory
    
3.  Add `seven.v` to the project’s source files
    
4.  Apply pin assignments from the `/pinplanning` folder
    
5.  Compile the design
    
6.  Upload to the FPGA using the **Programmer Tool**
    

* * *

## 📟 Seven-Segment Mapping

The output order is:

```
seg = {a, b, c, d, e, f, g}
```

Example mapping:

| Digit | Binary Output | Segments ON       |
|-------|---------------|--------------------|
| 3     | 0000110       | a, b, c, d, g      |
| 8     | 0000000       | all segments ON    |


* * *

## 👤 About Me

**Eslam Mohamed**  
AI & Telecommunications Enthusiast  
Communication & Electronics Engineer  
ITI — **Teleco-Cloud Track Trainee**  

* * *

## 🚀 Future Improvements

-   Expand to **full HEX decoding (0–F)**
    
-   Multi-digit display
    
-   Add enable pin support
    
-   Debounce hardware buttons
    
-   Implement as a reusable IP module
    

* * *

## 📬 Contact

-   **GitHub:** (https://www.linkedin.com/in/eslam-ragaei/)
    
* * *
## 📄 License — All Rights Reserved  
  
Copyright (c) 2025 Eslam Mohamed    
All Rights Reserved.  
  
This repository and its contents are provided for \*\*viewing and educational reference only\*\*.    
No part of this project may be:  
  
- copied    
- reproduced    
- modified    
- distributed    
- used in a commercial or non-commercial project    
  
without \*\*explicit written permission\*\* from the author.  
  
For permission requests, please contact:    
(https://www.linkedin.com/in/eslam-ragaei/)
* * *