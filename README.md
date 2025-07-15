# COSC273 Computer Organization and Architecture Assignments

This repository contains programming assignments completed for my Computer Organization and Architecture course. The programs are written in Assembly language and demonstrate key concepts such as user input handling, string manipulation, data structures, and arithmetic operations.


## 📂 Folder Structure

Each folder corresponds to a specific assignment:

### `Assignment2/`
A program that prompts the user for various inputs, performs calculations based on those inputs, and generates a unique username using the input data.

### `Assignment3/`
A program that:
- Accepts a word and a number `X` from the user, then prints the word `X` times.
- Then requests three space-separated integers, and outputs both the original and sorted list of those numbers.

### `Assignment4/`
*To be updated soon.*

### `Assignment5/`
A program that uses structures to store and process information for two students. It calculates:
- Total and current credit hours
- GPA
- Additional metrics derived from the student data

## 🚀 How to Run

These programs are written for the x86 architecture and were run using a remote connection to a compatible x86 machine.

To assemble and execute any of the assignments, follow these general steps (assuming you have cloned/forked this repo):

1. **Connect to the x86 machine** (e.g., via SSH or a virtual lab environment provided by your course).

2. **Navigate to the assignment directory**:
   ```bash
   cd Assignment2  # or Assignment3, Assignment5, etc.
3. **Assemble the program** using NASM:
    ```bash
    nasm -f elf32 program.asm -o program.o
4. **Link the object file** to produce an executable:
    ```bash
    ld -m elf_i386 -o program program.o
5. **Run the program:**
    ```bash
    ./program

⚠️ Ensure the file names match your .asm files, and that the x86 environment has both nasm and ld installed. If using system calls, ensure the Assembly code is compatible with Linux system conventions for x86 (32-bit).

## 📝 Notes

- Each program I designed for educational purposes and aimed to reinforce my low-level programming and architectural understanding.

- Comments in the source files explain key logic and function.

- All programs were tested on a 32-bit Linux x86 environment.

