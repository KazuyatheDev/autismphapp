# Autismph

A free, community-driven directory of autism therapy centers and SPED schools across the Philippines.

Built as a single HTML file — no build step, no framework, no backend server.

---

## Stack

| Layer | Technology |
|-------|-----------|
| Frontend | Vanilla HTML + CSS + JS (single file) |
| Database | [Supabase](https://supabase.com) (Postgres + RLS) |
| Fonts | DM Serif Display + Plus Jakarta Sans (Google Fonts) |
| Supabase Client | CDN (`@supabase/supabase-js@2`) |

---

## Features

- **City autocomplete** — 97 Philippine cities with region labels, keyboard navigable
- **Facility type filters** — Therapy Center / School / SPED (multi-select, at least one required)
- **Service filters** — OT · ST · ABA · SPED (multi-select, at least one required)
- **Supabase query** — live data, RLS-enforced, city search via `ilike`
- **Staggered animations** — cards fade-up with 40ms stagger on each result render
- **Mobile-first** — responsive, works on any screen size

---

## File Structure

```
autismph/
├── index.html              ← entire app (HTML + CSS + JS inline)
├── assets/
│   └── data/
│       └── cities.json     ← 97 Philippine cities for autocomplete
├── database/
│   ├── schema.sql          ← table definition + RLS policies
│   ├── seed.sql            ← 15 dummy approved centers for testing
│   └── README.md           ← step-by-step Supabase setup guide
└── README.md               ← this file
```

---

## Quick Start

### 1. Set up the database

Follow the instructions in [`database/README.md`](database/README.md).

### 2. Configure the app

Open `index.html` and replace the placeholders at the top of the `<script>` tag:

```js
const SUPABASE_URL = 'https://your-project-ref.supabase.co';
const SUPABASE_ANON_KEY = 'your-anon-public-key-here';
```

### 3. Run locally

```bash
# Python 3
python -m http.server 8080

# OR Node.js
npx serve . -p 8080
```

Then visit **http://localhost:8080**

---

## Design

- **Colors:** `#0a0a0a` · `#737373` · `#e5e5e5` · `#f5f5f5` · `#ffffff`
- **Typography:** DM Serif Display (headings) · Plus Jakarta Sans (body)
- **Layout:** Mobile-first, max-width 900px content area
- **Animations:** CSS `fadeUp` keyframes, staggered via JS `setTimeout`

---

## License

Free to use. Community-maintained.
