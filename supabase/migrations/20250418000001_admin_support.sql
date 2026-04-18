-- ============================================================
-- Add status column to contacts table (for resolved tracking)
-- ============================================================
ALTER TABLE contacts ADD COLUMN IF NOT EXISTS status text NOT NULL DEFAULT 'open';

-- ============================================================
-- Create center_feedback table (suggest-update submissions)
-- ============================================================
CREATE TABLE IF NOT EXISTS center_feedback (
  id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  center_id   uuid REFERENCES centers(id) ON DELETE SET NULL,
  center_name text,
  message     text NOT NULL,
  contact     text,
  status      text NOT NULL DEFAULT 'open',
  created_at  timestamptz NOT NULL DEFAULT now()
);

-- ============================================================
-- RLS: allow anon inserts to center_feedback (public submit)
-- ============================================================
ALTER TABLE center_feedback ENABLE ROW LEVEL SECURITY;

CREATE POLICY IF NOT EXISTS "anon_insert_center_feedback"
  ON center_feedback FOR INSERT TO anon
  WITH CHECK (true);

-- Admin reads (authenticated users only)
CREATE POLICY IF NOT EXISTS "auth_select_center_feedback"
  ON center_feedback FOR SELECT TO authenticated
  USING (true);

CREATE POLICY IF NOT EXISTS "auth_update_center_feedback"
  ON center_feedback FOR UPDATE TO authenticated
  USING (true);

-- ============================================================
-- RLS: allow authenticated users to read/update contacts
-- ============================================================
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE tablename = 'contacts' AND policyname = 'auth_select_contacts'
  ) THEN
    CREATE POLICY "auth_select_contacts"
      ON contacts FOR SELECT TO authenticated
      USING (true);
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE tablename = 'contacts' AND policyname = 'auth_update_contacts'
  ) THEN
    CREATE POLICY "auth_update_contacts"
      ON contacts FOR UPDATE TO authenticated
      USING (true);
  END IF;
END $$;
