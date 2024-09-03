# Project1_C
In this assignment you will implement a Turing Machine (TM) in C.

A TM consists of:

- An infinite tape, divided into cells
- A read/write head which traverses along the tape, capable of reading the current cell, writing a new value in the current cell, and moving left or right
- A state register
- A finite table of instructions which, given the current state of the machine, and the value in the tape cell currently being read, retrieves an instruction which tells the machine to:
   1. Write some (possibly the same) item into the cell
   2. Move the head left or right one cell
   3. Change to some (possibly the same) state
      If you need a refresher on Turing Machines, check out Chapter 5 of the free [Foundations of Computation text](https://math.hws.edu/FoundationsOfComputation/) (or one or any number of resources on the internet).

Our TM tape will be one-way infinite to the right, meaning that the tape has a beginning. In order to let our machine recognize when it reaches the beginning of the tape, you should ensure that the tape begins with the character ‘A’ in its leftmost cell. By convention, we won’t use ‘A’ anywhere else.

A TM tape is made up of cells. Computationally, represent the tape as a linked data structure of cells, wherein a cell (most conveniently represented as a struct) has a character representing what is written in that cell of the tape, and pointers to previous and next cells (think: doubly linked list).

The initial contents of the tape (to be written immediately after the ‘A’ cell) will be provided by an input file. Your program should allocate just enough cells for the input. If you need more cells during processing you should allocate new blank cells on the fly. We’ll establish the convention that a tape cell containing the character ‘B’ is a blank cell.

The read/write head of your TM should be a pointer to some cell of the tape. Begin machine execution with the read/write head pointing to the leftmost cell on the tape (the ‘A’). As you move the read/write head, you will update the pointer to the current cell seen by the read/write head.

The set of instructions will be provided in the input file in the form: (CurrentState,ReadVal)->(WriteVal,MoveDirection,NewState). The first pair represents a configuration of the machine wherein an instruction, the triple after the arrow, should be executed.

In order to represent the instruction table in your program, create a two-dimensional array, where the row indices are states and the columns indices are all standard ASCII characters which may be read from or written to the tape (i.e., there should always be 128 columns, representing ASCII 0-127). Given the current state and the current character being read by the read/write head, the machine looks up an instruction in this array. For example, if the machine is in state 1, reading a ‘B’ from the tape it should access [1][‘B’] in the array. The instruction at that position will tell the machine what value to write, what direction to move, and what the new state should be. (In the below example, this would be to write a ‘B’, move left, and change to state 2). Instructions should be represented using a struct.

Below is a sample input file which adds two unary numbers together. Given an initial tape input of A111B1111B, representing the numbers 3 and 4 separated by a blank, the machine walks to the end of the tape, changing the middle B to a 1, and changing the last 1 to a B. The result is 1111111, unary 7. The program assumes the machine starts at the beginning of the tape (on the ‘A’ cell).
```
A111B1111B
6
0
5
0 A A R 1
1 1 1 R 1
1 B 1 R 2
2 1 1 R 2
2 B B L 3
3 1 B L 4
4 1 1 L 4
4 A A R 5
```
The input file has the following specification:

Line 1: Initial tape content

Line 2: Number of states

Line 3: Start state

Line 4: End state

Remaining lines represent the state machine. Each line is has 5 parts:
CurrentState, ReadVal, WriteVal, MoveDirection, NewState

Remember that your program should work for any input file which represents a Turing Machine in this format, with any number of states.

Your program should begin by asking for a filename for a TM from the user, which it should then load. The TM should then immediately begin execution.

You may use any built-in C library functions in your program, but you must implement the linked data structure yourself. You may not use code found on the internet, from AI sources, etc.

## Simulation in Detail
```Ruby
State 0
A111B1111
^         
Write A, Move R, New State 1
------------
State 1
A111B1111
 ^         
Write 1, Move R, New State 1
------------
State 1
A111B1111
  ^
Write 1, Move R, New State 1
------------
State 1
A111B1111
   ^
Write 1, Move R, New State 1
------------
State 1
A111B1111
    ^
Write 1, Move R, New State 2
------------
State 2
A11111111
     ^
Write 1, Move R, New State 2
------------
State 2
A11111111
      ^
Write 1, Move R, New State 2
------------
State 2
A11111111
       ^
Write 1, Move R, New State 2
------------
State 2
A11111111
        ^
Write 1, Move R, New State 2
------------
State 2
A11111111B
         ^
Write B, Move L, New State 3
------------
State 3
A11111111B
        ^
Write B, Move L, New State 4
------------
State 4
A1111111BB
       ^
Write 1, Move L, New State 4
------------
State 4
A1111111BB
      ^
Write 1, Move L, New State 4
------------
State 4
A1111111BB
     ^
Write 1, Move L, New State 4
------------
State 4
A1111111BB
    ^
Write 1, Move L, New State 4
------------
State 4
A1111111BB
   ^
Write 1, Move L, New State 4
------------
State 4
A1111111BB
  ^
Write 1, Move L, New State 4
------------
State 4
A1111111BB
 ^
Write 1, Move L, New State 4
------------
State 4
A1111111BB
^
Write A, Move R, New State 5
------------
State 5
A1111111BB
 ^
Halt.
```
## Notes and Tips
Be sure to put your name at the top of your source file.

If you’re careful, you can use fscanf for reading from the input file. Better would be fgets then sscanf.

Remember to differentiate between characters representing numbers (e.g., ‘1’) and numbers themselves (e.g., 1).

A nice debug output like my above simulation will make your debugging job a lot easier. You should also look into how to use the visual debugger in your IDE of choice.
## Suggested Development Environment
CLion (free for students)
