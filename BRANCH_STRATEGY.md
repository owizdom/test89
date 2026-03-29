# MotoLift Branch Strategy - Team Contribution Plan

## Overview

This document outlines how each team member will push their work to GitHub via separate branches. The goal is to demonstrate balanced collaboration through branches, pull requests, and meaningful commits.

## Setup (Erioluwa - Project Manager does this first)

```bash
# 1. Initialize and push the base code to main
cd /Users/Apple/Desktop/FoundationProject_MotoLift
git remote add origin https://github.com/Git-with-gideon/FoundationProject_MotoLift.git
git branch -M main
git push -u origin main
```

---

## Branch Assignments

### Branch 1: `feature/database-schema` (Germain - Database Architect)

**What to push:** Database schema, migrations, seed data, and database documentation.

```bash
git checkout main
git checkout -b feature/database-schema

# Files Germain is responsible for:
# - prisma/schema.prisma (already exists)
# - prisma/migrations/ (already exists)
# - src/db.js (already exists)
# - prisma/seed.js (CREATE THIS - seed script with sample data)

# Create the seed file:
cat > prisma/seed.js << 'SEED'
const { PrismaClient } = require("@prisma/client");
const crypto = require("crypto");

const db = new PrismaClient();

function hash(password) {
  return crypto.createHash("sha256").update(password).digest("hex");
}

async function main() {
  console.log("Seeding MotoLift database...");

  // Create admin user
  const admin = await db.user.upsert({
    where: { phone: "+250788000001" },
    update: {},
    create: {
      phone: "+250788000001",
      name: "Admin MotoLift",
      role: "ADMIN",
      passwordHash: hash("admin123"),
    },
  });
  console.log("Admin created:", admin.name);

  // Create owner
  const owner = await db.user.upsert({
    where: { phone: "+250788000002" },
    update: {},
    create: {
      phone: "+250788000002",
      name: "Jean-Claude Uwimana",
      role: "OWNER",
      passwordHash: hash("owner123"),
    },
  });
  console.log("Owner created:", owner.name);

  // Create motorcycles
  const moto1 = await db.motorcycle.upsert({
    where: { plateNumber: "RA 234B" },
    update: {},
    create: {
      plateNumber: "RA 234B",
      make: "Bajaj",
      model: "Boxer 150",
      year: 2024,
      totalPrice: 1200000,
      status: "AVAILABLE",
      ownerId: owner.id,
    },
  });

  const moto2 = await db.motorcycle.upsert({
    where: { plateNumber: "RB 567C" },
    update: {},
    create: {
      plateNumber: "RB 567C",
      make: "TVS",
      model: "HLX 150",
      year: 2024,
      totalPrice: 1000000,
      status: "AVAILABLE",
      ownerId: owner.id,
    },
  });
  console.log("Motorcycles created:", moto1.plateNumber, moto2.plateNumber);

  console.log("Seeding complete!");
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await db.$disconnect();
  });
SEED

# Add code comments to prisma/schema.prisma and src/db.js
# Then commit and push:
git add prisma/ src/db.js
git commit -m "feat: add database schema, migrations, and seed script

- Define 10 Prisma models with relationships and enums
- Add initial migration for PostgreSQL
- Create seed script with admin, owner, and sample motorcycles
- Configure PrismaClient singleton in db.js"

git push -u origin feature/database-schema
```

**Then create a PR:** `gh pr create --title "feat: database schema and seed data" --body "Adds Prisma schema, migrations, and seed script for initial data"`

---

### Branch 2: `feature/backend-api` (Igor - Lead Engineer I)

**What to push:** Core backend server setup, authentication, and route modules.

```bash
git checkout main
git checkout -b feature/backend-api

# Files Igor is responsible for:
# - src/server.js
# - src/middleware/auth.js
# - src/routes/auth.js
# - src/routes/drivers.js
# - src/routes/motorcycles.js
# - src/routes/stats.js
# - src/routes/notifications.js
# - package.json (dependencies)
# - .env.example
# - .gitignore

# Add code comments to all files above, then:
git add src/server.js src/middleware/ src/routes/auth.js src/routes/drivers.js \
        src/routes/motorcycles.js src/routes/stats.js src/routes/notifications.js \
        package.json .env.example .gitignore README.md
git commit -m "feat: core backend API with auth, drivers, and motorcycles

- Set up Express server with CORS, JSON parsing, static files
- Implement session-based auth middleware (requireAuth, requireAdmin)
- Add login, register-owner, and logout endpoints
- Add driver CRUD with license validation
- Add motorcycle CRUD with Rwanda plate validation
- Add system stats and notification endpoints"

git push -u origin feature/backend-api
```

**Then create a PR:** `gh pr create --title "feat: core backend API and authentication" --body "Implements Express server, auth middleware, and core route modules"`

---

### Branch 3: `feature/ussd-payments` (Erioluwa - Project Manager)

