-- ============================================================
-- Admin RLS: allow authenticated users full access to centers
-- (needed for the admin dashboard to read pending rows and
--  approve / reject them)
-- ============================================================

-- Read ALL centers (including pending / rejected)
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE tablename = 'centers' AND policyname = 'auth_select_all_centers'
  ) THEN
    CREATE POLICY "auth_select_all_centers"
      ON centers FOR SELECT TO authenticated
      USING (true);
  END IF;
END $$;

-- Update centers (approve → set status = 'approved')
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE tablename = 'centers' AND policyname = 'auth_update_centers'
  ) THEN
    CREATE POLICY "auth_update_centers"
      ON centers FOR UPDATE TO authenticated
      USING (true)
      WITH CHECK (true);
  END IF;
END $$;

-- Delete centers (reject → hard delete)
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE tablename = 'centers' AND policyname = 'auth_delete_centers'
  ) THEN
    CREATE POLICY "auth_delete_centers"
      ON centers FOR DELETE TO authenticated
      USING (true);
  END IF;
END $$;

-- ============================================================
-- Admin RLS: allow authenticated users full access to contacts
-- (in case the previous migration wasn't run yet)
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
      USING (true)
      WITH CHECK (true);
  END IF;
END $$;
