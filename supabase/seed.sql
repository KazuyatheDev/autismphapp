-- ─────────────────────────────────────────────────────────────────────────────
-- Autismph — Sample Centers Data (30 records)
-- Run AFTER both migrations. Safe to re-run (truncates first).
-- ─────────────────────────────────────────────────────────────────────────────

truncate table public.centers restart identity cascade;

insert into public.centers (name, city, region, type, services, address, contact, status) values

-- ── Metro Manila ─────────────────────────────────────────────────────────────
('Hope Therapy Center',
 'Quezon City', 'NCR', 'center', ARRAY['OT','ST','ABA'],
 '45 Katipunan Ave, Loyola Heights, Quezon City', '02-8123-4567', 'approved'),

('Rainbow Bridge SPED School',
 'Makati', 'NCR', 'school', ARRAY['SPED','OT'],
 '88 Pasong Tamo Ext, Makati City', '02-8765-4321', 'approved'),

('Bright Minds Therapy & Learning Center',
 'Taguig', 'NCR', 'center', ARRAY['OT','ST','ABA','SPED'],
 'Unit 3B Bonifacio High Street, BGC, Taguig', '02-8555-1234', 'approved'),

('Little Steps Therapy Center',
 'Pasig', 'NCR', 'center', ARRAY['OT','ABA'],
 '12 Ortigas Ave Extension, Rosario, Pasig', '02-8231-5678', 'approved'),

('Sunshine Therapy & Development Center',
 'Parañaque', 'NCR', 'center', ARRAY['ST','ABA'],
 '78 Dr. A. Santos Ave, Sucat, Parañaque', '02-8826-9900', 'approved'),

('Stars & Milestones Therapy',
 'Marikina', 'NCR', 'center', ARRAY['OT','ST'],
 '23 Sumulong Highway, Marikina Heights', '02-8682-3344', 'approved'),

('Compassion SPED Learning Center',
 'Mandaluyong', 'NCR', 'school', ARRAY['SPED','OT','ST'],
 '55 Shaw Blvd, Mandaluyong City', '02-8534-7788', 'approved'),

('First Steps Therapy Hub',
 'Las Piñas', 'NCR', 'center', ARRAY['ABA','OT'],
 '102 Alabang-Zapote Rd, Las Piñas City', '02-8871-2200', 'approved'),

('Kalayaan Therapy Center',
 'Muntinlupa', 'NCR', 'center', ARRAY['OT','ST','ABA'],
 '5 Filinvest Ave, Alabang, Muntinlupa', '02-8850-6600', 'approved'),

('San Juan Autism Support Center',
 'San Juan', 'NCR', 'center', ARRAY['ABA','ST'],
 '34 Pinaglabanan St, San Juan City', '02-8724-1100', 'approved'),

-- ── CALABARZON ───────────────────────────────────────────────────────────────
('New Leaf Therapy Center',
 'Bacoor', 'CALABARZON', 'center', ARRAY['OT','ST'],
 '30 Molino Blvd, Bacoor, Cavite', '046-417-8800', 'approved'),

('Dasmariñas SPED Academy',
 'Dasmariñas', 'CALABARZON', 'school', ARRAY['SPED','OT'],
 '15 Gov. Drive, Dasmariñas, Cavite', '046-426-5544', 'approved'),

('Lipa Therapy Hub',
 'Lipa', 'CALABARZON', 'center', ARRAY['OT','ABA'],
 '22 P. Torres St, Lipa City, Batangas', '043-756-3300', 'approved'),

('Santa Rosa Learning & Therapy Center',
 'Santa Rosa', 'CALABARZON', 'school', ARRAY['SPED','ST','OT'],
 '8 Balibago, Santa Rosa, Laguna', '049-534-7700', 'approved'),

('Antipolo Autism & Therapy Center',
 'Antipolo', 'CALABARZON', 'center', ARRAY['OT','ST','ABA'],
 '45 Circumferential Rd, Antipolo, Rizal', '02-8697-4400', 'approved'),

