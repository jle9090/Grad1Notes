Compiled 2026-10-27 from the SWARM-EX notes, [[Action Items]] and its git history, the weekly quad charts (9/18–10/23), the personal waterfall chart, the Gantt chart, and the STIG GS PC status doc.

Scope: SWARM-EX COMMs work, plus the work by CDH, MAXWELL, faculty and LASP that COMMs depended on. Dates are when an item was recorded as done in the notes, so some happened a few days earlier.

---

## Summary

| Milestone | Planned | Actual / revised | Status |
|---|---|---|---|
| Re-run MCT | 9/21 | 10/8 | Done |
| Re-run SCT-1 | 9/30 | 10/22 | Done |
| Ground station PC test | 9/23 | Week of 11/2 | GS PC works (10/23), verification in the comms chain is still to do |
| SCT-2 | 10/31 | Full run 11/17–11/20 | Procedure review started 10/23 |
| Raise antenna | ~9/29 | 11/16 | Blocked by the rooftop work and the motor interface |

- **September:** set up the team and plan, got Hydra running and learning, collected missing documentation from past members, and moved the GS PC problem to Palo. MCT was attempted but didn't pass.
- **October:** Hydra → CDH → Li-2 commanding works for the first time on SWARM-EX (MCT 10/8). SCT-1 passed (10/22). The STIG GS PC is working (Palo/Rainville). Rooftop work has started. The motor interface is still the main blocker for satellite tracking and raising the antenna.

## Who's working on what

| Person | Area |
|---|---|
| Justin Le | COMMs lead; Hydra ↔ Li-2 (MCT, SCT-1, SCT-2) |
| Edin Choi | Ground station bring-up: motor tests, rooftop prereqs, antenna raising. Took over more of this after Alex left (9/16) |
| Elsa | Ground station tracking software: Doppler, Gpredict, TLEs |
| Rick Marcusen | Cable purchases, safety list, LASP contact, help on the GS PC doc |
| Atharv | New member (EPS and comms), may take on-sat work |
| Ian Li | New member (systems), looking into writing the SCT and CET procedures |
| Muthur | New member, may take on-sat work |
| Shehan | Systems; crosslink test plan |
| Saanika (CDH) | Taught Hydra development, ran MCT and SCT-1 with COMMs |
| Prof. Palo, Nicholas Rainville | STIG GS PC bring-up, motor interface debugging, GNU Radio replacement program |

---

## September

### Team and planning
- 9/9 planning meeting set the semester's action items. Wrote the Statement of Work and divided the work: Justin (Hydra/Li-2), Elsa (tracking software), Edin (ground station).
- 9/14 all-hands: X-band licensing questions came up, and Shehan is continuing the crosslink test plan. Agreed to write an end-of-semester transition doc.
- 9/16: onboarded new members. Gave Atharv the SWARM-EX and ground station block diagrams.
- Cleaned up the COMMs Slack and set up a when2meet with Edin and Elsa.
- 9/18: first weekly quad chart and personal waterfall chart.
- 9/23: [[Action Items]] became the single source of truth for COMMs work, and the COMMs Gantt chart was set up.
- 9/25: re-baselined the milestones: MCT to 10/5, SCT-1 to 10/20, GS PC test to 10/23.
- 9/30: added the target dates to the waterfall chart.

### Hydra ↔ Li-2 (MCT)
- 9/16: reviewed the MCT test docs.
- Installed Hydra on the 443 machine. The Python dependencies needed elevated permissions.
- 9/18: attempted an MCT run-through. Found where the hardware and documentation are.
- 9/22: met with Dhruva about Li-2 power limits, CCSDS/AX.25 packet structure, and the ground chain. See [[SWARM-EX Comms Notes from Meeting with Dhruva]].
- 9/23–9/29: Hydra development for MCT. A second MCT attempt used the manual and a multimeter to find the right pins, and showed that Hydra was missing commands.
- 9/28: Saanika taught Hydra development (command details, keywords, states, a Li-2 opcode dictionary) and how the CDH code is laid out in MPLAB. See [[Hydra lessons]].
- Resolved before powering anything:
	- the Safe2Mate pinout mismatch (10 vs. 14 vs. 6 pin)
	- the Li-2 absolute maximum ratings, from the breakout manual
	- the CDH UART connector and pin layout, from Altium with help from Adhi
	- the CDH pin diagram
