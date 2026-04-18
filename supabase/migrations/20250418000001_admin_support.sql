-- ============================================================
-- Add status column to contacts table (for resolved tracking)
-- ============================================================
ALTER TABLE contacts ADD COLUMN IF NOT EXISTS status text NOT NULL DEFAULT 'open';

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
