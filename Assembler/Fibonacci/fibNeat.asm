# Initialize
MOV R0, 128         # Move 0x80 to R0
MOV R1, 0           # Move 0 to R1
LDR R0, R1, R0      # Get the program counter
MOV R2, 0           # Value in Memory to write to
MOV R3, 1           # Value to add/sub every iteration

# Edge Cases (n = 0 or 1)
SUB R1, R0, R1      # Check to see if value is F(0)
BNE 3               # If Not Equal, skip next three instructions
MOV R1, 0           # Move 0 to R1
STR R1, R2, R1      # Store Value
HALT                # End program

MOV R1, 1           # Move 1 to R1
SUB R1, R0, R1      # Check to see if value is F(0)
BNE 5               # If Not Equal skip next 5 instructions
MOV R1, 0           # Move value F(0) to R1
STR R1, R2, R1      # Store value
MOV R1, 1           # Move F(1) to R1
STR R1, R1, R2      # Store F(1) at address (1)
HALT                # End Program

# Reinitialize values
MOV R0, 128         # Move 0x80 to R0
MOV R1, 0           # Move F(0) to R1
LDR R0, R1, R0      # Get the program counter
MOV R2, 0           # Value in Memory to write to
MOV R3, 1           # Value to add/sub every iteration
STR R1, R2, R2      # Initalize F(0) and F(1) in memory
ADD R1, R1, R3      # Compute F(1)
STR R1, R2, R3      # Store F(0) at address 1
MOV R2, 1           # Most Recent Fib value
MOV R3, 1           # Value to add/sub every iteration
MOV R4, 0           # Zero register
SUB R0, R0, R3      # Decrement R0 by 1 (we've computed F(1))

# Iteration
LDR R5, R2, R4      # Load F(n) at Address R2
SUB R6, R2, R3      # Compute n-1
LDR R6, R6, R4      # Get F(n-1)
ADD R1, R5, R6      # Compute Fib Value
ADD R2, R2, R3      # Update Memory Address
STR R1, R2, R4      # Store Fib Value
SUB R0, R0, R3      # Decrease R0
BEQ 1               # If R0 is 0, skip next instruction
B -9                # Otherwise, iterate
HALT
