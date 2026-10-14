Compiled 2026-10-14 for [[MidSemester Review.pdf]]. Due 10/14 (PPT + 10 min recording to Gradescope and OneDrive), peer evaluations due 10/21.

Scope: my tasks from the personal waterfall chart, plus the work I do as COMMs lead. Team members' technical work (antenna raising, motor interface, Gpredict) only shows up where I tracked or coordinated it.

Sources: Draft Statement of Work, Personal Goals Report (10/5), weekly quad charts (9/11–10/9), personal waterfall chart, Gantt chart, MCT Notes, Hydra lessons, STIG GS PC status doc, Li-2 flight cabling summary, Action Items.

---

## a. Original plan for the semester

- Role: COMMs lead for SWARM-EX. From the SOW, the main areas were:
	- managing and tracking COMMs work
	- continuing ground station bring-up
	- getting Hydra talking to the Li-2 radio so SCT and CET can run
	- antenna work picking up where Gabe left off
- Why: SCT and CET are needed for the SWARM-EX Pre-Integration Review (PIR) in early 2027, and the ground station needs to be up for MAXWELL first, then SWARM-EX.
- Technical milestones and their original dates (first quad chart, 9/11):

| Milestone | Planned |
|---|---|
| Re-run MCT | 9/21 |
| Ground station PC test | 9/23 |
| Re-run SCT-1 | 9/30 |
| SCT-2 | 10/31 |

- Stretch goals: SCT-3 and CET readiness.
- How the tests build on each other, adding one new piece of hardware at a time:
	- MCT: Hydra → CDH → Li-2 over UART.
	- SCT-1: CDH ↔ Hydra hardwired, no RF.
	- SCT-2: adds the Li-2 and SDR, decoded through GNU Radio into Hydra.
	- SCT-3: adds the antenna.
- Personal goals:
	- get comfortable developing in Hydra
	- understand the packet chain end to end (CCSDS from Hydra → CDH → AX.25 from the Li-2)
	- build embedded debugging skills (UART, logic analyzer, CDH firmware)
	- get better at scoping and tracking work for a team
- Hours: 278 estimated (129 technical, 62 documentation, 87 class and meetings) against the 240 hour target. It ran over because each test was split into separate setup and test days.
- The plan changed early on. At the start I was driving the GS PC architecture: Rick's 2-PC proposal, then my 9/21 proposal of the 443 white tower running Hydra plus ground station laptop #2 running GNU Radio. As of 10/5, Prof. Palo leads GS PC development and my role is verifying it in the comms chain.

## b. What I have accomplished to date

### MCT complete (10/8)
- MCT re-run completed Thu 10/8 with Saanika. Commands were acknowledged correctly through Hydra → CDH → Li-2.
- Worked bottom up, verifying one interface at a time with a logic analyzer on the UART lines:
	1. Got Hydra installed on the 443 machine. This needed elevated permissions for the Python dependencies.
	2. Learned Hydra development with Saanika, and added the Li-2 commands and opcodes: command details, keywords, states, and a separate Li-2 opcode dictionary.
	3. Hardwired Hydra directly to the Li-2 and confirmed the commands on the logic analyzer (no-op, transmit, reset).
	4. Put CDH in the loop. CDH was reading the wrong byte (0x48 instead of 0x01).
	5. Root cause: the UART port on the CDH board had TX and RX swapped on the FTDI.
- Other things found along the way:
	- The encryption wait time had to change before CDH commands would go through.
	- The Hydra port always has to be set manually.
- Resolved hardware and documentation questions before powering anything:
	- the Safe2Mate pinout mismatch (10 vs 14 vs 6 pin)
	- the CDH UART connector and pin layout (from Altium)
	- the Li-2 absolute maximum ratings
- MCT test documentation is recorded and updated.
- MCT hours: 26 actual against 26 estimated.
- This closes risk #1 from my goals report (CDH misinterpreting commands from Hydra), which was blocking SCT-1, SCT-2 and CET.

### SCT-1 started
- Started reviewing the SCT-1 test documents (week of 10/5).
- Next is a practice run-through with CDH to find what is missing.