- Contacted Brian Hilten about the Li-2 ↔ Hydra process.

### Ground station
- Edin wrote the motor test plan (9/9–9/12) and the list of remaining work before the antenna can be raised (9/15–9/17).
- Rick is buying the RS232A and USB-ethernet cables. The motor configuration cable arrived.
- Checked with Elsa on moving Doppler correction into Gpredict instead of GNU Radio.
- Contacted Alex Byrnes about rotors and ground pass support, and Skai (MAXWELL) to avoid duplicating ground station work.
- 9/28 all-hands: reaching out to Fedor for RS232 test cables, and to Landon, Spencer and Palo about raising the antenna.

### Ground station PC
- 9/21: inventoried the candidate machines: the 443 white tower, the 443 HFSS machine, the STIG GS PC, and two GS laptops. Proposed an interim setup with Hydra on the 443 tower and GNU Radio on GS laptop #2.
- 9/23–9/29: Palo paused all GS PC work to assess the lab machines.
- 9/30: the pause was lifted. HFSS moved from the small 443 machine to the big tower (9/30–10/1), and the interim dev machine was set up.
- Asking Adhi and Dhruva for their old GS PC issue list for Steven Harrison stalled, since he reportedly isn't willing to help.

### Antenna and cross-team
- Marked the dipole antenna vs. solar array conflict resolved: structures expected to have a fix that avoids changing the antenna.
- Confirmed the scope of the UHF hat vs. the dipole.
- Contacted ISIS about antenna material properties and CAD for Landon (structures).
- Crosslink is blocked because there is only one Li-2 radio.

---

## October

### Hydra ↔ Li-2: MCT complete (10/8)
- 10/2: hardwired Hydra directly to the Li-2. The logic analyzer confirmed the no-op, transmit and reset commands.
- With CDH in the loop, CDH read the wrong byte (0x48 instead of 0x01). The root cause was **TX and RX swapped on the CDH board FTDI**.
- 10/8: ran MCT with Saanika. Commands were acknowledged through Hydra → CDH → Li-2. This is the first time this chain has worked on SWARM-EX.
- Also found and wrote down:
	- the encryption wait time had to change before CDH commands would go through
	- the Hydra port always has to be set by hand
- Updated the MCT documentation. See [[MCT Notes]].

### SCT-1 complete (10/22)
- 10/8–10/15: reviewed the SCT-1 docs and developed Hydra for SCT-1.
- 10/16–10/19: bench setup and practice runs. Three commands were missing from Hydra: 0x51 schedule, 0x54 read command queue and 0x57 flush command queue. Saanika thinks they were lost in the Hydra git issues.
- 10/22: full run with Saanika, and all commands were acknowledged. CDH wrote and implemented the three missing commands, and they've been run. See [[SCT1 Notes]].
- Decided the SCT-2 hardwired setup: SMA straight with a 40 dB attenuator. SCT-2 and all later SCTs re-run the SCT-1 commands.

### SCT-2 prep
- Updated GNU Radio from MAXWELL's setup on a personal computer to see what SWARM-EX needs changed.
- 10/21: met with Rainville about his new clean-sheet program that replaces GNU Radio. See [[Rainville Notes]].
	- It's built on the GNU Radio libraries, installs through radioconda, and opens network ports to connect to.
	- Hydra stays the same.
	- COMMs was added to his repo.
	- Doppler would come from Gpredict through a network port or a GNU block.
- Hydra will be verified with both GNU Radio (11/6) and Rainville's program (11/9–11/10).
- 10/23: started reviewing and drafting the SCT-2 procedure, including the Li-2 and B200 setups.

