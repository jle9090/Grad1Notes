intro to hydra and lithiums

where 30db anttenuators - in palo office

user manual of pins and breakout board are different
 why 
 
 ![[Pasted image 20260915110300.png]] what is this?

safe2mate setup, pin orders of Li vs Board, where is this documented

pin diagram of Li2 breakout board?

pins for lithium
![[Pasted image 20260915110906.png]]

pins for the board?
![[Pasted image 20260915110924.png]]

![[Pasted image 20260915110939.png]]
- why 10 pins vs 14 pins vs 6 pins?

Safe2mate tables that do not exist??

UART_From_Li-2 <- what does this mean? and where is CDH UART COONNECTOR

pin 1 is UART_TO_CDH

- how is UART protocol being broken up?

pin layout of the cdh board?

**MCT Notes**

ground are connected
J3, J2 ground, J6 ground

seven volts

commands to send:
`example_noop`
`send_comm_cmd`
`reset_counters`



options:
hydra direclty output commands

to including cdh needs to include cdssds to hardline to cdh

need to sit down with saanika and learn hydra and how to develop it

get a version with and without a csds header

need to reconfigure ports on on cdh board with hydra

verify with a logic analyzer

hydra, cdh side, testing it, build from bottom up
test coming out of computer, does it go into lithium, does it go into cdh etc

look into logic with logic analyzers