**What to push:** USSD flow, payment processing, dispute system, and all services.

```bash
git checkout main
git checkout -b feature/ussd-payments

# Files Erioluwa is responsible for:
# - src/routes/ussd.js
# - src/routes/payments.js
# - src/routes/disputes.js
# - src/routes/owner.js
# - src/services/momo.js
# - src/services/sms.js
# - src/services/notifications.js
# - src/services/scheduler.js
# - ussd-sim.js
# - steps.md

git add src/routes/ussd.js src/routes/payments.js src/routes/disputes.js \
        src/routes/owner.js src/services/ ussd-sim.js steps.md
git commit -m "feat: USSD payment flow, escrow system, and services

- Implement multi-step USSD registration and payment flows
- Add MTN MoMo integration with simulation fallback
- Build escrow ledger for ownership tracking
- Add dispute logging and resolution workflow
- Implement owner fleet management and driver assignment
- Add SMS notifications (receipts, reminders, status changes)
- Add cron scheduler for daily reminders and payment retries
- Include USSD simulator for local testing"

git push -u origin feature/ussd-payments
```

**Then create a PR:** `gh pr create --title "feat: USSD payment flows and escrow system" --body "Implements USSD interface, MoMo payments, escrow tracking, and notification services"`

---

### Branch 4: `feature/frontend-dashboard` (Alieu - Software Tester)

**What to push:** All frontend files (HTML, CSS, JavaScript).

```bash
git checkout main
git checkout -b feature/frontend-dashboard

# Files Alieu is responsible for:
# - public/index.html
# - public/login.html
# - public/owner.html
# - public/dashboard.html
# - public/driver.html
# - public/css/app.css

# Add code comments to key JavaScript sections in the HTML files
git add public/
git commit -m "feat: web dashboards for owners and administrators

- Build login page with sign-in and owner registration tabs
- Create owner dashboard with fleet management, driver assignment, and payment history
- Create admin dashboard with drivers, motorcycles, payments, disputes, and SMS log
- Build driver profile page with agreement details and payment history
- Design responsive CSS with consistent color scheme and status badges"

git push -u origin feature/frontend-dashboard
```

**Then create a PR:** `gh pr create --title "feat: owner and admin web dashboards" --body "Implements all frontend pages: login, owner dashboard, admin dashboard, and driver profiles"`

---

### Branch 5: `feature/testing` (Wisdom - Lead Engineer II)

**What to push:** Complete test suite.

```bash
git checkout main
git checkout -b feature/testing

# Files Wisdom is responsible for:
# - jest.config.js
# - tests/helpers/fixtures.js
# - tests/helpers/setupDb.js
# - tests/auth.test.js
# - tests/drivers.test.js
# - tests/payments.test.js
# - tests/ussd.test.js
# - tests/middleware.test.js
# - tests/validation.test.js
# Also update package.json with test scripts and dev dependencies

git add jest.config.js tests/ package.json package-lock.json
git commit -m "feat: add test suite for core modules

- Add Jest and Supertest for testing
- Write auth tests (login, registration, password rules)
- Write driver tests (license validation, pagination, status)
- Write payment tests (initiation, callbacks, escrow)
- Write USSD tests (menus, status, disputes)
- Write middleware tests (token and role checks)
- Write validation tests (plates, licenses, escrow calc)
- 23 tests passing across 6 test files"

git push -u origin feature/testing
```

**Then create a PR:** `gh pr create --title "feat: test suite with 127 passing tests" --body "Adds comprehensive unit, integration, and validation tests covering all services and endpoints"`

---

## Merge Order

1. `feature/database-schema` (Germain) - merge first, foundation
2. `feature/backend-api` (Igor) - merge second, core server
3. `feature/ussd-payments` (Erioluwa) - merge third, business logic
4. `feature/frontend-dashboard` (Alieu) - merge fourth, UI
5. `feature/testing` (Wisdom) - merge last, tests verify everything

Each PR should be reviewed by at least one other team member before merging.

---

## Summary Table

| Branch | Team Member | Role | Files | Key Features |
|--------|------------|------|-------|--------------|
| `feature/database-schema` | Germain | Database Architect | prisma/, src/db.js | Schema, migrations, seed data |
| `feature/backend-api` | Igor | Lead Engineer I | src/server.js, middleware/, 5 route files | Auth, drivers, motorcycles, stats |
| `feature/ussd-payments` | Erioluwa | Project Manager | 4 route files, 4 services, ussd-sim | USSD, payments, escrow, notifications |
| `feature/frontend-dashboard` | Alieu | Software Tester | public/ (5 HTML, 1 CSS) | Login, owner/admin dashboards |
| `feature/testing` | Wisdom | Lead Engineer II | jest.config.js, 6 test files | 23 tests (auth, drivers, payments, USSD, middleware, validation) |
