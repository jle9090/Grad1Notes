# Program details
- lasp was 10 years ago, gnu sucked
- GNU
	- doing everything visually, the flowgraph is harder for other tools to work with, like codex or claude or just scripting
- back to basics, know signal strucutre of lithium, do a clean sheet re implement but with GNU libraries 
	- GNU builds flowgraph, GNU opens companion etc, run will auto generate the python code
		- all blocks are just python functions
		- skip in between to use python functins
- based on a clean design doing the same things
- using venvs
	- anaconda different way of doing something
	- radioconda has the gnu libraries and configs etc... install it with 1 or 2 commands
- just opens up network ports to connect to....
- hydra is still the same
	- BUT
	- we dont have core source code of this
	- rainville also has a text view of everything version
	- there is a quick and dirty version, may end up using that
- we were added to repo, can use to poke around at...


# Doppler and sat tracking
- if no GNU... then how can this be implemnted
- want to control the center frequency based on doppler
	- right now this has been only been tested on bench, no doppler correction
	- just has a very wide front end
		- 40 kHz band, lock on to that....assuming lithium has wide front end
		- Gpredict can give doppler shift...
		- TLEs from celestrak, or other TLE programs, does orbital calculations to get elev and az of different sats, define where Ground statoin is, gpredict assumes transmits at 100 MHz, from that gives a doppler shift value with that assumption, and range rate from satellite.
		- this can then be given back to us
	- how data come out of gpredict?
		- can have this program open up another port and have gpredict feed in
		- gpredict had a gnublock for doppler corrections, 
		- need to find the interface in gpredict to how to export stuff, block or with another network port is also chill
	- `--tx-follow-doppler`
		- note that the clock on the radio is not that good, something to also keep in mind
		- follow the offset or the clock.... `--tx-follow-offset`

li2 ground software
speicifc - li2demod

name tbd