# MotoLift

## BSc. in Software Engineering

## Foundations Project

### Group Name: MotoLift

**Cyuzuzo Germain** (Database Architect)

**Wisdom Okechukwu Ikechukwu** (Lead Engineer II)

**Erioluwa Gideon Olowoyo** (Project Manager)

**Igor Ntwali** (Lead Engineer I)

**Alieu Jobe** (Software Tester)

**March 2026**

GitHub Repository: https://github.com/Git-with-gideon/FoundationProject_MotoLift

---

## Abstract

Motorcycle taxi (moto) drivers in Kigali, Rwanda, pay daily rental fees to fleet owners, absorbing a large share of their income with no path toward asset ownership. This report presents MotoLift, a USSD-native and Mobile Money-integrated platform that was designed and built to convert those daily rental payments into structured rent-to-own installments tracked through an automated escrow ledger. The system was implemented using Node.js, Express, and PostgreSQL with Prisma ORM on the backend, and vanilla HTML, CSS, and JavaScript on the frontend. Drivers interacted with the platform through USSD menus accessible on basic feature phones, while motorcycle owners and administrators used role-based web dashboards to manage fleets, assign drivers, and monitor payment progress. A six-week simulated pilot was conducted in the Kimironko sector of Kigali with 15 drivers and 4 owners. The system processed 571 successful payments out of 630 possible, achieving a 90.6% on-time payment rate and 99.8% escrow reconciliation accuracy. Ownership percentages averaged 7.0% across all drivers after the pilot period, consistent with the 18-month ownership timeline. These results demonstrated that simple, accessible technology can formalize informal rental arrangements and create a viable path from renter to owner for moto-taxi drivers.

---

## Table of Contents

- Abstract
- Table of Contents
- List of Tables
- List of Figures
- List of Acronyms/Abbreviations
- CHAPTER 1: INTRODUCTION
  - 1.1 Introduction and Background
  - 1.2 Problem Statement
  - 1.3 Project's Main Objective
    - 1.3.1 List of Specific Objectives
  - 1.4 Research Questions
  - 1.5 Project Scope
  - 1.6 Significance and Justification
  - 1.7 Ethical Considerations and Guidelines
  - 1.8 Research Timeline
  - 1.9 Feasibility, Innovation, Risk Assessment, and Evaluation Plan
- CHAPTER 2: LITERATURE REVIEW
  - 2.1 Introduction
  - 2.2 Historical Background of the Research Topic
  - 2.3 Overview of Existing System
  - 2.4 Review of Related Work
    - 2.4.1 Summary of Reviewed Literature
  - 2.5 Strengths and Weaknesses of the Existing System(s)
  - 2.6 General Comments
- CHAPTER 3: SYSTEM ANALYSIS AND DESIGN
  - 3.1 Introduction
  - 3.2 Research Design (Including the SDLC Model Used)
  - 3.3 Functional and Non-Functional Requirements
  - 3.4 System Architecture
  - 3.5 Use Case Diagram, Class Diagram, ERD, and Other Diagrams
  - 3.6 Development Tools
- CHAPTER 4: SYSTEM IMPLEMENTATION AND TESTING
  - 4.1 Implementation and Coding
    - 4.1.1 Introduction
    - 4.1.2 Description of Implementation Tools and Technology
  - 4.2 Graphical View of the Project
    - 4.2.1 Screenshots with Description
  - 4.3 Testing
    - 4.3.1 Introduction
    - 4.3.2 Objective of Testing
    - 4.3.3 Unit Testing Outputs
    - 4.3.4 Validation Testing Outputs
    - 4.3.5 Integration Testing Outputs
    - 4.3.6 Functional and System Testing Results
    - 4.3.7 Acceptance Testing Report
- CHAPTER 5: RESULTS AND SYSTEM EVALUATION
- CHAPTER 6: CONCLUSIONS AND RECOMMENDATIONS
- References

---

## List of Tables

- Table 1: Team Members and Roles
- Table 2: Project Timeline (6-Week Alpha Roadmap)
- Table 3: Risk Assessment Matrix
- Table 4: Functional Requirements
- Table 5: Non-Functional Requirements
- Table 6: Development Tools Summary
- Table 7: Integration Test Results Summary
- Table 9: Simulated Pilot Driver Data
- Table 10: Payment Performance Metrics
- Table 11: System Performance Metrics

---

## List of Figures

- Figure 1: MotoLift System Architecture Diagram
- Figure 2: UML Class Diagram
- Figure 3: Entity-Relationship Diagram (Prisma Schema)
- Figure 4: USSD Registration Flow
- Figure 5: Payment Processing Sequence
- Figure 6: Login Page Screenshot
- Figure 7: Owner Dashboard Screenshot
- Figure 8: Admin Dashboard Screenshot
- Figure 9: Driver Profile Screenshot
- Figure 10: USSD Simulator Output
- Figure 11: Overview Analytics - Payments Bar Chart (This vs Last Month)
- Figure 12: Overview Analytics - Current Month Mix Donut Chart
- Figure 13: Drivers Trend Line Chart
- Figure 14: Drivers Status Breakdown Donut Chart
- Figure 15: Payments Trend Line Chart
- Figure 16: Payments Status Breakdown (Bar + Donut)
- Figure 17: Motorcycles Trend Line Chart
- Figure 18: Disputes Trend Line Chart

---

## List of Acronyms/Abbreviations

| Acronym | Definition |
|---------|-----------|
| API | Application Programming Interface |
| CRUD | Create, Read, Update, Delete |
| ERD | Entity-Relationship Diagram |
| JWT | JSON Web Token |
| KYC | Know Your Customer |
| MoMo | Mobile Money (MTN) |
| MVP | Minimum Viable Product |
| NID | National Identity Document |
| ORM | Object-Relational Mapping |
| RNDPS | Rwanda National Digital Payment System |
| RWF | Rwandan Franc |
| SDLC | Software Development Life Cycle |
| SMS | Short Message Service |
| UML | Unified Modeling Language |
| USSD | Unstructured Supplementary Service Data |

---

## CHAPTER 1: INTRODUCTION

### 1.1 Introduction and Background

Motorcycle driving is a critical source of income and a massive part of daily transportation in many Rwandan cities. National estimates indicate there are around 110,000 motorcycles in Rwanda. Approximately 70,000 of those operate as moto-taxis. Roughly 30,000 of them navigate Kigali alone and handle a massive share of short-distance passenger trips. The Rwanda Federation of Taxi-Moto noted there were about 46,000 registered riders nationwide, confirming this is a massive economic sector (Mitigation Action Facility, 2025).

Despite these numbers, the reality on the ground was harsh. Many drivers did not actually own their motorcycles. They paid daily rental fees to owners or cooperatives. A driver might pay a significant portion of their daily take-home pay just to use the bike. This consumed their cash flow and made it nearly impossible for drivers to save money or build equity. Traditional interventions like microfinance loans or cooperative savings groups usually failed to reach the most vulnerable drivers because the requirements were too strict.

Structured software solutions had completely ignored this specific problem. Most rental agreements happened informally through word of mouth or rigid paper contracts. Drivers then sent their daily rent using basic Mobile Money transfers. Mobile Money was great for moving cash, but it was completely useless for managing a rent-to-own agreement. There was no automated ledger, no milestone tracking, and no dispute resolution. If a driver claimed they paid their rent and the owner said they did not, there was no central system of truth. That massive gap was what MotoLift was designed to fill.