### Ground station PC
- 10/2: wrote the STIG Ground Station PC status doc for Palo, with input from Rick and Rainville. It covers:
	- the Ubuntu 24 host with KVM, a Windows VM for Hydra and an Ubuntu 16 VM for GNU Radio
	- why it was set up that way (VirtualBox licensing, CU IT restrictions)
	- the VM-to-VM link that never worked
	- the people involved, the options, and open questions
- By 10/6, Palo and Rainville took over GS PC bring-up. COMMs now just verifies it in the comms chain.
- 10/23: **the GS PC is working.** Verification moved to the week of 11/2, since the ground station is waiting on MAXWELL vibe testing.

### Ground station hardware and tracking
- Found that the motors power on but **the motor interface is broken**. This blocks motor tests, Gpredict tracking and satellite tracking. Palo is debugging it.
- Found that the lightning arrestors were never installed. Edin is working with the COSGC building manager.
- 10/14: emailed Scott Gennari (LASP) about raising the antenna and the motor interface. He replied, and Elsa is now talking with him. Rick's LASP contact also replied.
- By 10/20: located a 30 dB attenuator and an antenna in Palo's office, confirmed the Li-1 and Li-2 supply voltages, and got Steve Taylor's contact for permissions.
- By 10/23:
	- the LNA is mounted on the roof
	- the lightning arrestors are being installed
	- the exact ground station location was found
	- Rick sent the safety list
	- Landon and Spencer were contacted about raising the antenna
- 10/23: pushed the motor tests, Gpredict TLE tracking (11/5), the Gpredict interface (11/12), raising the antenna (11/16) and satellite tracking (11/20) back 2 weeks.

### Li-2 flight cabling for structures
- 10/7: compiled a sourced summary of the two Li-2 flight cables for Isaac (structures). See [[Li-2_Flight_Cabling_Summary]].
	- RF: Pasternack PE3W13553, MCX to MMCX, semi-rigid
	- Power/data: H4 Y-harness from BP4
- Flagged doc conflicts before anything gets ordered:
	- MCX vs. MMCX
	- BP1/H1 vs. BP4/H4
	- 7-pin vs. 15-pin
	- the RF cable length isn't final
	- the antenna may max out at 0.5 W while the Li-2 can output 2 W

### Licensing
- 10/15: NOAA is required for the FCC license, and ground testing can use an extended license with the same callsign.
- Risk: we may not be licensed for crosslink broadcasting, since crosslink is amateur and the international amateur community objects to the X-band transmitter. Palo has the details.

### Course deliverables
- 10/5: Personal Goals Report.
- 10/14: mid-semester review (slides and recording).
- 10/21: peer evaluations.
- 10/26: crosslink check-in with Shehan. Still blocked, since there's only one Li-2.

---

## Logged hours (Justin, from the waterfall)

| Week of | 8/31 | 9/7 | 9/14 | 9/21 | 9/28 | 10/5 | 10/12 | 10/19 |
|---|---|---|---|---|---|---|---|---|
| Hours | 10 | 13 | 15 | 17 | 21 | 15.5 | 13.5 | 15 |

- September weeks (8/31–9/28): 76 hrs.
- October weeks (10/5–10/19): 44 hrs.
- Semester total: 135 hrs, including the week of 8/24.
- MCT took 26 hrs (26 estimated). SCT-1 took 12.5 hrs (15 estimated).

## Coming up in November

- SCT-2:
	- Hydra development 10/27–11/2
	- re-verify with GNU Radio 11/6 and with Rainville's program 11/9–11/10
	- practice run 11/13
	- full run 11/17–11/20
- Verify the GS PC in the comms chain, week of 11/2.
- Motor interface fix (~11/4, Palo), then Gpredict tracking, raising the antenna (11/16) and satellite tracking (11/20–12/7).
- Send Isaac the Li-2 cable list once the conflicts are resolved.
- Tag up with Jordan on how CDH and Hydra were updated.
- Still to document:
	- the packet structure
	- how Hydra strips AX.25 for SWARM-EX
	- the "07 Communications" docs on the drive
- Risks:
	- only one Li-2 radio
	- the motor interface blocks all tracking and puts SCT-3 at risk
	- MAXWELL's vibe testing and February delivery compete for the ground station
	- crosslink licensing
