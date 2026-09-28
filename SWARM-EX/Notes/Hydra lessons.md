# Hydra Lessons

- when editing hydra
- all command sin cmd dtails, look at the others
- set a name, decoder
- decoder - steps to take to send out as a command cmdDecoder
- header (what COMMs is concerned with)
- serach and find wher it needs to be changed
- each subsystem has own header
- make own Li2 header etc
- everything in hydra must be named different
  - everything is global ig
- for our commands
  - 3 places too look at
    - cmd details
    - keywords
    - states
- if op codes overlap, bad
  - may need to create a sub directory
- create a dictionaty, li2 opcodes
  - cmd details can say we are using that dictionary
- to send out on different port
  - check serial
  - can copy EPS
  - ccsds, figure out what part 

- commands listed in commands menu
- actual in cmd details 
- opcodes in states
- view -> command -> bit
- going inwards outwards to build up from the op code

CDH code is in
- mplab ide is used for CDH
- can also show on palolab
- is in C
- need to hunt for "put_bytes"
  - is on UART3 and want UART4
  - careful with EPS does not coopoerate well
  - for now, put it on 3
  - leave hydra where it is
  - putting lithium on UART3

ask alex for SWARM EX CDH access
- will then need to flash the board
- change current to UART
- mplab is for the picket
  - picket is used to program the CDH
- todo: take a look at what saanika
- 