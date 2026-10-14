Last updated: 2026-10-14

## How to use this file

- Check a box `[x]` when the item is done.
- Tag `#blocked` on anything stuck, with a short reason after it (e.g. `#blocked waiting on Steven Harrison`).
- Tag `#in-progress` on anything actively being worked.
- Leave unchecked + untagged for anything not yet started.
- Owner in `()` after the item where known. Add one when you pick something up.
- Pull new items in here as they come up in meetings instead of leaving them buried in meeting notes — this file is the single source of truth for open work.

---

## This week (10/12–10/18)

### Done since last update (10/5)
- MCT re-run complete — ran Thu 10/8 with Saanika, commands acknowledged through Hydra → CDH → Li-2
	- Root cause of the CDH command-byte issue: UART port on the CDH board had TX/RX swapped on the FTDI
	- MCT test documentation recorded and updated
- Li-2 flight cabling summary compiled (10/7) — [[Li-2_Flight_Cabling_Summary]]
- Quad chart + waterfall updated (10/9)
- Started SCT-1 test doc review (2 hrs logged)

- Saanika review of MCT done
- Contacted Skye Glasner
- Contacted Scott Gennari (LASP ground station expert) about antenna raising and the motor interface issues

### Focus this week
- [ ] SCT-1: finish doc review, Hydra development for SCT-1 (Gantt: 10/9–10/15), bench setup (Gantt: 10/16)
- [ ] SCT-1 practice run-through with CDH to find what's missing
- [ ] Update GNU Radio to latest version, first pass at what state it's in for SCT-2
- [ ] Mid-semester review prep — review re-baselined to week of 10/26 (waterfall: 5 hrs prep + 2 hrs review, not started)

### Schedule changes
- GS PC: Palo and Rainville own bringing it up. My task is verifying it in the comms chain at the ground station once they have it working, so the laptop/443 setup rows are dropped.
- Motor interface still not working — probably ~1 more week (~10/21). Blocks all sat tracking attempts.
- Gpredict TLE tracking pushed back to follow the motor interface fix.
- Antenna raising pushed to early November.

---

