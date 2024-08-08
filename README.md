# NASM Codegolf

Write an Intel x86 assembly program using [NASM](https://de.wikipedia.org/wiki/Netwide_Assembler) that returns an ASCII compass.
The goal is minimize the resulting ELF binary size of the program.
The source code in `main.s` already works and compiles to `main`.

## Expected output

The template for the output is provided in `compass.txt`. The program is passed
a digit (ASCII) between 0 and 7. The numbers stand for directions:

- 0: North
- 1: Northeast
- 2: East
- 3: Southeast
- 4: South
- 5: Southwest
- 6: West
- 7: Northwest

The expected output for all those directions can be found in `expected.txt`.

Example:

    $ ./main 3
       _N_
      /   \
    W|  .  |E
     |   \ |
      \_ _/
        S

## Constraints

- The code needs to be written in 32 bit Intel (x86) assembly (NASM syntax).
- No library calls are allowed, use syscalls instead

## Verification

Build the binary using `Make`.

    $ make
    nasm -f elf32 -O0 main.s
    ld -m elf_i386 -s -O0 -o main main.o

Run the test script with Python 2:

    $ python2 test.py
    Success!
    Binary size is 460 bytes.

## Debugging

If you want a binary with debug symbols included, use the `debug` Make target:

    $ make debug
    nasm -f elf32 -g -O0 main.s
    ld -m elf_i386 -O0 -o debug main.o
    $ gdb ./debug
    (gdb) ...

### Important gdb commands

    break _start
    run
    disass
    i r
    ni


## Docker

There's a Dockerfile you can use to run this in isolation

```sh
docker build -t codegolf .
docker run -v .:/code -it codegolf bash
```