-- ── Central Luzon ────────────────────────────────────────────────────────────
('Angeles City Therapy Center',
 'Angeles', 'Region III', 'center', ARRAY['OT','ST','ABA'],
 '10 MacArthur Highway, Angeles City, Pampanga', '045-888-2200', 'approved'),

('Malolos SPED School',
 'Malolos', 'Region III', 'school', ARRAY['SPED','OT'],
 '5 Morada Ave, Malolos, Bulacan', '044-791-6600', 'approved'),

('Tarlac Therapy & Development Center',
 'Tarlac City', 'Region III', 'center', ARRAY['OT','ST'],
 '33 MacArthur Highway, Tarlac City', '045-982-4400', 'approved'),

-- ── Central Visayas ──────────────────────────────────────────────────────────
('Cebu Autism & Therapy Center',
 'Cebu City', 'Region VII', 'center', ARRAY['OT','ST','ABA','SPED'],
 '120 Osmena Blvd, Cebu City', '032-255-8800', 'approved'),

('Mandaue Therapy Hub',
 'Mandaue', 'Region VII', 'center', ARRAY['OT','ABA'],
 '7 ML Quezon St, Mandaue City, Cebu', '032-344-5500', 'approved'),

('Lapu-Lapu SPED Academy',
 'Lapu-Lapu', 'Region VII', 'school', ARRAY['SPED','ST'],
 '25 Basak, Lapu-Lapu City, Cebu', '032-495-2200', 'approved'),

-- ── Western Visayas ──────────────────────────────────────────────────────────
('Iloilo Autism Therapy Center',
 'Iloilo City', 'Region VI', 'center', ARRAY['OT','ST','ABA'],
 '56 Jalandoni St, Jaro, Iloilo City', '033-320-5500', 'approved'),

('Bacolod SPED & Therapy Academy',
 'Bacolod', 'Region VI', 'school', ARRAY['SPED','OT','ST'],
 '22 Lacson St, Bacolod City, Negros Occidental', '034-433-6600', 'approved'),

-- ── Davao Region ─────────────────────────────────────────────────────────────
('Davao Autism Resource Center',
 'Davao City', 'Region XI', 'center', ARRAY['OT','ST','ABA','SPED'],
 '10 Ilustre Ave, Davao City', '082-221-9900', 'approved'),

('Tagum Therapy Hub',
 'Tagum', 'Region XI', 'center', ARRAY['OT','ST'],
 '5 Apokon Rd, Tagum City, Davao del Norte', '084-217-4400', 'approved'),

-- ── Northern Mindanao ────────────────────────────────────────────────────────
('Cagayan de Oro Therapy Center',
 'Cagayan de Oro', 'Region X', 'center', ARRAY['OT','ABA','ST'],
 '18 Yacapin St, Cagayan de Oro City', '088-856-7700', 'approved'),

('Iligan SPED Learning Center',
 'Iligan', 'Region X', 'school', ARRAY['SPED','OT'],
 '30 Quezon Ave, Iligan City, Lanao del Norte', '063-221-5500', 'approved'),

-- ── Cordillera ───────────────────────────────────────────────────────────────
('Baguio Therapy & Learning Center',
 'Baguio', 'CAR', 'center', ARRAY['OT','ST','ABA'],
 '12 Leonard Wood Rd, Baguio City', '074-442-3300', 'approved'),

-- ── Bicol ────────────────────────────────────────────────────────────────────
('Naga City Autism Support Center',
 'Naga', 'Region V', 'center', ARRAY['OT','ST','ABA'],
 '9 Elias Angeles St, Naga City, Camarines Sur', '054-473-5500', 'approved'),

-- ── Zamboanga ────────────────────────────────────────────────────────────────
('Zamboanga Therapy & SPED Center',
 'Zamboanga City', 'Region IX', 'center', ARRAY['OT','ST','SPED'],
 '15 Veterans Ave, Zamboanga City', '062-992-4400', 'approved');
