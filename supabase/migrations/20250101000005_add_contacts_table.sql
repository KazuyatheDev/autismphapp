-- ─────────────────────────────────────────────────────────────────────────────
-- Autismph — Contacts / Feedback submissions
-- Run in Supabase SQL Editor
-- ─────────────────────────────────────────────────────────────────────────────

create table public.contacts (
  id         uuid primary key default gen_random_uuid(),
  name       text not null,
  email      text not null,
  reason     text not null check (reason in (
               'Inquire/Contact us',
               'Feedback',
               'Update the Center/program information',
               'Others'
             )),
  message    text not null,
  created_at timestamptz default now()
);

-- Enable Row Level Security
alter table public.contacts enable row level security;

-- Allow anyone (anon) to insert a contact submission
create policy "Anyone can submit contact"
  on public.contacts for insert
  with check (true);

-- Index for filtering by reason
create index contacts_reason_idx on public.contacts using btree (reason);
