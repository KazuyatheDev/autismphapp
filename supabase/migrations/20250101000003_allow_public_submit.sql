-- ─────────────────────────────────────────────────────────────────────────────
-- Allow anyone (anon) to INSERT into centers with status = 'pending'
-- Required for the public Submit a Center form to work
-- ─────────────────────────────────────────────────────────────────────────────

create policy "Anyone can submit a center for review"
  on public.centers for insert
  with check (status = 'pending');
