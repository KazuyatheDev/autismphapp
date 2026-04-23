-- Run this once in the Supabase SQL Editor (Dashboard → SQL Editor → New Query)
-- Creates a server-side function that checks if the current user is an admin.
-- The admin email is stored in the database function, NOT in client-side source code.

CREATE OR REPLACE FUNCTION public.is_admin()
RETURNS boolean
LANGUAGE sql
SECURITY DEFINER
STABLE
AS $$
  SELECT EXISTS (
    SELECT 1
    FROM auth.users
    WHERE id = auth.uid()
      AND email = 'jeerowboy1@gmail.com'
  );
$$;

-- Allow any authenticated user to call this function
GRANT EXECUTE ON FUNCTION public.is_admin() TO authenticated;
