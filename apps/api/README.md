# Split API

NestJS REST API starter targeting Node.js 22+.

## Local development

```bash
cp .env.example .env
npm install
npm run start:dev
```

Check `GET /api/health` at `http://localhost:3000/api/health`.

## Scripts

- `npm run start:dev` — watch mode
- `npm run build` — compile to `dist/`
- `npm run start:prod` — run the compiled server

The health route is intentionally independent of PostgreSQL. The database URL is documented for the next step, when database access and migrations are introduced.
