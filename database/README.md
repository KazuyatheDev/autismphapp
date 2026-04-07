# Autismph — Database Setup

Follow these steps to connect the app to your own Supabase project.

---

## Step 1 — Create a Supabase Project

1. Go to [https://supabase.com](https://supabase.com) and sign in (or create a free account).
2. Click **New project**.
3. Fill in the project name (e.g. `autismph`), set a strong database password, and choose the region closest to the Philippines (Singapore is recommended).
4. Click **Create new project** and wait about 60 seconds for the project to initialize.

---

## Step 2 — Run the Schema

1. In your Supabase dashboard, go to **SQL Editor** (left sidebar).
2. Click **New query**.
3. Open `schema.sql` from this folder, copy all the contents, paste into the editor.
4. Click **Run** (or press `Ctrl+Enter`).

This creates the `centers` table, enables Row Level Security, and adds the read policy so only approved centers are publicly visible.

---

## Step 3 — Seed the Database

1. Still in the SQL Editor, click **New query** again.
2. Open `seed.sql` from this folder, copy all the contents, paste into the editor.
3. Click **Run**.

This inserts 15 approved dummy centers across NCR, CALABARZON, Central Luzon, Visayas, and Mindanao — enough to test all search and filter features.

---

## Step 4 — Get Your API Keys

1. In the Supabase dashboard, go to **Project Settings** (gear icon, left sidebar).
2. Click the **API** tab.
3. Copy your **Project URL** (looks like `https://xxxxxxxxxxxx.supabase.co`).
4. Copy your **anon / public** key (the long `eyJ...` string under "Project API keys").

---

## Step 5 — Configure the App

1. Open `index.html` in a text editor.
2. Find the config block near the top of the `<script>` tag:

```js
// ─── SUPABASE CONFIG ─────────────────────────────────────────────────
const SUPABASE_URL = 'https://your-project-ref.supabase.co';
const SUPABASE_ANON_KEY = 'your-anon-public-key-here';
// ─────────────────────────────────────────────────────────────────────
```

3. Replace the placeholder strings with the values you copied in Step 4.
4. Save the file.

---

## Step 6 — Run Locally

Open a terminal in the project root and run:

```bash
# Python 3
python -m http.server 8080

# OR with Node.js (npx)
npx serve . -p 8080
```

Then open [http://localhost:8080](http://localhost:8080) in your browser.

> **Why a local server?** Browsers block `fetch()` requests on `file://` URLs due to CORS. A simple HTTP server on localhost fixes this.

---

## Notes

- RLS is already enabled by `schema.sql` — no manual toggle needed in the dashboard.
- The `anon` key is safe to expose publicly; it can only read approved centers (as enforced by RLS).
- To add real centers, insert rows via the Supabase Table Editor or SQL Editor with `status = 'approved'`.
