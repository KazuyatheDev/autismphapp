-- ============================================================
-- Auto-generate slug on insert/update for centers table
-- Run this in the Supabase SQL Editor
-- ============================================================

CREATE OR REPLACE FUNCTION generate_center_slug()
RETURNS trigger LANGUAGE plpgsql AS $$
DECLARE
  base_slug text;
  final_slug text;
  counter    int := 0;
BEGIN
  -- Only generate if slug is missing or name changed
  IF NEW.slug IS NOT NULL AND (TG_OP = 'UPDATE' AND OLD.name = NEW.name) THEN
    RETURN NEW;
  END IF;

  base_slug := regexp_replace(
    regexp_replace(lower(trim(NEW.name)), '[^a-z0-9]+', '-', 'g'),
    '^-+|-+$', '', 'g'
  );
  final_slug := base_slug;

  -- Resolve collisions
  WHILE EXISTS (
    SELECT 1 FROM centers WHERE slug = final_slug AND id IS DISTINCT FROM NEW.id
  ) LOOP
    counter    := counter + 1;
    final_slug := base_slug || '-' || counter;
  END LOOP;

  NEW.slug := final_slug;
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_center_slug ON centers;

CREATE TRIGGER trg_center_slug
  BEFORE INSERT OR UPDATE OF name ON centers
  FOR EACH ROW
  WHEN (NEW.slug IS NULL OR NEW.slug = '')
  EXECUTE FUNCTION generate_center_slug();