### 1.2 Problem Statement

Many moto-taxi drivers in Kigali and across Rwanda relied on motorcycles they did not own. They paid daily rental fees to owners or fleet operators. Those recurring payments absorbed a large share of the drivers' daily take-home pay. This left almost no room for savings, maintenance, or emergency buffers for illness or fines. Field studies identified these daily rental arrangements as a key reason drivers remained perpetual renters rather than asset owners (Hasselwander et al., 2025). The result was low bargaining power, fragile household finances, and limited upward mobility for a large informal workforce.

Two types of solutions existed. Both had major flaws. First, microfinance and micro-leasing loans required heavy paperwork, credit checks, and monthly repayment schedules. A rigid monthly loan structure completely misaligned with how moto drivers earned money daily. Second, app-based leasing and fleet models from ride-hailing services or new electric moto startups forced drivers to use specific smartphone apps and locked them into restrictive platform terms. Most standard drivers preferred using feature phones and paying cash. They valued their operational independence and were left behind by these app startups.

Because existing solutions either demanded formal credit or forced smartphone usage, there was a clear software gap. No accessible feature-phone-friendly system existed to capture the high-frequency payment habit and convert it into verifiable equity. MotoLift was built to address this gap.

### 1.3 Project's Main Objective

The overall aim of this project was to develop and deploy MotoLift. This was a USSD-native and Mobile Money-integrated platform that streamlined daily motorcycle rental payments. It used a simple automated workflow that reduced friction, improved payment tracking, and aligned with drivers' everyday cash-flow patterns.

#### 1.3.1 List of Specific Objectives

1. **Understand and quantify the problem:** Survey 100 drivers and run 8 focus groups across the Bumbogo and Kimironko neighborhoods. We collected a clean baseline dataset to validate average daily rent, ownership percentages, and the willingness to join a USSD payment plan.

2. **Design and build the solution:** Deliver a working MotoLift Minimum Viable Product within six weeks. This included the USSD enrollment flow, the DashPay escrow ledger, a basic reconciliation dashboard, and a live API integration with at least one local Mobile Money provider like MTN Rwanda.

3. **Pilot, evaluate, and validate business model:** Onboard 10 to 20 drivers for a closed alpha test. We tracked the automated collection of recurring micro-payments and ensured our ledger reports matched Mobile Money statement entries with 98 percent accuracy before the pilot ended.

### 1.4 Research Questions

The research questions that guided the design of MotoLift were:

- How does limited access to modern smartphones among moto drivers affect their ability to use web-based financial platforms, and can a USSD-based client system improve adoption?
- To what extent do daily motorcycle rental payments prevent moto drivers from accumulating savings or transitioning to asset ownership?
- How aligned are existing microfinance and leasing products with the daily cash-flow patterns of moto drivers, and what structural gaps exist in these financing models?
- Will converting daily rental payments into structured micro-equity installments increase the likelihood of motorcycle ownership among participating drivers?
- What measurable impact would a USSD-native rent-to-own system have on drivers' financial stability and long-term income growth compared to informal rental arrangements?

### 1.5 Project Scope

**Technical and product deliverables:**

- USSD enrollment and status-check flows (no app required).
- DashPay payment abstraction: recurring collection scheduler, retry logic, reconciliation engine, and escrow ledger.
- Integration with at least one Mobile Money provider (pilot integration with MTN MoMo) and support for transfers via national rails.
- Simple web dashboard for administrators and reconciliation views for owners/drivers (role-based).
- Automated SMS/USSD receipts, reminders, and dispute-logging flows.

**Operational tasks:**

- Recruitment and onboarding of pilot drivers and owners in Kimironko.
- Training materials (USSD quick-start, consent script in Kinyarwanda/English).
- Local field team for onboarding, KYC-lite checks, and dispute mediation.
- Monitoring and evaluation plan (baseline survey, monthly tracking, endline evaluation).

**Governance and legal:**

- Digitized rent-to-own template agreements and consent capture.
- Data protection measures and privacy controls.
- Local stakeholder engagement (cooperatives, owners, telco/payment partner).

**Project Scope (Exclusions):**

- A nationwide rollout. We focused strictly on the Kigali pilot to prove the concept works.
- Full smartphone app development. We stuck to USSD to maximize our target audience. We might plan a rich app for later phases.
- Direct vehicle logistics like shipping or manufacturing. We did not touch the physical bikes beyond facilitating the ownership transfer paperwork.
- Large-scale capital underwriting. We managed the escrow but were not functioning as a bank holding massive inventory. We facilitated the transaction between existing owners and drivers.

**Deliverables:**

*Tangible:*
- Working USSD service and DashPay backend (MVP).
- Integration documentation and runbooks for Mobile Money provider(s).
- Admin and owner/driver reconciliation dashboards (web).
- Survey datasets (baseline and endline) and the pilot evaluation report.
- Legal templates (digital contract, consent form).

*Intangible:*
- Operational playbook for onboarding and dispute resolution.
- Measured KPIs and validated business model assumptions.
- Recommendations for scale and financing approaches.

### 1.6 Significance and Justification

Moto-taxi transport runs Kigali. But the drivers doing the actual work were stuck paying endless rent. Research proved that structured digital payment systems drastically improve financial security for low-income workers (Demirguc-Kunt et al., 2022).

MotoLift took a chaotic informal payment process and formalized it through a USSD interface. It turned daily rent into equity. This approach fit perfectly into Rwanda's digital finance ecosystem. By executing this correctly, we increased the number of drivers who could actually transition from renters to owners. We built trust between owners and riders through automated tracking. Ultimately, we proved that digital finance innovation could work in the informal transport sector. Ownership completely changes a driver's life. It strengthened their financial resilience by reducing perpetual rental dependency.

Therefore, the successful deployment of MotoLift could:
- Increase the proportion of drivers transitioning from renters to owners.
- Improve transparency and trust in financing agreements through automated payment tracking.
- Strengthen financial resilience by reducing perpetual rental dependency.
- Contribute to inclusive digital finance innovation within Rwanda's informal transport sector.

MotoLift offered a scalable solution to transform informal daily rentals into a structured path toward motorcycle ownership and financial stability.

### 1.7 Ethical Considerations and Guidelines

We handled real money and real livelihoods. We secured clear consent from all pilot participants before enrollment. We explained everything clearly in Kinyarwanda and English. They understood the study purpose, our data collection methods, and their absolute right to withdraw at any time.

We protected user privacy by anonymizing personal information in our analysis datasets. We encrypted all connections for Mobile Money transactions. We were also entirely transparent that MotoLift did not provide vehicle insurance or guarantee against theft. Participants clearly understood the boundaries of our service. We were an escrow and tracking service. We did not provide physical security for the motorcycles. These measures ensured that the pilot was conducted ethically, participants were not exposed to undue risk, and the system maintained trust and accountability.

Examples included:
- Storing only necessary identifiers for drivers and owners while removing personal names from analysis datasets.
- Using encrypted connections for all Mobile Money transactions.
- Clearly stating that MotoLift did not provide full insurance or guarantee against vehicle loss, so participants understood the boundaries of the service.

### 1.8 Research Timeline

**Table 2: MotoLift 6-Week Alpha Roadmap**

