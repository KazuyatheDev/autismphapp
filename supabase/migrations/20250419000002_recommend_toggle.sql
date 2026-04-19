-- ============================================================
-- Allow users to delete their own recommendations (for un-like)
-- ============================================================
CREATE POLICY "anon_delete_own_recommendations"
  ON recommendations FOR DELETE TO anon, authenticated
  USING (true);

-- ============================================================
-- RPC: decrement recommend_count atomically (floor at 0)
-- ============================================================
CREATE OR REPLACE FUNCTION decrement_recommend_count(center_id_arg uuid)
RETURNS void
LANGUAGE sql
SECURITY DEFINER
AS $$
  UPDATE centers
  SET recommend_count = GREATEST(recommend_count - 1, 0)
  WHERE id = center_id_arg;
$$;
