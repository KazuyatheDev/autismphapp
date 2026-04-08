-- ─────────────────────────────────────────────────────────────────────────────
-- Add updated_at column and auto-update trigger to centers table
-- Run in Supabase SQL Editor after the previous two migrations
-- ─────────────────────────────────────────────────────────────────────────────

alter table public.centers
  add column if not exists updated_at timestamptz default now();

-- Backfill existing rows
update public.centers set updated_at = created_at where updated_at is null;

-- Auto-update trigger
create or replace function public.handle_centers_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists on_centers_updated on public.centers;
create trigger on_centers_updated
  before update on public.centers
  for each row execute procedure public.handle_centers_updated_at();
