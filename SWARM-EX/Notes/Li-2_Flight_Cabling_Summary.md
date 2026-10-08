# Li-2 Flight Cabling Summary

Compiled 2026-10-07 from the SWARM-EX project dump. File paths are relative to the dump root (`SWARM EX DUMP (UNZIPPED)/`).

The Li-2 needs two flight cables:

1. An **RF coax** from the Li-2 to the ISIS UHF antenna.
2. A **data/power harness** from the backplane to the Li-2.

The project documents disagree on several points. See [Conflicts and open items](#conflicts-and-open-items) before ordering or building anything.

---

## 1. RF cable: Li-2 → ISIS UHF antenna

| Item | Value | Source |
|---|---|---|
| Li-2 side connector | **MCX female** on the radio, so the cable needs an **MCX male** plug | [S1], [S5] |
| Antenna side connector | ISIS UHF antenna J2 is **MMCX female**, so the cable needs an **MMCX male** plug. J3 is unused in turnstile configuration. | [S1], [S3] |
| Cable type | Semi-rigid preferred | [S1] |
| **Final selection** | **Pasternack PE3W13553**: PE4876 MCX plug (straight) + **PE-SR405TN** semi-rigid coax + PE44453 MMCX plug (straight). The original sheet marks it "Final Selection and ordered". | [S1], [S2] |
| Cable specs | 2.21 mm cable diameter, 1.27 mm bend radius, ~72.18 dB/100 m (~0.072 dB per 10 cm) | [S1] |
| Connector specs (PE4876) | DC–6 GHz, VSWR 1.37:1, 50 Ω, solder attach, 11.3 mm long | [S2] |
| Alternatives considered | PE3W04037 (RA MCX + RG405/U + straight MMCX jack), PE3W13373 (PE-SR405AL), PE3W13554 (RA MCX + RG405/U + RA MMCX) | [S1] |
| Link budget assumption | 0.2 m semi-flex line (0.057 dB), MCX connector 0.1 dB, SMA connector 0.2 dB, Li-2 0.5 dB, for **0.857 dB total Tx system loss** | [S4] |

SYS113 originally noted "Right angle for radio side and straight for antenna" for the antenna RF connector [S3]. The final selection in COM111 is straight on both ends [S1].

---

## 2. Data/power harness: backplane → Li-2

The current definition is **harness H4**, a **Y-harness** from backplane connector **BP4** (21-pin Micro-D socket, PCB terminating). Leg A goes to the Li-2 and leg B goes to the NovAtel GNSS receiver [S3], [S6].

The Li-2 pinout was checked against the "7 pin version" on 7/23/2023 by AB [S6].

| Li-2 pin | Signal | Type | Direction | BP4 pin |
|---|---|---|---|---|
| 1 | TX_RADIO | Signal | Output | 1 |
| 2 | RX_RADIO | Signal | Input | 2 |
| 3 | EXT_PIN_CONN | Signal | Output | 4 |
| 4 | V_AMP | Power | N/A | 5 |
| 5 | V_AMP | Power | N/A | 7 |
| 6 | GND | Power | N/A | 8 |
| 7 | GND | Power | N/A | 10 |

Source: [S6]

### Supporting info

| Item | Detail | Source |
|---|---|---|
| Harness type | `CDH117` lists the Li-2 as a "Straight harness". SYS113 later lists it as leg A of the H4 Y-harness. | [S7], [S3] |
| Li-2 module | SMT module (32 × 62 mm) with 15 pads soldered to a host PCB. Native pinout is on p.3 of the manual. RF connector options are RA SMA or MCX. | [S8] |
| Connector family | Glenair MLDM2L series Micro-D (e.g. MLDM2L-15S-4C was listed for the Li-2) | [S9] |
| Connector cost note | The Glenair Micro-Ds may need to be swapped for less expensive parts to meet the budget. | [S10] |
| Mass | MEL allocation of 100 g for all harnessing + 15% margin. Micro-D mass estimates: 21-pin ≈ 2.5–2.9 g. | [S11], [S12] |
| Micro-D pin mapping note | The micro-D pin order is the same for pin and socket connectors, so pins mirror across the mate. | [S6] |

---

## Conflicts and open items

1. **RF connector type.**
   - The flight block diagram shows **MMCX** on both ends of the Li-2 RF line [S13].
   - COM103 acceptance testing found that the flight Li-2s (A001A–A005A) have **MCX** connectors, while previous units used SMA [S5].
   - The trade study uses MCX on the Li-2 side [S1]. The diagram is out of date.
2. **Which harness and connector.**
   - The block diagram still shows the Li-2 on **BP1/H1** (a 15-pin Micro-D to a "Li-2 interface" on a Comms PCB) [S13].
   - SYS113 marks BP1/H1 as **Removed** and moves the Li-2 to **BP4/H4** (21-pin) [S3].
   - The CDH118 BP4 sheet still carries a "25-pin Micro-D Harness for UHF antenna and Propulsion" header copied from the template, but its pinout is 21-pin [S6].
3. **7-pin vs 15-pin pinout.**
   - CDH118 uses a 7-pin Li-2 pinout [S6]. The Li-2 manual defines 15 pins, including RESET, 3.3V_RADIO, RF_GND and the config pins [S8].
   - The 7 pins appear to be the interface board/connector, not the raw module. Confirm which board the flight Li-2 actually mounts on.
4. **RF cable length is not finalized.**
   - The link budget assumes 0.2 m [S4].
   - Fall 2023 COM meeting notes say "the length need to be finalized before" ordering, and the order question was still open: assembled by Pasternack vs. self-soldered, and quantities of 1 vs. 3 each [S14].
5. **Antenna input power (antenna limit, not a cable spec).** The Fall 2025 task list flags that the antenna's max input may be 0.5 W while the Li-2 might output 2 W. This needs verifying [S15].
6. **Empty cable-diagram folders.** These folders are empty in this dump:
   - `2.0 Systems Engineering/!archive/SYS114-System_Cable_Interconnect_Diagram_SWARM-EX/`
   - `2.0 Systems Engineering/Reference Material/MAXWELL System Block Diagrams/0015 System Cable Interconnect Diagram/`

   SYS113 and CDH118 also link to Google Sheets versions that may be more current than the copies in this dump:
   - SYS113: https://docs.google.com/spreadsheets/d/1guTMwCsaW_GnN9EjWURSZ-K5OmE2RfaJPmr6K5iqmCc
   - CDH118: https://docs.google.com/spreadsheets/d/1Dtviv_osMZiZ55IMU2TdnWpqHRg-yn_jf9rpPSlvYg0

---

## Not flight hardware (bench/ground support only)

These are used for Li-2 testing and configuration. None of them fly.

| Item | Source |
|---|---|
| FTDI TTL-232R USB-to-serial cable | [S16], [S17] |
| MCX→BNC adapter, BNC→SMA adapter, SMA female-female barrel, attenuator (for power/spectrum measurements) | [S5] |
| 30 dB attenuator on the Li-2 RF port during bench testing | [S18] |
| Li-2 interface/breakout PCB with FTDI header (J2); benchtop PSU leads | [S5], [S18], [S19] |

---

## Sources

| ID | File | What it provides |
|---|---|---|
| S1 | `7.0 Communications/COM111-RF_Cable_&_Connector_Trade_Study.xlsx` ("New RF Cable, Connector List" sheet). Rev A, 2022-05-16, S. S. Kabir. Older copy: `7.0 Communications/!archive/COM111-RF Cable and Connector Trade Study.xlsx` | RF connector requirements, cable options, final selection |
| S2 | `7.0 Communications/7.9 RF Cables Datasheet/PE3W13553_KitBOM.pdf`. Alternatives are in the same folder: `PE3W04037_KitBOM.pdf`, `PE3W13554_KitBOM.pdf` | Pasternack datasheets for the selected kit |
| S3 | `2.0 Systems Engineering/SYS113-Interfaces_and_Mechanical_Requirements_SWARM-EX.xlsx` ("COTS Hardware", "Connector Designations", "SW-X Harness Designations", "Version 1" sheets) | Connector/harness designations; ISIS antenna J1/J2/J3; BP1 removed, BP4 assigned |
| S4 | `7.0 Communications/COM100-Link_Budget_SWARM-EX.xlsx` ("Tx System Losses" sheet) | Assumed cable length and losses |
| S5 | `7.0 Communications/COM103-Li-2_Acceptance_Testing.docx` | Flight Li-2s use MCX (older units SMA); test adapter chain |
| S6 | `10.0 Command and Data Handling/Backplane/CDH118-Backplane_Harness_Pinouts_SWARM-EX.xlsx` ("BP4_Li2&NovAtel" and "Overview" sheets) | BP4/H4 Li-2 pinout |
| S7 | `10.0 Command and Data Handling/Backplane/CDH117-Backplane_Documentation_Tables.xlsx` ("Mechanical Interfaces" sheet) | Li-2 connection type |
| S8 | `7.0 Communications/7.6 Li-2/LithiumII-User_Manual_01122017.pdf` (also `2.0 Systems Engineering/Interface Documents/UHF/AstroDev/LithiumII-User_Manual_01122017.pdf`) | Li-2 15-pin interface, RF connector options, dimensions |
| S9 | `2.0 Systems Engineering/SYS134-Used_Hardware_Pinouts_SWARM-EX.xlsx` | Micro-D part numbers (MLDM2L series) |
| S10 | `10.0 Command and Data Handling/Backplane/CDH119-Backplane_Specs_SWARM-EX.docx` (Section 5) | Peripheral connector type and layout notes |
| S11 | `2.0 Systems Engineering/SYS102-Master Equitment List_SWARM-EX.xlsx` | Harnessing mass allocation |
| S12 | `2.0 Systems Engineering/Scratch-Miscellaneous/Harnessing Mass Estimate.xlsx` | Connector and wire mass estimates |
| S13 | `2.0 Systems Engineering/SYS106-System_Block_Diagrams_SWARM-EX-Flight Interconnect.jpg` (source: `SYS106-System_Block_Diagrams_SWARM-EX.drawio`) | Flight interconnect diagram (outdated for the Li-2) |
| S14 | `7.0 Communications/7.1 Meetings/COM Meeting from Fall_2023.docx` | Cable/connector ordering status |
| S15 | `7.0 Communications/7.1 Meetings/COMMs Fall 2025 Task List.docx` | Antenna max-power open item |
| S16 | `7.0 Communications/7.6 Li-2/FTDI  TTL-232R Cables.pdf` | GSE serial cable datasheet |
| S17 | `7.0 Communications/7.6 Li-2/Lithium setup instruction/Li_2_Setup_Procedure_1.01.pdf` | Bench setup procedure |
| S18 | `7.0 Communications/7.6 Li-2/Li_2_Verification_Document.pdf` | Bench setup: attenuator, interface board, USB data cable |
| S19 | `13.0 Ground Station/2.0 Hydra/0086-CET_Report_MAXWELL_022623.docx` | Li-2 breakout board FTDI header (J2) |