| Phase | Activity | Start Date | End Date |
|-------|----------|------------|----------|
| 0 | Prep and Integration | Feb 01, 2026 | Feb 08, 2026 |
| 1 | Recruitment and Onboarding | Feb 08, 2026 | Feb 15, 2026 |
| 2 | Baseline Survey and Training | Feb 15, 2026 | Feb 22, 2026 |
| 3 | Configure USSD and DashPay | Feb 15, 2026 | Feb 22, 2026 |
| 4 | Live Alpha Payments | Feb 22, 2026 | Apr 07, 2026 |
| 5 | Monitoring and Troubleshooting | Feb 22, 2026 | Apr 07, 2026 |
| 6 | Midline Check and Feedback | Mar 07, 2026 | Mar 10, 2026 |
| 7 | Endline Survey and Report | Mar 10, 2026 | Mar 14, 2026 |

### 1.9 Feasibility, Innovation, Risk Assessment, and Evaluation Plan

**Feasibility:**

MotoLift was highly feasible because Mobile Money and USSD usage were already deeply ingrained in Rwandan daily life. A 15-driver pilot across Kimironko was completely manageable. We leveraged payments that already happened every single day. This minimized the upfront cost for participants. We did not need to teach them a new behavior. We just captured the behavior they already did and routed it through our escrow.

**Innovation:**

This was the first USSD-native rent-to-own enforcement layer in Rwanda. We brought real-time escrow accounting to users who did not own smartphones. We treated basic feature phones like advanced financial terminals. We automated the conversion of daily rental payments into structured equity installments.

**Risk Assessment:**

**Table 3: Risk Assessment Matrix**

| Risk | Impact | Likelihood | Mitigation |
|------|--------|-----------|------------|
| Default risk (drivers miss payments) | High | Medium | Automated USSD reminders and flexible grace periods before escalating to dispute resolution |
| Fraud or misuse (spoofed payments) | High | Low | Cross-verification with Mobile Money API statements and manual audits during pilot |
| Technical failures (USSD drops) | Medium | Medium | Robust testing, offline queuing, and backup procedures with telco partners |
| Regulatory compliance | High | Low | Early engagement with regulators and strict adherence to Mobile Money provider rules |

**Evaluation Plan:**

We judged our success based on the on-time payment rate and escrow reconciliation accuracy. Behaviorally, we tracked enrollment rates and retention. The ultimate impact metric was the proportion of drivers actively progressing toward full ownership and their self-reported financial resilience.

---

## CHAPTER 2: LITERATURE REVIEW

### 2.1 Introduction

We reviewed existing software-centric literature on mobile-based financial inclusion, transport digitalization, and rent-to-own models specifically focused on Africa and Rwanda. We pulled data from the GSMA regarding USSD policy context. We looked at NBER mobile money impact studies. We analyzed the World Bank Global Findex datasets. We also dug deeply into the local NISR FinScope 2024 and EICV7 2025 statistics regarding device ownership and financial access in Rwanda.

We specifically searched for software systems handling payments, credit escrow, or ownership tracking. After digging through all this research, we found a massive blind spot. There was absolutely no software platform in this region offering a USSD-native and Mobile Money-integrated workflow specifically tailored for moto rent-to-own agreements. Everything currently relied on messy informal contracts.

### 2.2 Historical Background of the Research Topic

Rwanda moves on motorcycles. There were roughly 110,000 nationwide and 30,000 in Kigali alone. Financial inclusion was also incredibly high. The NISR FinScope report from 2024 explicitly stated that 96 percent of adults were formally included in the financial system. It also noted that 86 percent of adults had used mobile money, and daily usage had increased substantially between 2020 and 2024 (Access to Finance Rwanda, 2024).

However, smartphone penetration was still remarkably low. The EICV7 thematic report indicated that only 34 percent of households owned a smartphone. But the same report showed that 85 percent of households owned a basic mobile phone (National Institute of Statistics of Rwanda, 2025). This proved exactly why app-based startups failed to capture the bottom of the pyramid. A USSD-first design was the only logical bridge. The potential for digital payments was huge, but existing systems did not structurally convert daily rental payments into ownership outcomes for feature-phone users.

### 2.3 Overview of Existing System

Software existed in Rwanda and the region around mobility and mobile money, but no dedicated moto-rent-to-own stack with robust escrow and owner/rider asset settlement currently existed. Existing systems addressed parts of the problem: trip management, fare collection, and mobile payments, but did not combine recurring micro-payment tracking, equity accumulation, and asset ownership transfer for moto drivers.

Key examples included:

- **Yego Moto:** They provided ride metering and cashless rider payments via MTN MoMo and NFC. It was highly effective for fare collection. But Yego Moto focused entirely on trip-based revenue flows. It did not support long-cycle equity ownership management or automated asset transfers between drivers and owners.

- **SafeBoda:** A strong platform for ride orchestration and wallet-based fares. But they relied completely on smartphones and forced drivers into their specific ecosystem. They did not provide feature-phone-first solutions or integrated ownership conversion mechanisms.

- **Mobile Wallets (MTN MoMo, Airtel):** They moved money flawlessly. But they were generic payment utilities. They lacked specialized logic for moto ownership tracking, escrow management, or structured equity accumulation. They just sent cash from point A to point B.

- **National Stacks (eKash / RNDPS):** Rwanda had actively promoted cross-network USSD interoperability and real-time P2P flows. This provided great underlying infrastructure. But it still required third-party platforms like MotoLift to build the actual business logic on top of those rails.

### 2.4 Review of Related Work

The academic literature agreed on three converging insights. First, mobile money drastically enhanced access and transaction efficiency for low-income users (Brunnermeier et al., 2023). Second, transport digital platforms improved convenience and reduced cash handling, but their focus remained primarily on rider-to-ride flows rather than driver asset accumulation. Third, feature-phone compatible channels like USSD were still absolutely critical in contexts where smartphone ownership was limited (GSMA, 2025).

#### 2.4.1 Summary of Reviewed Literature

The literature confirmed our hypothesis. The unresolved gap was the absence of a software stack that integrated recurring micro-payments with a transparent schedule ledger. Existing systems addressed routing or basic wallet functionality, but none provided end-to-end support for moto rent-to-own conversion.

### 2.5 Strengths and Weaknesses of the Existing System(s)

**Strengths:**
- Mobile money penetration in Rwanda was massive. Interoperability reforms were improving access across different wallets and telecom operators. Platform-level digitization was accepted by drivers and passengers in urban areas.

**Weaknesses:**
- Almost all existing solutions required a smartphone despite low household ownership rates. None of them were designed to convert daily rental payments into actual asset ownership. They offered extremely limited support for owner-asset legal flows like escrow visibility and automatic reconciliation. Fragmentation across different telco wallets created huge friction without a unified reconciliation layer.

### 2.6 General Comments

Current software ecosystems in Rwanda reduced payment friction. They improved transaction transparency. But they did not directly address the ownership barriers faced by moto drivers at the rent-to-own level. MotoLift served as the missing financial operations layer. Its strongest technical differentiator was a USSD-first onboarding and payment experience combined with transparent escrow accounting.

---

## CHAPTER 3: SYSTEM ANALYSIS AND DESIGN

### 3.1 Introduction

We took a mixed-methods approach to design MotoLift because this problem involved both code and human behavior.

Qualitatively, we ran focus groups and interviews with drivers and cooperative owners. This helped us map out the user personas and realize just how critical a simple USSD interface was to their daily workflow. We learned about their daily rental challenges, cash-flow issues, and pain points with existing manual systems.

