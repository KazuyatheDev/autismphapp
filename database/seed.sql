-- ─────────────────────────────────────────────────────────────────────────────
-- Autismph — Seed Data
-- 15 approved dummy centers for testing
-- Run this AFTER schema.sql
-- ─────────────────────────────────────────────────────────────────────────────

insert into public.centers (name, city, region, type, services, address, contact, status) values

  -- NCR
  (
    'Shine Bright Therapy Center',
    'Quezon City', 'NCR', 'center',
    ARRAY['OT', 'ST', 'ABA'],
    '123 Katipunan Ave, Loyola Heights, Quezon City',
    '0917-123-4567',
    'approved'
  ),
  (
    'Learning Steps Therapy Hub',
    'Makati', 'NCR', 'center',
    ARRAY['OT', 'ST', 'ABA', 'SPED'],
    '456 Ayala Ave cor. Salcedo St, Makati City',
    '0918-234-5678',
    'approved'
  ),
  (
    'Rising Stars Therapy Center',
    'Pasig', 'NCR', 'center',
    ARRAY['OT', 'ST'],
    '789 Ortigas Ave Extension, Pasig City',
    '0919-345-6789',
    'approved'
  ),
  (
    'BridgeWay Autism Center',
    'Taguig', 'NCR', 'center',
    ARRAY['ABA', 'OT'],
    '25th St, Bonifacio Global City, Taguig',
    '0920-456-7890',
    'approved'
  ),
  (
    'Potential Academy SPED School',
    'Mandaluyong', 'NCR', 'school',
    ARRAY['SPED'],
    '88 Shaw Blvd, Wack-Wack, Mandaluyong City',
    '0921-567-8901',
    'approved'
  ),
  (
    'Marikina Developmental Center',
    'Marikina', 'NCR', 'center',
    ARRAY['OT', 'ST', 'SPED'],
    '12 JP Rizal St, Concepcion Dos, Marikina City',
    '0922-678-9012',
    'approved'
  ),
  (
    'Wings SPED School',
    'Parañaque', 'NCR', 'school',
    ARRAY['SPED', 'OT'],
    '45 Dr. A. Santos Ave, BF Homes, Parañaque City',
    '0923-789-0123',
    'approved'
  ),

  -- CALABARZON
  (
    'Bacoor Therapy & Learning Center',
    'Bacoor', 'CALABARZON', 'center',
    ARRAY['OT', 'ST'],
    'Molino Blvd cor. Aguinaldo Hwy, Bacoor, Cavite',
    '0924-890-1234',
    'approved'
  ),
  (
    'Laguna Autism Support Center',
    'Calamba', 'CALABARZON', 'center',
    ARRAY['ABA', 'OT', 'ST'],
    'National Highway, Parian, Calamba, Laguna',
    '0925-901-2345',
    'approved'
  ),

  -- Visayas
  (
    'Cebu Therapy Institute',
    'Cebu City', 'Central Visayas', 'center',
    ARRAY['OT', 'ST', 'ABA'],
    '15 Colon St, Parian, Cebu City',
    '0926-012-3456',
    'approved'
  ),
  (
    'Iloilo SPED Resource Center',
    'Iloilo City', 'Western Visayas', 'school',
    ARRAY['SPED', 'ST'],
    'Molo District, Iloilo City',
    '0927-123-4568',
    'approved'
  ),

  -- Mindanao
  (
    'Davao Autism Support Center',
    'Davao City', 'Davao Region', 'center',
    ARRAY['OT', 'ST', 'ABA', 'SPED'],
    'Buhangin Rd, Davao City',
    '0928-234-5679',
    'approved'
  ),
  (
    'Northern Mindanao Therapy Hub',
    'Cagayan de Oro', 'Northern Mindanao', 'center',
    ARRAY['OT', 'ABA'],
    'Divisoria Market Area, Cagayan de Oro City',
    '0929-345-6780',
    'approved'
  ),

  -- Others
  (
    'Baguio Learning & Therapy Center',
    'Baguio', 'Cordillera', 'center',
    ARRAY['OT', 'ST', 'SPED'],
    '22 Session Road, Baguio City',
    '0930-456-7891',
    'approved'
  ),
  (
    'Malolos SPED Academy',
    'Malolos', 'Central Luzon', 'school',
    ARRAY['SPED', 'OT'],
    'Paseo Del Congreso, Malolos, Bulacan',
    '0931-567-8902',
    'approved'
  );
