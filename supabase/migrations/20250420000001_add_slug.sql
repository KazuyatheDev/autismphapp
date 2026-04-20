-- ============================================================
-- Add slug column to centers for shareable detail page URLs
-- Run this in the Supabase SQL Editor
-- ============================================================

ALTER TABLE centers ADD COLUMN IF NOT EXISTS slug text;

-- Generate slugs from name: lowercase, non-alphanumeric runs → hyphen
UPDATE centers
SET slug = regexp_replace(
  regexp_replace(lower(trim(name)), '[^a-z0-9]+', '-', 'g'),
  '^-+|-+$', '', 'g'
)
WHERE slug IS NULL;

-- Deduplicate: append first 8 chars of id where slug collides
WITH ranked AS (
  SELECT id, slug,
         ROW_NUMBER() OVER (PARTITION BY slug ORDER BY created_at) AS rn
  FROM centers
  WHERE slug IS NOT NULL
)
UPDATE centers c
SET slug = c.slug || '-' || LEFT(c.id::text, 8)
FROM ranked r
WHERE c.id = r.id AND r.rn > 1;

CREATE UNIQUE INDEX IF NOT EXISTS centers_slug_idx ON centers (slug);