## Management
- [x] Fixing waterfall chart to incorporate the target dates
- [x] Quad chart + waterfall update (10/9)
- [ ] Mid-semester review prep — review re-baselined to week of 10/26
- [ ] Re-baseline the Ground Station PC Architecture waterfall rows (laptop setup, connecting laptop + 443, planning final architecture) — Palo and Rainville now own GS PC bring-up, my role is verifying it in the comms chain (re-baselining needs Palo's approval)

## Ground Station

### GS PC / lab machines
- [x] Decide GS PC architecture (Rick's 2-PC proposal — static GNU Radio box for MAXWELL+SWARM-EX, dedicated Hydra box — vs. current setup)
	- [x] Professor Palo assessing the state of the lab machines — all GS PC work was on hold 9/23–9/29, resumed 9/30
	- [x] Sit down with Palo (and Rick) on the machine situation
	- [ ] Palo and Nicholas Rainville are bringing up the STIG GS PC #in-progress — route all GS PC needs through them
	- [x] Still want a usable machine on the side — use the spare laptop?
- [x] Write ground station doc for Palo
	- [x] Include the ground station PC in STIG
- [x] Get prior GS PC issue list from Adhi and Dhruva, propose to Steven Harrison #blocked Steven Harrison reportedly unwilling to help
- [x] Migrate/port HFSS from small 443 machine to big 443 tower — Palo hold lifted 9/30 (Gantt: 9/30–10/1)
	- [ ] see palo and rainville note
- [x] Stand up interim dev machine from 443 while GS PC situation is sorted — Palo hold lifted 9/30
- [ ] Ground Station PC test — revised 10/23 (planned 9/23) — date depends on when Palo/Rainville have the GS PC working
	- [ ] Verify the GS PC in the comms chain at the ground station once Palo/Rainville have it working (Justin) #blocked waiting on Palo/Rainville GS PC bring-up
	- [ ] ~~Set up laptop for GND station (Gantt: 10/2–10/12)~~ — dropped, GS PC bring-up is Palo/Rainville's
	- [ ] ~~Connect laptop and 443 machine (Gantt: 10/13–10/16)~~ — dropped
	- [ ] ~~Plan final GND station architecture (Gantt: 10/26–10/27)~~ — dropped, Palo leads
	- [ ] Finish STIG ground station PC doc #in-progress
- [ ] Update GNU Radio to latest version, first pass at what state it's in for SCT-2

### Antenna raising / rotors
- [ ] Raise the antenna (Edin) — target early November (was ~Oct 13, originally ~Sept 29)
	- Delayed — rooftop work (LNA, lightning arrestors, antenna installs) starting much later than expected; may slip further
	- [ ] Rooftop prereqs: LNA install, lightning arrestors, antenna installs (Gantt: 9/23–10/1)
		- [ ] Verify lightning arrestor install with building manager
			- [ ] Never installed — Edin needs to locate them, work with COSGC building manager #blocked arrestors not found yet
		- [ ] Weatherproofing: better zipties, coax seal, Loctite
	- [ ] Execute motor tests (Gantt: 10/2–10/12)
		- [ ] Fix motor interface — motors power on, but the interface is broken #in-progress — expect ~1 more week (~10/21); blocks all sat tracking attempts
			- Edin has made progress on figuring out bring-up needs
			- Asked Scott Gennari (LASP) for help
		- [ ] Safety precautions (Rick)
			- [ ] Should we get a list of these?
		- [x] Motor test procedure (Edin)
		- [x] Get motor configuration cable
	- [x] Check remaining things needed to raise antenna
	- [ ] Reach out to LASP contacts about antenna raising — Landon first, then Spencer (structures), Dr. Palo
	- [ ] Reach out to Fedor about RS232 cables for testing
- [ ] Calibrate rotors
- [ ] Get az/el tracking working correctly
- [x] Buy cables: RS232A, USB-ethernet converter (Rick to purchase)
- [x] Contact Alex Byrnes re: rotors/ground pass support

- [ ] reach out to systems if we just need hands for ground station PC bring up
- [x] email Scott Gennari at LASP for ground station expertise — contacted about antenna raising and motor interfacing
	- [ ] Follow up on Scott's response
### Tracking / end-to-end
- [ ] Set up Doppler correction + TLE tracking (Gpredict, Celestrak) (Elsa) — pushed back behind the motor interface fix (Gantt was 9/24–10/7)
	- [x] Confirm with Elsa whether Doppler correction should live in GPredict instead of GNU Radio
	- [ ] Gpredict tracking with TLEs (Gantt: 9/24–9/30) #blocked motor interface not functioning
	- [ ] Interface GNU Radio with Gpredict (Gantt: 10/1–10/7) — GS PC side goes through Palo/Rainville
- [ ] Test satellite tracking (Gantt: 10/26–11/3) #blocked motor interface not functioning
- [ ] Demonstrate GS can track another LASP satellite (proof-of-concept before MAXWELL)
- [ ] Demonstrate full uplink/downlink end-to-end
- [ ] talk to palo about the motor interfacing issues 
- [ ] Rick has lasp contact for GS setup, be sure to look into this for Edin and Elsa


### Coordination
- [x] Reach out to Skye Glasner to coordinate GS work, avoid duplicate effort
	- [x] Fri 10/2: check with Skye whether she got a chance to work on it — contacted

## Radio / Comms Chain (Lithium ↔ Hydra) — critical path for SCT & CET

### Hydra / tests
- [x] Get Lithium radio talking to Hydra (Justin) — blocks both SCT and CET tests
	- [x] Hydra hardwired directly to Li-2 — commands working
	- [x] Hydra → CDH → Li-2 (CDH still needs to be in the loop) — working as of 10/8 MCT run
		- [x] Work with CDH to fix how the command byte is read in — root cause was TX/RX swapped on the CDH board FTDI
- [x] Re-run MCT — revised 10/5 (planned 9/21) — ran Thu 10/8 with Saanika, commands acknowledged correctly
	- [x] Saanika review
	- [x] Review MCT test docs
	- [x] Hydra development
	- [x] MCT bench setup
	- [x] Practice run-through
	- [x] Full run-through
	- [x] Troubleshooting (Gantt: 10/7)
	- [x] Update MCT documentation
	- [ ] Return 30dB attenuator (borrowed from ground station for MCT) when done — currently in the comms box at 443
- [ ] Re-run SCT-1 — revised 10/20 (planned 9/30), ~24 hrs remaining
	- [ ] Review SCT-1 test docs (Gantt: 10/8) #in-progress
	- [ ] Practice run-through with CDH to find what's missing
	- [ ] Develop Hydra for SCT-1 (Gantt: 10/9–10/15)
	- [ ] Bench setup (Gantt: 10/16), practice run (10/19), full run (10/20–10/21), troubleshooting (10/22)
- [ ] Develop Hydra for SCT-2 (Gantt: 10/27–11/2; SCT-2 full run 11/17–11/20)
- [ ] Continue Hydra command dictionary implementation
	- [ ] for what?
- [ ] Re-verify Hydra ↔ GNU Radio link Dhruva previously demoed (flagged as possibly stale)
- [ ] Check what package Hydra receives
- [ ] Clarify "once you define H2S, Lithium no more" note with Dhruva
- [x] Contact Brian Hilten, clarify process
- [ ] palo over at space grant next week?
	- [ ] pointing things out, i really want to start a list of things to do

### Lithium / hardware
- [ ] Confirm Li-1 supply voltage (marked "?" at 7V) and Li-2 (10V) against absolute max ratings in Li-1 User Manual
- [ ] Locate 30dB attenuator and an antenna
	- [ ] In Palo's office
- [x] Go through Lithium breakout manual, especially absolute max ratings
- [x] Resolve Safe2Mate pinout mismatch (10 vs 14 vs 6 pin) — ask Alex or Saanika
	- [ ] This will require documentation updates
- [x] Find CDH UART connector location / pin layout of CDH board
	- [x] Altium — see Adhi's message
- [x] Get CDH pin diagram from Alex, or ask Saanika
- [ ] Obtain MAXWELL's Hydra and GNU Radio setup for SCT testing
- [ ] Start assembling a list of cables needed for the Lithium for Isaac (structures) #in-progress
	- [x] Compile flight cabling from the project dump — [[Li-2_Flight_Cabling_Summary]]
	- [ ] Resolve the open conflicts in the summary (MCX vs MMCX, BP1/H1 vs BP4/H4, 7-pin vs 15-pin, RF cable length)
	- [ ] Send the list to Isaac

### Packet structure / docs
- [ ] Sync with CDH on Lithium/Hydra packet structure
- [ ] Review packet structure doc ("packet structure – SWARM_EX_Dhruva")
- [ ] Locate and link the detailed packet-breakdown doc from the drive
- [ ] Document SWARM-EX-specific AX.25 handling (Hydra strips it, unlike MAXWELL)
- [ ] Pull/organize "07 Communications" docs from the drive
- [ ] Follow up with Dhruva if documentation proves insufficient

### MAXWELL reference
- [ ] Play with MAXWELL GNU Radio setup for reference
- [ ] Find MAXWELL pictures (not in SharePoint)

## Antenna

- [ ] Determine where Gabe left off on UHF "hat" antenna work; confirm with Dhruva if manufactured
- [ ] Clarify UHF frequency alignment issues from tape-measure-antenna testing
- [x] Resolve dipole antenna vs. solar array conflict (structures may have a fix avoiding the change)
- [x] Confirm/scope UHF hat requirement vs. dipole
- [x] Follow up with Edin Choi on antenna/signal analysis once design settles

## Systems / Cross-team

- [ ] Check in on Shehan's crosslinks
- [ ] Confirm Shehan's status/availability for crosslink work #blocked only 1 Lithium radio available for crosslink testing
- [ ] Check in on Luke Mathews' requirements review
- [ ] Get Steve Taylor's contact re: permissions
- [x] Contact ISIS about antenna material properties/CAD for Landon

## Team / Process

- [ ] Organize COMMs documentation (flagged as top risk — undocumented institutional knowledge)
- [ ] Set up recurring architecture discussion to settle GS PC decision
- [ ] Write end-of-semester transition document (docs index, explanations, member list)
- [ ] Decide whether Atharv takes on on-sat work
- [x] Onboard Edin Choi onto antenna analysis work
	- No longer doing that
- [x] Fix Slack channel/workspace organization for comms team
- [x] Give Atharv the SWARM-EX and ground station block diagrams
- [x] Edin and Elsa fill out when2meet

### New members
- Ian Li — systems
	- Looking into writing SCT and CET procedures
- Atharv — potentially doing on-sat work?

## Dependencies / Risks to Watch

- MAXWELL's February delivery could pull shared resources (GS, radios, personnel) from SWARM-EX
- SCT and CET both depended on the Lithium ↔ Hydra link — hardwired path through CDH now works (MCT 10/8); the over-the-air path for SCT-2 still needs the GS PC
- Grafana dashboard exists — check if it's already tracking comms status/telemetry before building new monitoring
- we may not have liscenses for crosslink broadcasting
	- palo has more details
	- internationa amateur dissaproves of our x band transmitter
	- and crosslink is amateur
- Li-2 antenna max input may be 0.5 W while the Li-2 can output up to 2 W — needs verifying (from [[Li-2_Flight_Cabling_Summary]])
