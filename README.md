# Split Application

Split is a cross-platform shared-expenses application. The planned client uses Flutter for Android, iOS, and web; the API uses NestJS and PostgreSQL.

## Repository layout

```text
.
├── apps/
│   ├── api/                 # NestJS API
│   └── mobile/              # Flutter client (Android, iOS, web)
├── infra/                   # Infrastructure configuration (reserved)
├── scripts/                 # Developer bootstrap helpers
├── docker-compose.yml       # Local PostgreSQL
└── .github/workflows/       # CI checks
```

## Prerequisites

- Git
- Node.js 22 or newer and npm
- Flutter SDK (stable channel) and platform tooling for your target
- Docker Desktop or another Docker-compatible runtime

Verify your tools with `git --version`, `node --version`, `npm --version`, `flutter doctor`, and `docker --version`.

## Start PostgreSQL

From the repository root:

```bash
docker compose up -d postgres
docker compose ps
```

Local-only database defaults: database `split`, username `split`, password `split_local_password`, port `5432`. Do not reuse these development credentials in a deployed environment.

## Run the API

```bash
cd apps/api
cp .env.example .env
npm install
npm run start:dev
```

The API listens on port 3000 by default. Check [http://localhost:3000/api/health](http://localhost:3000/api/health). The starter health endpoint does not yet connect to PostgreSQL; database access and migrations will be added with the first data feature.

## Run the Flutter client

Generate the native/web runner folders once from the repository root:

```bash
./scripts/bootstrap-flutter-platforms.sh
```

Then run:

```bash
cd apps/mobile
flutter pub get
flutter run -d chrome
```

For Android or iOS, use a configured emulator/device and follow `flutter doctor`. iOS builds require macOS with Xcode.

## Verify locally

```bash
cd apps/api && npm install && npm run build
cd ../mobile && flutter pub get && flutter analyze && flutter test
```

## Engineering conventions

- Keep UI, domain logic, and infrastructure concerns separated.
- Put local secrets in ignored `.env` files; commit only `.env.example`.
- Introduce schema changes through versioned database migrations.
- Add unit/widget tests with feature changes.
- Keep credentials, tokens, and production data out of Git.

## Current scope

This starter includes the Flutter welcome screen, API health endpoint, PostgreSQL local service, bootstrap script, and CI checks. Expense groups, transactions, balances, authentication, and production infrastructure are not implemented yet.