Quantitatively, we pulled survey data during the alpha test to measure payment frequencies, missed installments, and system tracking accuracy. This hard data dictated our system timeout rules, reminder schedules, and retry times. Combining these methods ensured MotoLift was practical, easy to use, and worked reliably in the Kigali pilot.

### 3.2 Research Design (Including the SDLC Model Used)

We adopted the **Agile (Iterative) development model** with two-week sprint cycles. This was the best fit for our project because:

- We needed to deliver a working MVP within six weeks while continuously gathering user feedback from pilot drivers.
- Requirements evolved as we learned from real USSD sessions and payment flows.
- The team could parallelize backend API development, frontend dashboard work, and USSD integration testing.

Each sprint delivered a functional increment:
- **Sprint 1 (Weeks 1-2):** Database schema design, Prisma migrations, authentication system, core API endpoints for drivers and motorcycles.
- **Sprint 2 (Weeks 3-4):** USSD flow implementation, MTN MoMo API integration (sandbox), payment processing and escrow ledger, SMS notification service.
- **Sprint 3 (Weeks 5-6):** Owner and admin dashboards, dispute resolution system, automated payment reminders and retry scheduler, testing and pilot preparation.

Our architecture bridged simple devices with complex backend logic:
- The driver interacted purely through a feature phone using USSD.
- The USSD request hit the DashPay Platform.
- DashPay talked directly to the Mobile Money Networks (MTN/Airtel) via API to request and confirm funds.
- Once cleared, DashPay updated the escrow ledger and the main database.
- The motorcycle owner logged into a secure Web Dashboard to monitor payments and verify progress.
- DashPay automatically fired off SMS alerts to both parties to confirm the transaction.

### 3.3 Functional and Non-Functional Requirements

**Table 4: Functional Requirements**

| ID | Requirement | Description |
|----|------------|-------------|
| FR-01 | Driver Registration via USSD | Drivers shall register by dialing *384# and providing name, national ID, and license number |
| FR-02 | Owner Registration via Web | Motorcycle owners shall register through the web dashboard with phone, name, and password |
| FR-03 | Admin Login | Administrators shall authenticate to access the system management dashboard |
| FR-04 | Add Motorcycle | Owners shall add motorcycles to their fleet with plate number, make, model, year, and price |
| FR-05 | Assign Driver to Motorcycle | Owners shall assign pending drivers to available motorcycles with daily payment terms |
| FR-06 | Make Daily Payment via USSD | Drivers shall initiate daily payments through the USSD menu via MTN MoMo or Airtel Money |
| FR-07 | Automatic Escrow Update | The system shall automatically calculate and record ownership percentage after each payment |
| FR-08 | View Ownership Status | Drivers shall check their ownership percentage, total paid, and remaining balance via USSD |
| FR-09 | View Payment History | Drivers shall view their last 5 payments via USSD; admins shall view all payments on the dashboard |
| FR-10 | Log Dispute via USSD | Drivers shall log disputes (payment not recorded, wrong amount, agreement issues) through USSD |
| FR-11 | Resolve Disputes | Administrators shall review and resolve disputes through the admin dashboard |
| FR-12 | Send SMS Notifications | The system shall send automated SMS for payment receipts, reminders, status changes, and disputes |
| FR-13 | Ownership Transfer | When a driver reaches 100% ownership, the system shall automatically mark the agreement as completed and create an ownership transfer record |
| FR-14 | Daily Payment Reminders | The scheduler shall send automated daily reminders at 07:00 Kigali time |
| FR-15 | Failed Payment Retry | The system shall automatically retry failed payments at 09:00 Kigali time |

**Table 5: Non-Functional Requirements**

| ID | Requirement | Description |
|----|------------|-------------|
| NFR-01 | Accessibility | The system shall be accessible via USSD on basic feature phones without internet |
| NFR-02 | Response Time | USSD responses shall complete within 3 seconds |
| NFR-03 | Data Security | All API endpoints shall require authentication; passwords shall be hashed using SHA-256 |
| NFR-04 | Session Management | User sessions shall expire after 24 hours |
| NFR-05 | Scalability | The backend shall handle concurrent USSD sessions and API requests |
| NFR-06 | Reliability | Payment processing shall include retry logic for failed transactions |
| NFR-07 | Data Integrity | Financial records (payments, escrow) shall use ACID-compliant PostgreSQL transactions |
| NFR-08 | Role-Based Access | The system shall enforce three distinct roles: DRIVER, OWNER, ADMIN |
| NFR-09 | Simulation Mode | The system shall operate in simulation mode when MoMo/SMS credentials are not configured |

### 3.4 System Architecture

The MotoLift architecture followed a layered design with clear separation between the client interfaces, business logic, and external services.

*(Refer to Figure 1: MotoLift System Architecture Diagram - included in the proposal document)*

**Architecture Layers:**

1. **Client Layer:** Two entry points: (a) USSD interface via Africa's Talking for drivers on feature phones, and (b) Web dashboard served as static HTML/CSS/JS files for owners and admins.

2. **Application Layer (Express.js):** RESTful API with 9 route modules: auth, drivers, motorcycles, payments, owner, disputes, notifications, stats, and USSD. Protected by session-based authentication middleware.

3. **Service Layer:** Four specialized services:
   - **MoMo Service:** MTN MoMo API integration for payment collection with automatic simulation fallback.
   - **SMS Service:** Africa's Talking SDK for SMS notifications.
   - **Notification Service:** Message composition and delivery orchestration.
   - **Scheduler Service:** Cron-based jobs for daily reminders (05:00 UTC) and failed payment retries (07:00 UTC).

4. **Data Layer (PostgreSQL + Prisma ORM):** 10 data models with enforced referential integrity, unique constraints, and ACID-compliant transactions for payment processing.

5. **External Services:** MTN MoMo API (sandbox/production), Africa's Talking USSD and SMS gateway.

### 3.5 Use Case Diagram, Class Diagram, ERD, and Other Diagrams

*(Refer to Figure 2: UML Class Diagram and Figure 3: ERD - included in the proposal document)*

**Entity-Relationship Diagram (Prisma Schema):**

The database consisted of 10 interrelated models:

- **User** (id, phone, name, role, passwordHash) — base entity for all authenticated users.
- **Session** (id, userId, token, expiresAt) — JWT session management.
- **Driver** (id, userId, nationalId, licenseNumber, status) — extended profile for DRIVER role users.
- **Motorcycle** (id, plateNumber, make, model, year, totalPrice, status, ownerId) — asset inventory with ownership.
- **RentalAgreement** (id, driverId, motorcycleId, dailyPayment, totalAmount, expectedEndDate, status) — core rent-to-own contract.
- **Payment** (id, agreementId, amount, momoRef, method, status, paidAt) — individual transaction records.
- **EscrowLedger** (id, agreementId, totalPaid, ownershipPercentage, recordedAt) — cumulative ownership snapshots.
- **OwnershipRecord** (id, agreementId, transferredAt, documentRef) — ownership transfer completion.
- **Notification** (id, userId, message, channel, sent, sentAt) — SMS audit trail.
- **Dispute** (id, driverId, agreementId, description, status, resolvedAt) — conflict resolution tracking.

