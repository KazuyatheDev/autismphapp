-- ─────────────────────────────────────────────────────────────────────────────
-- Add email, website, facebook_url columns to centers
-- Run in Supabase SQL Editor after previous migrations
-- ─────────────────────────────────────────────────────────────────────────────

alter table public.centers
  add column if not exists email        text,
  add column if not exists website      text,
  add column if not exists facebook_url text;
