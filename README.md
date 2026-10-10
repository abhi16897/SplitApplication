# Split Application

A cross-platform expense-splitting application built with Flutter for Android, iOS, and web, backed by NestJS and PostgreSQL.

## Planned architecture

- `apps/mobile/` — Flutter app targeting Android, iOS, and web.
- `apps/api/` — NestJS REST API.
- `infra/` — local development and deployment infrastructure.
- PostgreSQL — persistent application data.

## Prerequisites

Install Flutter (including Android/iOS toolchains as needed), Node.js LTS, npm, Docker Desktop or another Docker-compatible runtime, and Git.

Verify the toolchain:

```bash
flutter doctor
node --version
npm --version
docker --version
```

## Getting started

The repository workspace is being initialized. Follow the per-app READMEs as the Flutter and NestJS scaffolds are added. The intended local database will be provided with Docker Compose.

## Development principles

- Keep UI, domain logic, and data access separated.
- Keep secrets in local environment files; never commit credentials.
- Validate configuration at startup and add automated tests alongside features.
- Use database migrations for schema changes.

## License

No license has been selected yet.