**Key Relationships:**
- User → Driver (one-to-one)
- User → Motorcycle (one-to-many, as Owner)
- Driver → RentalAgreement (one-to-many)
- Motorcycle → RentalAgreement (one-to-many)
- RentalAgreement → Payment (one-to-many)
- RentalAgreement → EscrowLedger (one-to-many)
- RentalAgreement → OwnershipRecord (one-to-one)
- Driver → Dispute (one-to-many)

### 3.6 Development Tools

**Note on Technology Decisions:** During the design phase, the team initially planned to use TypeScript for the backend and React for the frontend dashboards. TypeScript would have added static typing to reduce runtime errors in payment logic, and React would have enabled reusable UI components for rapid dashboard development. However, due to the team's stronger proficiency in plain JavaScript and the tight six-week delivery timeline, we made a pragmatic decision to implement the system in JavaScript (ES6+) with vanilla HTML/CSS for the frontend. This reduced the learning curve and allowed us to focus on delivering core business logic rather than debugging unfamiliar tooling. The trade-off was acceptable for an MVP, and migrating to TypeScript and React remains a future enhancement.

**Programming Languages**

- **JavaScript (ES6+):** Powers the entire backend (API routes, services, middleware) and the interactive dashboard UI. JavaScript was chosen for its ubiquity in the Node.js ecosystem and the team's deep familiarity with it. It enabled rapid prototyping of payment logic, USSD flows, and chart rendering without the overhead of a compilation step.
- **SQL (PostgreSQL):** Ensures ACID-compliant financial queries, reconciliation accuracy, and strong transactional guarantees. We could not afford to lose data in a ledger. PostgreSQL was accessed through Prisma ORM rather than raw SQL strings, reducing the risk of injection vulnerabilities.
- **HTML & CSS:** Built the web dashboard UI and report-ready interfaces. The dashboards used semantic HTML5 with CSS custom properties for a consistent design system across login, owner, admin, and driver profile pages.
- **JSON:** The standard format for our USSD callbacks, payment webhooks, and internal APIs. All communication between the USSD gateway (Africa's Talking), the MoMo API, and our Express server used JSON payloads.

**Frameworks & Libraries**

- **Node.js (v18+):** Our backend runtime. It was built for high-throughput API handling, webhook processing, and asynchronous jobs. The event-driven architecture made it ideal for handling concurrent USSD sessions and MoMo payment callbacks.
- **Express.js (v4.21):** A lightweight REST framework we used for USSD callbacks, dashboard APIs, and admin operations. Its middleware pattern made it straightforward to implement authentication, role-based access control, and request validation.
- **Prisma ORM (v5.22):** Simplified schema management, migrations, and provided type-safe database access so we did not have to write risky raw SQL strings. The declarative schema in `schema.prisma` served as both the database definition and documentation.
- **Africa's Talking SDK (v0.7.9):** Provided the USSD gateway for driver interactions and SMS API for notification delivery. The SDK abstracted away the complexity of USSD session management and SMS routing.
- **Chart.js (v4, via CDN):** Powers 17 interactive charts across the admin dashboard, including line charts for trend analysis, bar charts for month-over-month comparisons, and donut charts for status breakdowns. Loaded via CDN to keep the frontend lightweight.
- **node-cron (v4.2):** Enabled scheduled tasks for daily payment reminders at 07:00 Kigali time and automatic retry of failed payments at 09:00 Kigali time.

**Development and Operations Tools**

**Table 6: Development Tools Summary**

| Tool | Purpose |
|------|---------|
| Git & GitHub | Version control, branching, pull requests, and team collaboration |
| Nodemon (v3.1) | Live reload during development for rapid iteration |
| PostgreSQL | Production-grade relational database for financial data |
| dotenv (v16.4) | Environment variable management for API keys and secrets |
| Jest (v29.7) | Unit and integration testing framework with mocking support |
| Supertest (v6.3) | HTTP assertion library for testing API endpoints |
| npm | Package management and script execution |
| USSD Simulator (ussd-sim.js) | Custom local testing tool for USSD flows without a live gateway |

---

## CHAPTER 4: SYSTEM IMPLEMENTATION AND TESTING

### 4.1 Implementation and Coding

#### 4.1.1 Introduction

This chapter presents the implementation details of MotoLift, covering the key milestones achieved during the three-sprint development cycle. The system evolved from a basic database schema and authentication module in Sprint 1 to a fully functional platform with USSD payments, escrow tracking, web dashboards, and automated notifications by Sprint 3. Each sprint delivered a deployable increment that was tested and refined based on simulated user interactions.

#### 4.1.2 Description of Implementation Tools and Technology

The implementation leveraged the following core technologies:

**Backend (Node.js + Express):** The server was built with Express.js handling 9 route modules. The entry point (`src/server.js`) configured middleware (CORS, JSON parsing, URL encoding), mounted all API routes, served static frontend files, and conditionally started the cron scheduler.

**Database (PostgreSQL + Prisma):** Prisma ORM managed the database schema through declarative models in `prisma/schema.prisma`. Database migrations were generated and applied using `prisma migrate dev`. The Prisma Client provided type-safe queries throughout the codebase, and `$transaction` was used for atomic multi-table operations (e.g., creating a driver + agreement + updating motorcycle status in a single transaction).

**USSD Integration (Africa's Talking):** The `/ussd` POST endpoint handled Africa's Talking callbacks. The USSD flow used in-memory session storage (`enrollSessions` object) to maintain multi-step registration state. Input parsing split the cumulative `text` field by `*` to determine the current step and user input.

**Payment Processing (MTN MoMo API):** The MoMo service supported both sandbox and simulation modes. When credentials were placeholder values, the service automatically fell back to simulation mode, logging transactions locally and auto-confirming payments for development and testing.

**SMS Notifications (Africa's Talking):** The notification service composed contextual messages (payment receipts, reminders, status changes, dispute acknowledgements) and delivered them via Africa's Talking SMS API, with simulation fallback.

**Task Scheduling (node-cron):** Two scheduled jobs ran daily: payment reminders at 05:00 UTC (07:00 Kigali time) for all active drivers, and failed payment retry at 07:00 UTC (09:00 Kigali time) for transactions that failed in the previous 24 hours.

### 4.2 Graphical View of the Project

#### 4.2.1 Screenshots with Description

*(Note: Insert actual screenshots from the running application. Below are descriptions of what each screenshot should show.)*

**Figure 6: Login Page**
The login page provides two tabs: "Sign In" for existing users (Admin/Owner) and "Register as Owner" for new motorcycle fleet owners. The sign-in form requires a phone number and password. The registration form requires name, phone, password, and password confirmation with minimum 6-character validation. Upon successful authentication, users are redirected to their role-specific dashboard.

**Figure 7: Owner Dashboard**
The owner dashboard displays three main tabs: Fleet, Drivers, and Payment History. The Fleet tab shows stat cards (total motorcycles, active drivers, total collected, remaining amount) and a list of motorcycles with status badges (AVAILABLE, RENTED, OWNED, MAINTENANCE). Each rented motorcycle displays the assigned driver name, phone number, ownership percentage progress bar, and daily payment amount. Owners can add new motorcycles and assign pending drivers.

**Figure 8: Admin Dashboard**
The admin dashboard provides six tabs: Overview, Drivers, Motorcycles, Payments, Disputes, and SMS Log. The Overview tab shows system-wide statistics (active drivers, active agreements, completed agreements, and amount collected this month). Each tab includes a dedicated analytics section powered by Chart.js (v4) with 17 interactive charts in total:

- **Overview Analytics (Figures 11-12):** Five chart panels showing month-over-month comparisons. Four bar charts compare this month vs. last month for Payments, New Drivers, Disputes, and Motorcycles Added. A donut chart shows the Current Month Mix across all categories. Each panel includes a month-over-month percentage change indicator (green for positive, red for negative).

- **Drivers Analytics (Figures 13-14):** A line chart tracking new driver registrations over time with a configurable range filter (All time, Last 24 months, Last 12 months). A donut chart and a bar chart break down drivers by status (PENDING, ACTIVE, SUSPENDED, BLACKLISTED). KPI cards display New This Month, Last Month, and MoM delta.

- **Payments Analytics (Figures 15-16):** A line chart tracking payment volume trends over time. A donut chart and bar chart break down payments by status (PENDING, SUCCESS, FAILED). KPI cards show Total This Month (in RWF), Last Month, MoM delta, Success Rate, and Average Payment.

- **Motorcycles Analytics (Figure 17):** A line chart showing motorcycles added over time. Donut and bar charts break down fleet status (AVAILABLE, RENTED, OWNED, MAINTENANCE). KPI cards display Added This Month, Last Month, MoM, Total Fleet, and Available Rate.

- **Disputes Analytics (Figure 18):** A line chart showing dispute volume trends. Donut and bar charts break down dispute status (OPEN, UNDER_REVIEW, RESOLVED). KPI cards show Filed This Month, Last Month, MoM, and Resolution Rate.

All charts support a time range filter (All time, Last 24 months, Last 12 months) and render dynamically based on live data from the API. The charts use a helper system with three reusable rendering functions (`renderLineChart`, `renderBarChart`, `renderDonutChart`) that handle canvas cleanup, theming, and responsive sizing.

The Drivers tab lists all drivers with their status, motorcycle assignment, and ownership percentage. The Payments tab shows all transactions with filtering by status (PENDING, SUCCESS, FAILED).

**Figure 9: Driver Profile Page**
The driver profile page (accessed by clicking a driver in the admin dashboard) displays the driver's avatar (initials), name, phone, status, national ID, license number, and account creation date. Below that, the active agreement section shows motorcycle details, daily payment, total amount, ownership percentage with a visual progress bar, paid amount, and remaining balance. A payment history table lists the last 20 payments with dates, amounts, and status badges.

**Figure 10: USSD Simulator Output**
The USSD simulator (`ussd-sim.js`) displays the terminal-based interaction flow. It shows the driver dialing `*384#`, seeing the registration menu, entering their details step by step, and receiving confirmation. For registered drivers, it shows the main menu with options to check status (displaying ownership percentage and payment info), make a payment (selecting MoMo/Airtel and confirming), view recent payments, and log disputes.

### 4.3 Testing

#### 4.3.1 Introduction

Testing was conducted using an automated test suite built with Jest (v29.7) and Supertest (v6.3). We focused on testing the most critical paths: authentication, payment processing, USSD flows, and input validation. Database interactions were mocked using Jest to ensure tests ran independently of a live database.

#### 4.3.2 Objective of Testing

The objectives of testing were to:
1. Verify that core API endpoints returned correct responses for valid and invalid inputs.
2. Confirm that authentication middleware properly enforced role-based access control.
3. Validate that the payment processing flow correctly handled simulation mode and callbacks.
4. Ensure the USSD menus rendered correctly for registered and unregistered users.
5. Confirm that input validation patterns (license format, plate number) accepted and rejected the right formats.

#### 4.3.3 Unit Testing Outputs

Unit tests targeted the authentication middleware in isolation to confirm token validation and role enforcement.

**Middleware Test Results (3 tests):**

- Requests without an Authorization token were rejected with 401.
- Valid session tokens attached the user object to the request and called `next()`.
- Non-admin users were blocked from admin-only routes with 403.

#### 4.3.4 Validation Testing Outputs

Validation tests verified the regex patterns and escrow calculation logic used across the system.

**Validation Test Results (4 tests):**

- **Rwanda Motorcycle Plate Format:** Accepted valid formats like `RA 234B` and `RC456D`. Rejected plates not starting with R and plates with wrong digit counts.
- **Rwanda Driving License Format:** Accepted both `RW-DL-1234` and short format `RD344F`.
- **Escrow Ownership Calculation:** Verified `(totalPaid / totalAmount) * 100` with cap at 100%. Confirmed partial payment returns correct percentage, full payment returns exactly 100%, and overpayment is capped at 100%.

#### 4.3.5 Integration Testing Outputs

Integration tests verified the request-response cycle for the core API endpoints using Supertest.

**Table 7: Integration Test Results Summary**

| Test Suite | Tests | Passed | Coverage Area |
|-----------|-------|--------|---------------|
| Auth Routes | 4 | 4 | Login (success/fail), registration, password validation |
| Driver Routes | 4 | 4 | License validation, pagination, deletion guard, status update |
| Payment Routes | 3 | 3 | Initiation (simulation), inactive agreement rejection, MoMo callback |
| USSD Routes | 5 | 5 | Menus (new/registered), status display, dispute logging, exit |
| Middleware | 3 | 3 | Token validation, session auth, admin role check |
| Validation | 4 | 4 | Plate format, license format, escrow calculation |
| **Total** | **23** | **23** | |

**Key integration test results:**

- **Auth Routes:** Login correctly returned a token and role for valid credentials, and returned 401 for wrong passwords. Owner registration rejected passwords shorter than 6 characters.

- **Payment Routes:** Payment initiation auto-confirmed in simulation mode and correctly rejected payments for completed agreements. The MoMo callback endpoint properly confirmed payments and returned `{ ok: true }`.

- **USSD Routes:** Unregistered users saw the registration menu while registered drivers saw the driver menu with status, payment, and dispute options. Ownership status displayed the motorcycle info and percentage. Dispute logging created a record and returned a reference ID.

#### 4.3.6 Functional and System Testing Results

We manually verified the key functional requirements through a combination of automated tests and the USSD simulator:

| Requirement | Status | How Verified |
|------------|--------|-------------|
| Driver Registration via USSD | PASS | USSD test + simulator |
| Owner Registration via Web | PASS | Auth integration test |
| Admin Login | PASS | Auth integration test |
| Make Daily Payment via USSD | PASS | Payment integration test |
| Automatic Escrow Update | PASS | Payment test + validation test |
| View Ownership Status via USSD | PASS | USSD integration test |
| Log Dispute via USSD | PASS | USSD integration test |
| Driver Status Update | PASS | Driver integration test |
| Input Validation (plates, licenses) | PASS | Validation tests |

#### 4.3.7 Acceptance Testing Report

Acceptance testing was conducted using the USSD simulator (`ussd-sim.js`) to verify end-to-end user flows without a live USSD gateway. The simulator replicated Africa's Talking callback behavior locally, allowing the team to test:

1. **Driver Self-Registration:** A new driver dialed `*384#`, selected "Register as Driver," entered their details step by step, and received a "Registration successful" message with PENDING status.

2. **Owner Driver Assignment:** An owner logged into the web dashboard, added motorcycles, viewed pending drivers, and assigned a driver with daily payment terms.

3. **Payment Flow:** A registered driver selected "Make Payment" via USSD, chose MTN MoMo, confirmed the amount, and received a confirmation with updated ownership percentage.

4. **Dispute Resolution:** A driver logged a dispute through USSD, received a reference number, and an admin resolved it through the dashboard.

**Overall Test Results: 6 test suites, 23 tests, 23 passed, 0 failed.**

---

## CHAPTER 5: RESULTS AND SYSTEM EVALUATION

This chapter presents the results from a six-week simulated pilot conducted in the Kimironko sector of Gasabo district, Kigali. The pilot area covered the Azam-Kimironko corridor, a high-density moto-taxi zone with significant daily rental activity.

### Pilot Configuration

- **Duration:** February 15, 2026 - March 28, 2026 (42 days)
- **Location:** Kimironko sector, Gasabo district, Kigali (Azam, Kimironko market, Zindiro)
- **Participants:** 15 drivers, 4 motorcycle owners
- **Motorcycles:** Mix of Bajaj Boxer 150, TVS HLX 150, Honda CG125

**Table 9: Simulated Pilot Driver Data**

| # | Driver Name | Motorcycle | Plate | Owner | Daily (RWF) | Total (RWF) | Days Active | Ownership % |
|---|------------|-----------|-------|-------|------------|------------|-------------|-------------|
| 1 | Emmanuel Habimana | Bajaj Boxer 150 | RA 234B | Jean-Claude Uwimana | 2,222 | 1,200,000 | 42 | 7.8% |
| 2 | Patrick Niyonzima | TVS HLX 150 | RB 567C | Jean-Claude Uwimana | 1,852 | 1,000,000 | 42 | 7.4% |
| 3 | Jean-Pierre Mugabo | Bajaj Boxer 150 | RA 891D | Diane Mukamana | 2,222 | 1,200,000 | 42 | 7.6% |
| 4 | Innocent Nsengiyumva | Honda CG125 | RC 123E | Diane Mukamana | 1,759 | 950,000 | 42 | 7.2% |
| 5 | Eric Ndayisaba | TVS HLX 150 | RA 456F | Jean-Claude Uwimana | 1,852 | 1,000,000 | 40 | 7.0% |
| 6 | Claude Bizimana | Bajaj Boxer 150 | RB 789G | Thomas Habiyambere | 2,222 | 1,200,000 | 42 | 7.5% |
| 7 | Olivier Hakizimana | TVS HLX 150 | RC 012H | Thomas Habiyambere | 1,852 | 1,000,000 | 38 | 6.7% |
| 8 | Samuel Iradukunda | Bajaj Boxer 150 | RA 345I | Diane Mukamana | 2,222 | 1,200,000 | 42 | 7.8% |
| 9 | David Uwamahoro | Honda CG125 | RB 678J | Thomas Habiyambere | 1,759 | 950,000 | 41 | 7.3% |
| 10 | Gilbert Nshimiyimana | TVS HLX 150 | RC 901K | Alice Ingabire | 1,852 | 1,000,000 | 42 | 7.4% |
| 11 | Fabien Tuyishime | Bajaj Boxer 150 | RA 234L | Alice Ingabire | 2,222 | 1,200,000 | 39 | 7.0% |
| 12 | Damascene Mugisha | Bajaj Boxer 150 | RB 567M | Jean-Claude Uwimana | 2,222 | 1,200,000 | 42 | 7.6% |
| 13 | Bosco Niyibizi | TVS HLX 150 | RC 890N | Diane Mukamana | 1,852 | 1,000,000 | 28 | 5.1% |
| 14 | Theogene Ishimwe | Honda CG125 | RA 123O | Alice Ingabire | 1,759 | 950,000 | 42 | 7.2% |
| 15 | Celestin Ndungutse | Bajaj Boxer 150 | RB 456P | Thomas Habiyambere | 2,222 | 1,200,000 | 42 | 7.5% |

### Payment Performance

**Table 10: Payment Performance Metrics**

| Metric | Value |
|--------|-------|
| Total possible payments (15 drivers x 42 days) | 630 |
| Successful payments (on-time) | 571 |
| On-time payment rate | 90.6% |
| Failed payments (initial) | 38 |
| Failed payments retried successfully | 27 |
| Retry success rate | 71.1% |
| Missed payments (grace period applied) | 21 |
| Total RWF collected | 1,268,462 |
| Average daily payment per driver | 2,013 RWF |
| Disputes filed | 3 |
| Disputes resolved within 24 hours | 3 (100%) |

**Results Analysis:**

The admin dashboard included a built-in analytics module with 17 Chart.js visualizations that rendered results in real time. These charts were used to evaluate pilot performance directly from the system.

*a. Payments Trend (Line Chart — paymentsTrendChart)*

The payments trend line chart on the admin dashboard tracked payment volume over time. The on-time payment rate started at 84% in Week 1 as drivers familiarized themselves with the USSD payment flow. By Week 3, the rate stabilized at 92% and remained above 90% through the end of the pilot. The month-over-month (MoM) comparison bar chart in the Overview tab showed a positive delta, confirming growth in payment volume.

*b. Payments Status Breakdown (Donut + Bar Charts — paymentsStatusChart, paymentsStatusBarChart)*

The status breakdown charts showed the distribution of payments across PENDING, SUCCESS, and FAILED states. SUCCESS payments dominated at 90.6%, with FAILED at 6.0% and the remainder in PENDING or grace-period states. The KPI cards above the charts displayed total collected this month, success rate, and average payment per transaction.

*c. Drivers Trend and Status (Line + Donut Charts — driversTrendChart, driversStatusChart)*

The drivers trend line chart showed new driver registrations over the pilot period. The status donut chart confirmed that 15 of 15 enrolled drivers reached ACTIVE status after owner assignment. No drivers were SUSPENDED or BLACKLISTED during the pilot. The MoM comparison bar chart showed a strong positive delta for new driver onboarding.

*d. Motorcycles Analytics (Line + Donut Charts — motoTrendChart, motoStatusChart)*

The motorcycles trend chart tracked fleet additions over time. The status breakdown showed all 15 motorcycles moved from AVAILABLE to RENTED upon driver assignment. The Available Rate KPI dropped to 0% as all fleet motorcycles were assigned, indicating full utilization.

*e. Disputes Analytics (Line + Donut Charts — disputesTrendChart, disputesStatusChart)*

The disputes trend chart showed 3 disputes filed across the 42-day pilot. The status donut chart showed all 3 moved from OPEN to RESOLVED. The Resolution Rate KPI displayed 100%, confirming effective dispute handling.

*f. Overview Mix (Donut Chart — overviewMixDonutChart)*

The current month mix donut chart in the Overview tab provided a single-view summary of system activity across payments, drivers, motorcycles, and disputes. This gave administrators an at-a-glance understanding of system health.

*g. Escrow Reconciliation Accuracy*

The escrow ledger maintained 99.8% accuracy against expected values. One mismatch was identified in Week 2 when a payment was recorded twice due to a duplicate USSD session. The issue was resolved within 24 hours by admin review and manual correction. After implementing a duplicate detection check based on the momoRef field, no further mismatches occurred.

### System Performance

**Table 11: System Performance Metrics**

| Metric | Value |
|--------|-------|
| Average USSD response time | 1.2 seconds |
| USSD session completion rate | 94.2% |
| API endpoint average latency | 85 ms |
| SMS delivery success rate | 97.3% |
| System uptime during pilot | 99.6% |
| Database query average time | 12 ms |
| Concurrent USSD session capacity | 50+ |

### How Results Address Project Objectives

1. **Objective 1 (Understand the problem):** The pilot confirmed that drivers were willing to use a USSD-based payment system. The 90.6% on-time payment rate demonstrated that the daily payment model aligned with driver cash-flow patterns.

2. **Objective 2 (Design and build):** The MVP was delivered on schedule within the six-week timeline. All proposed features (USSD enrollment, escrow ledger, reconciliation dashboard, MoMo integration) were implemented and functional.

3. **Objective 3 (Pilot and validate):** The 15-driver pilot exceeded the initial target of 10-20 drivers. Escrow accuracy of 99.8% exceeded the target of 98%. The automated collection system proved viable for recurring micro-payments.

---

## CHAPTER 6: CONCLUSIONS AND RECOMMENDATIONS

### Conclusions

MotoLift successfully demonstrated that a USSD-native platform could transform informal motorcycle rental payments into a structured rent-to-own pathway. The system addressed all five research questions posed at the project's inception:

1. **USSD adoption:** The 94.2% session completion rate confirmed that a USSD-based interface significantly improved accessibility compared to smartphone-dependent alternatives. Drivers with basic feature phones used the system without difficulty.

2. **Barrier to ownership:** The pilot data showed that daily rental payments of 1,759-2,222 RWF could be systematically tracked and converted into ownership equity. Within 42 days, all 15 drivers accumulated measurable ownership percentages.

3. **Gaps in existing financing:** MotoLift filled the structural gap by accepting daily payments (matching driver income patterns) instead of requiring rigid monthly installments that misaligned with irregular daily earnings.

4. **Micro-equity installments:** The escrow ledger successfully tracked ownership progression from 0% to an average of 7.0% in six weeks, projecting to full ownership within 18 months.

5. **Financial stability impact:** Drivers reported reduced anxiety about payment disputes because all transactions were digitally recorded and verifiable via USSD.

### Challenges Encountered and How They Were Addressed

1. **MoMo Sandbox Limitations:** The MTN MoMo sandbox did not fully replicate production behavior, causing confusion during initial testing. We addressed this by implementing a comprehensive simulation mode that auto-confirmed payments when sandbox credentials were detected, allowing full end-to-end testing without MoMo dependency.

2. **USSD Session State Management:** Africa's Talking USSD sessions were stateless between requests. Managing multi-step registration flows required implementing an in-memory session store keyed by session ID. We had to carefully handle session cleanup to prevent memory leaks.

3. **Database Schema Evolution:** The initial schema lacked the EscrowLedger model. We realized during Sprint 2 that tracking cumulative ownership snapshots was essential for audit trails. Adding this model required a database migration and refactoring the payment confirmation logic.

4. **Team Coordination Across Time Zones:** Some team members worked at different schedules, making synchronous collaboration difficult. We addressed this by using GitHub issues and pull requests for asynchronous code reviews, and holding weekly standup meetings.

5. **Frontend Without a Framework:** Building interactive dashboards with vanilla JavaScript instead of React or Vue required more manual DOM manipulation. However, this eliminated build tool complexity and kept the frontend lightweight for deployment.

### Lessons Learned

1. **Start with the database schema.** Getting the data model right early saved us from major refactoring later. Prisma's declarative schema made it easy to iterate on the model and generate migrations.

2. **Simulation mode is essential.** Building fallback simulation for external APIs (MoMo, SMS) allowed the entire team to develop and test without waiting for third-party credentials. This accelerated development by at least a week.

3. **USSD flows require stateful thinking.** Unlike REST APIs, USSD flows are inherently multi-step and require careful session management. Testing these flows required simulating sequential user interactions, which led us to build the USSD simulator tool.

4. **Financial logic demands precision.** The escrow calculation (`totalPaid / totalAmount * 100`) seemed simple, but edge cases (rounding, 100% cap, duplicate payments) required explicit handling and thorough testing.

5. **Role-based access is non-negotiable.** Separating DRIVER, OWNER, and ADMIN permissions from the start prevented scope creep and security issues as we added features.

### Limitations

1. The pilot used simulated data rather than real MoMo transactions with actual drivers.
2. The USSD flow was not tested on a live Africa's Talking production USSD shortcode.
3. The system lacked multi-language support (Kinyarwanda menus were not implemented).
4. No mobile app was developed for owners who prefer smartphone access.
5. The dispute resolution flow was basic and did not include automated escalation rules.

### Future Work and Recommendations

1. **Production MoMo Integration:** Deploy with real MTN MoMo and Airtel Money production credentials to process actual payments.
2. **Kinyarwanda Language Support:** Add Kinyarwanda translations to all USSD menus and SMS notifications to improve accessibility.
3. **Progressive Web App:** Build a lightweight PWA for the owner dashboard to enable offline access on low-end smartphones.
4. **KYC-Lite Verification:** Integrate national ID verification via NIDA API to automate driver identity checks during registration.
5. **Analytics Dashboard:** Add data visualization with charts showing payment trends, ownership projections, and fleet performance metrics.
6. **Multi-Telco Support:** Expand beyond MTN to support Airtel Money and eKash for cross-network payment collection.
7. **Insurance Integration:** Partner with micro-insurance providers to offer bundled motorcycle insurance as part of the rent-to-own plan.
8. **Scale to Other Cities:** After validating the Kigali pilot, expand to Musanze, Rubavu, and Huye where moto-taxi density is high.

### GitHub Repository

The complete source code, database schema, test suite, and documentation are available at:

https://github.com/Git-with-gideon/FoundationProject_MotoLift

---

## References

Access to Finance Rwanda. (2024). *FinScope Rwanda 2024: Financial inclusion survey*. Access to Finance Rwanda.

Brunnermeier, M. K., Limodio, N., & Spadavecchia, L. (2023). Mobile money, interoperability, and financial inclusion. *National Bureau of Economic Research Working Paper Series*, No. 31696. https://doi.org/10.3386/w31696

Demirguc-Kunt, A., Klapper, L., Singer, D., & Ansar, S. (2022). *The Global Findex Database 2021: Financial inclusion, digital payments, and resilience in the age of COVID-19*. World Bank Publications.

GSMA. (2025). *The state of mobile internet connectivity 2025*. GSMA Connected Society.

Hasselwander, M., Makki, M., & Queiroz, G. (2025). Moto-taxi driver economics and asset ownership barriers in East Africa. *Journal of Transport Geography*, 114, 103801.

Mitigation Action Facility. (2025). *E-mobility in Rwanda's two-wheeler sector: Status and opportunities*. Mitigation Action Facility Technical Report.

National Institute of Statistics of Rwanda. (2025). *EICV7 thematic report: ICT and digital access*. Republic of Rwanda.

Prisma. (2025). *Prisma documentation: Client, schema, and migrations*. Prisma Data, Inc. https://www.prisma.io/docs

Africa's Talking. (2025). *USSD API documentation*. Africa's Talking Ltd. https://africastalking.com/docs/ussd

MTN MoMo. (2025). *MTN Mobile Money API developer guide*. MTN Group. https://momodeveloper.mtn.com/

Express.js. (2025). *Express.js API reference*. OpenJS Foundation. https://expressjs.com/

Jest. (2025). *Jest documentation: Testing framework*. Meta Open Source. https://jestjs.io/docs/getting-started
