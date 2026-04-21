-- Comments table for community feedback on center detail pages
CREATE TABLE IF NOT EXISTS comments (
  id           uuid        DEFAULT gen_random_uuid() PRIMARY KEY,
  center_id    uuid        NOT NULL REFERENCES centers(id) ON DELETE CASCADE,
  device_id    text        NOT NULL,
  display_name text        NOT NULL,
  comment_text text        NOT NULL,
  created_at   timestamptz DEFAULT now(),
  status       text        NOT NULL DEFAULT 'pending',
  UNIQUE (center_id, device_id)
);

-- Row-Level Security
ALTER TABLE comments ENABLE ROW LEVEL SECURITY;

-- Public (anon): read only approved comments
CREATE POLICY "comments_select_approved"
  ON comments FOR SELECT TO anon
  USING (status = 'approved');

-- Authenticated (admin): read all comments
CREATE POLICY "comments_select_admin"
  ON comments FOR SELECT TO authenticated
  USING (true);

-- Anyone can submit (status must be 'pending')
CREATE POLICY "comments_insert"
  ON comments FOR INSERT
  WITH CHECK (status = 'pending');

-- Admin only: update (approve / reject)
CREATE POLICY "comments_update_admin"
  ON comments FOR UPDATE TO authenticated
  USING (true);

-- Admin only: delete
CREATE POLICY "comments_delete_admin"
  ON comments FOR DELETE TO authenticated
  USING (true);
