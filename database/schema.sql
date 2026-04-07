-- ─────────────────────────────────────────────────────────────────────────────
-- Autismph — Therapy Center Directory
-- Schema: run this first in Supabase SQL Editor
-- ─────────────────────────────────────────────────────────────────────────────

create table public.centers (
  id          uuid primary key default gen_random_uuid(),
  name        text not null,
  city        text not null,
  region      text not null,
  type        text not null check (type in ('center', 'school')),
  services    text[] not null,
  address     text,
  contact     text,
  status      text not null default 'pending'
              check (status in ('pending', 'approved', 'rejected')),
  created_at  timestamptz default now()
);

-- Enable Row Level Security
alter table public.centers enable row level security;

-- Public users can only read approved centers
create policy "Public can view approved centers"
  on public.centers for select
  using (status = 'approved');

-- Optional: allow authenticated admins to manage all rows
-- Uncomment if you set up an admin role in Supabase Auth
-- create policy "Admins can manage all centers"
--   on public.centers for all
--   using (auth.role() = 'authenticated');

-- Index for faster city lookups
create index centers_city_idx on public.centers using btree (lower(city));
create index centers_status_idx on public.centers using btree (status);