### Ground station PC
- Wrote the STIG Ground Station PC Status, Issues & Path Forward doc (10/2) for Prof. Palo. It covers:
	- the current setup (Ubuntu 24 host with KVM, a Windows VM for Hydra, an Ubuntu 16 VM for GNU Radio, USRP passthrough)
	- why it was set up that way (VirtualBox licensing, CU IT restrictions)
	- an issues table (the VMs can't talk to each other, VPN problems, limited admin access)
	- the people involved, the options considered, and open questions
- That doc became the shared picture for Palo, IT and COMMs, and led to Palo and Nicholas Rainville taking over GS PC bring-up.
- Ran the 9/21 machine discussion: an inventory of the 443 towers, the HFSS machine, the STIG PC and the two GS laptops, with a proposed interim path.
- Interim dev machine set up in 443, and HFSS moved off the small 443 machine to the big tower.

### Li-2 flight cabling for structures
- Compiled a sourced summary (10/7) of the two Li-2 flight cables for Isaac (structures):
	- RF coax: Pasternack PE3W13553, MCX to MMCX, semi-rigid.
	- Power/data: H4 Y-harness from BP4, with a 7-pin Li-2 pinout.
- Flagged conflicts in the project docs before anything gets ordered:
	- MCX vs. MMCX
	- BP1/H1 vs. BP4/H4
	- 7-pin vs. 15-pin
	- RF cable length not finalized
	- the antenna may max out at 0.5 W while the Li-2 can output 2 W

### As COMMs lead
- Onboarded new members (Edin, Elsa, Atharv, Ian Li).
	- Gave Atharv the SWARM-EX and ground station block diagrams.
	- Reorganized the COMMs Slack.
- Set up the COMMs action items list as the single source of truth for team work, along with weekly quad charts, my waterfall chart and a Gantt chart.
- Coordinated outside COMMs:
	- Skye (MAXWELL), to avoid duplicating ground station work.
	- Alex Byrnes, for rotor and ground pass support.
	- ISIS, for antenna material properties and CAD for Landon.
	- Rick, for cable purchases (RS232, USB-ethernet).
- Reached out to Scott Gennari (LASP ground station expert) about antenna raising and the motor interface issues blocking satellite tracking.
- Kept the schedule current as things moved. On 10/14 I rescheduled:
	- the motor interface fix to ~10/21
	- Gpredict tracking to after the motor fix
	- antenna raising to early November
	- the GS PC rows around Palo and Rainville owning bring-up

### Hours
- 113.5 hours logged through the week of 10/5, against a 15 hr/week target.
- 23 hours in the week of 9/28 (MCT push).

## c. Plans for the rest of the semester

| Task | Dates |
|---|---|
| SCT-1 (revised 10/20, planned 9/30) | finish doc review and Hydra development; bench setup 10/16, practice run 10/19, full run 10/20–10/21, troubleshooting 10/22 |
| GS PC verification | once Palo/Rainville have it working |
| SCT-2 | review procedure 10/23, Hydra development 10/27–11/2, re-verify Hydra–Li-2 and GS setup, practice 11/13, full run 11/17–11/20, troubleshooting 11/30, post-test documentation review 12/3 |
| End-of-semester review | week of 12/7 |
| Final report | draft and final weeks of 11/30 and 12/14 |

- GS PC verification, also working bottom up:
	1. USRP → GNU Radio
	2. GNU Radio ↔ Hydra
	3. the whole ground side with the existing station hardware
- In the meantime, update GNU Radio to the latest version and do a first pass at what state it's in for SCT-2.
- Documentation:
	- Hydra and packet handling notes (Li-2 opcode dictionary, packet structure, how Hydra strips AX.25 for SWARM-EX unlike MAXWELL)
	- SCT-1 and SCT-2 test records
	- the GS PC verification checklist
	- the Li-2 cable list sent to Isaac once the conflicts are resolved
	- the end-of-semester transition document
- As lead:
	- track the motor interface fix (~10/21), Gpredict tracking, and antenna raising (early November)
	- follow up with Scott Gennari
	- get Palo's approval to re-baseline the GS PC rows in my waterfall
- Stretch: SCT-3 (needs the raised antenna) and CET readiness.

## d. Impact on SWARM-EX

- MCT is the first time commanding Hydra → CDH → Li-2 has worked on SWARM-EX. It is the base that SCT-1, SCT-2 and CET build on, and those are needed for PIR in early 2027.
- The TX/RX swap, the encryption wait time and the manual Hydra port are now written down, so the next person doesn't lose the same time.
- The STIG GS PC doc turned a long-running unknown (it wasn't working when Dhruva and Adhi left) into a written issue list with clear owners.
- The cabling summary gives structures one sourced reference and catches documentation conflicts before parts are ordered.
- It cuts down the knowledge that only lived with past members, which was the top risk in my SOW. This comes from:
	- the Hydra lessons notes
	- the MCT docs
	- the action items list
	- the transition doc that's coming
- The team's work is visible and tracked week to week, and blockers get routed to the right person (CDH, Palo, LASP, MAXWELL).

## e. Concerns and risks

- GS PC timing is out of my control. Development is led by Palo and Rainville, and SCT-2 needs the PC verified. Fallback: the interim laptop setup.
- Schedule compression:
	- SCT-1 slipped from 9/30 to 10/20.
	- The SCT-2 practice and full runs (11/13–11/20) now sit right before Thanksgiving week, with little slack.
- Hours: my plan was 38 hours over the 240 hour target. The dropped GS PC rows (23 hrs) and the slipped dates need re-baselining with Palo's approval.
- Only one Li-2 radio. Damaging it stops all radio testing, and it already blocks crosslink testing.
- Documentation gaps: packet structure, AX.25 handling, and GS PC history were mostly held by previous members.
- RF levels and frequency in SCT-2: too little attenuation can overwhelm the SDR, and the Li-2 shifts frequency when hot.
- Team-level risks I'm tracking:
	- the motor interface blocks all satellite tracking
	- antenna raising has moved to early November, which puts SCT-3 at risk
	- MAXWELL's February delivery could pull GS hardware, attenuators and people
	- we may not be licensed for crosslink broadcasting
- Update to the risk chart from my goals report:
	- Risk 1 (CDH misinterpreting commands) is retired.
	- Risk 2 (GS PC not verified in time for SCT-2) is now the top risk.

---

## Figure ideas

The rubric gives 5 of the 20 points to figures.

- Block diagram of the test chain (Hydra → CDH → Li-2 → attenuator → SDR → GNU Radio → Hydra), showing which part each SCT tier adds.
- MCT bench setup photo and the logic analyzer captures (li2 no-op, transmit, reset). These are already on slides 2–3 of the 10/5 quad chart.
- Before and after of the CDH byte bug: 0x48 read instead of 0x01, fixed by swapping TX/RX.
- Waterfall chart screenshot showing the MCT rows complete and the struck GS PC rows.
- Planned vs. revised dates table from the quad charts (MCT 9/21→10/8, SCT-1 9/30→10/20, GS PC 9/23→TBD).
- STIG GS PC diagram: Ubuntu 24 host, two VMs, USRP passthrough, and where the VM-to-VM link broke.
- Updated risk stoplight chart: the goals report's chart with risk 1 retired and risk 2 moved up.
- Hours bar chart: weekly actual vs. the 15 hr target.

## Rough slide outline (10 min ≈ 8–10 slides)

1. Title, role (COMMs lead), and what SWARM-EX COMMs needs to reach PIR.
2. Original plan: milestones, stretch goals, personal goals, how the test tiers build up.
3. How the plan changed: GS PC ownership moved to Palo/Rainville, so my role is verification.
4. MCT: bottom-up approach, the TX/RX swap, the result (with photos and logic analyzer captures).
5. Ground station PC: the STIG doc and the path forward.
6. Lead work: onboarding, tracking, coordination, the cabling summary.
7. Schedule: planned vs. revised, and the remaining SCT-1 → SCT-2 timeline.
8. Impact on the team.
9. Risks and concerns: the updated stoplight chart.
