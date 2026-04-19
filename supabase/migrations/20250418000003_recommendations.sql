-- ============================================================
-- Add recommend_count to centers
-- ============================================================
ALTER TABLE centers ADD COLUMN IF NOT EXISTS recommend_count integer NOT NULL DEFAULT 0;

-- ============================================================
-- Recommendations table
-- ============================================================
CREATE TABLE IF NOT EXISTS recommendations (
  id         uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  center_id  uuid        NOT NULL REFERENCES centers(id) ON DELETE CASCADE,
  device_id  text        NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (center_id, device_id)
);

-- ============================================================
-- RLS: anyone can read and insert; no update/delete
-- ============================================================
ALTER TABLE recommendations ENABLE ROW LEVEL SECURITY;

CREATE POLICY "anon_select_recommendations"
  ON recommendations FOR SELECT TO anon, authenticated
  USING (true);

CREATE POLICY "anon_insert_recommendations"
  ON recommendations FOR INSERT TO anon, authenticated
  WITH CHECK (true);

-- ============================================================
-- RPC: increment recommend_count atomically
-- ============================================================
CREATE OR REPLACE FUNCTION increment_recommend_count(center_id_arg uuid)
RETURNS void
LANGUAGE sql
SECURITY DEFINER
AS $$
  UPDATE centers
  SET recommend_count = recommend_count + 1
  WHERE id = center_id_arg;
$$;
