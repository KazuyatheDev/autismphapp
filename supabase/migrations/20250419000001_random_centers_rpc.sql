-- ============================================================
-- RPC: get_random_centers
-- Returns random approved centers, excluding already-seen IDs.
-- Used for the default landing page to show varied services.
-- ============================================================
CREATE OR REPLACE FUNCTION get_random_centers(
  limit_arg    int,
  exclude_ids  uuid[] DEFAULT '{}'
)
RETURNS SETOF centers
LANGUAGE sql
STABLE
SECURITY DEFINER
AS $$
  SELECT *
  FROM   centers
  WHERE  status = 'approved'
    AND  (cardinality(exclude_ids) = 0 OR id != ALL(exclude_ids))
  ORDER BY RANDOM()
  LIMIT  limit_arg;
$$;
