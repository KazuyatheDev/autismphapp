-- ─────────────────────────────────────────────────────────────────────────────
-- Autismph — Philippine Cities Table
-- Run this AFTER the init_centers migration
-- ─────────────────────────────────────────────────────────────────────────────

create table public.cities (
  id       serial primary key,
  name     text not null,
  province text,
  region   text not null
);

alter table public.cities enable row level security;

create policy "Public can view cities"
  on public.cities for select
  using (true);

create index cities_name_idx on public.cities using btree (lower(name));
create index cities_region_idx on public.cities using btree (region);

-- ─────────────────────────────────────────────────────────────────────────────
-- SEED: Philippine Cities & Major Municipalities
-- ─────────────────────────────────────────────────────────────────────────────

insert into public.cities (name, province, region) values

-- ── NCR (Metro Manila) ──────────────────────────────────────────────────────
('Caloocan',          'Metro Manila', 'NCR'),
('Las Piñas',         'Metro Manila', 'NCR'),
('Makati',            'Metro Manila', 'NCR'),
('Malabon',           'Metro Manila', 'NCR'),
('Mandaluyong',       'Metro Manila', 'NCR'),
('Manila',            'Metro Manila', 'NCR'),
('Marikina',          'Metro Manila', 'NCR'),
('Muntinlupa',        'Metro Manila', 'NCR'),
('Navotas',           'Metro Manila', 'NCR'),
('Parañaque',         'Metro Manila', 'NCR'),
('Pasay',             'Metro Manila', 'NCR'),
('Pasig',             'Metro Manila', 'NCR'),
('Pateros',           'Metro Manila', 'NCR'),
('Quezon City',       'Metro Manila', 'NCR'),
('San Juan',          'Metro Manila', 'NCR'),
('Taguig',            'Metro Manila', 'NCR'),
('Valenzuela',        'Metro Manila', 'NCR'),

-- ── Region I — Ilocos ───────────────────────────────────────────────────────
('Laoag',             'Ilocos Norte',  'Region I'),
('Batac',             'Ilocos Norte',  'Region I'),
('Candon',            'Ilocos Sur',    'Region I'),
('Vigan',             'Ilocos Sur',    'Region I'),
('San Fernando',      'La Union',      'Region I'),
('Alaminos',          'Pangasinan',    'Region I'),
('Dagupan',           'Pangasinan',    'Region I'),
('San Carlos',        'Pangasinan',    'Region I'),
('Urdaneta',          'Pangasinan',    'Region I'),
('Lingayen',          'Pangasinan',    'Region I'),
('Pozorrubio',        'Pangasinan',    'Region I'),

-- ── Region II — Cagayan Valley ──────────────────────────────────────────────
('Tuguegarao',        'Cagayan',       'Region II'),
('Cauayan',           'Isabela',       'Region II'),
('Ilagan',            'Isabela',       'Region II'),
('Santiago',          'Isabela',       'Region II'),
('Bayombong',         'Nueva Vizcaya', 'Region II'),
('Solano',            'Nueva Vizcaya', 'Region II'),
('Aparri',            'Cagayan',       'Region II'),

-- ── Region III — Central Luzon ──────────────────────────────────────────────
('Balanga',           'Bataan',        'Region III'),
('Mariveles',         'Bataan',        'Region III'),
('Malolos',           'Bulacan',       'Region III'),
('Meycauayan',        'Bulacan',       'Region III'),
('San Jose del Monte','Bulacan',       'Region III'),
('Marilao',           'Bulacan',       'Region III'),
('Santa Maria',       'Bulacan',       'Region III'),
('Obando',            'Bulacan',       'Region III'),
('Baliwag',           'Bulacan',       'Region III'),
('Cabanatuan',        'Nueva Ecija',   'Region III'),
('Gapan',             'Nueva Ecija',   'Region III'),
('Munoz',             'Nueva Ecija',   'Region III'),
('Palayan',           'Nueva Ecija',   'Region III'),
('Science City of Muñoz','Nueva Ecija','Region III'),
('Angeles',           'Pampanga',      'Region III'),
('San Fernando City', 'Pampanga',      'Region III'),
('Mabalacat',         'Pampanga',      'Region III'),
('Olongapo',          'Zambales',      'Region III'),
('Iba',               'Zambales',      'Region III'),
('Tarlac City',       'Tarlac',        'Region III'),

-- ── Region IV-A — CALABARZON ────────────────────────────────────────────────
('Bacoor',            'Cavite',        'CALABARZON'),
('Cavite City',       'Cavite',        'CALABARZON'),
('Dasmariñas',        'Cavite',        'CALABARZON'),
('General Trias',     'Cavite',        'CALABARZON'),
('Imus',              'Cavite',        'CALABARZON'),
('Tagaytay',          'Cavite',        'CALABARZON'),
('Trece Martires',    'Cavite',        'CALABARZON'),
('Antipolo',          'Rizal',         'CALABARZON'),
('Cainta',            'Rizal',         'CALABARZON'),
('Taytay',            'Rizal',         'CALABARZON'),
('Biñan',             'Laguna',        'CALABARZON'),
('Calamba',           'Laguna',        'CALABARZON'),
('San Pablo',         'Laguna',        'CALABARZON'),
('San Pedro',         'Laguna',        'CALABARZON'),
('Santa Rosa',        'Laguna',        'CALABARZON'),
('Batangas City',     'Batangas',      'CALABARZON'),
('Lipa',              'Batangas',      'CALABARZON'),
('Tanauan',           'Batangas',      'CALABARZON'),
('Lucena',            'Quezon',        'CALABARZON'),

-- ── Region IV-B — MIMAROPA ──────────────────────────────────────────────────
('Calapan',           'Oriental Mindoro','MIMAROPA'),
('Puerto Princesa',   'Palawan',       'MIMAROPA'),
('Roxas',             'Palawan',       'MIMAROPA'),
('Odiongan',          'Romblon',       'MIMAROPA'),

-- ── Region V — Bicol ────────────────────────────────────────────────────────
('Naga',              'Camarines Sur', 'Region V'),
('Iriga',             'Camarines Sur', 'Region V'),
('Legazpi',           'Albay',         'Region V'),
('Ligao',             'Albay',         'Region V'),
('Tabaco',            'Albay',         'Region V'),
('Sorsogon City',     'Sorsogon',      'Region V'),
('Masbate City',      'Masbate',       'Region V'),

-- ── Region VI — Western Visayas ─────────────────────────────────────────────
('Iloilo City',       'Iloilo',        'Region VI'),
('Passi',             'Iloilo',        'Region VI'),
('Bacolod',           'Negros Occidental','Region VI'),
('Bago',              'Negros Occidental','Region VI'),
('Cadiz',             'Negros Occidental','Region VI'),
('Escalante',         'Negros Occidental','Region VI'),
('Himamaylan',        'Negros Occidental','Region VI'),
('Kabankalan',        'Negros Occidental','Region VI'),
('La Carlota',        'Negros Occidental','Region VI'),
('Sagay',             'Negros Occidental','Region VI'),
('San Carlos City',   'Negros Occidental','Region VI'),
('Silay',             'Negros Occidental','Region VI'),
('Talisay City',      'Negros Occidental','Region VI'),
('Victorias',         'Negros Occidental','Region VI'),
('Roxas City',        'Capiz',         'Region VI'),
('Kalibo',            'Aklan',         'Region VI'),
('San Jose de Buenavista','Antique',   'Region VI'),

-- ── Region VII — Central Visayas ────────────────────────────────────────────
('Cebu City',         'Cebu',          'Region VII'),
('Bogo',              'Cebu',          'Region VII'),
('Carcar',            'Cebu',          'Region VII'),
('Danao',             'Cebu',          'Region VII'),
('Lapu-Lapu',         'Cebu',          'Region VII'),
('Mandaue',           'Cebu',          'Region VII'),
('Naga City',         'Cebu',          'Region VII'),
('Talisay',           'Cebu',          'Region VII'),
('Toledo',            'Cebu',          'Region VII'),
('Tagbilaran',        'Bohol',         'Region VII'),
('Dumaguete',         'Negros Oriental','Region VII'),
('Bais',              'Negros Oriental','Region VII'),
('Bayawan',           'Negros Oriental','Region VII'),
('Canlaon',           'Negros Oriental','Region VII'),
('Guihulngan',        'Negros Oriental','Region VII'),
('Tanjay',            'Negros Oriental','Region VII'),

-- ── Region VIII — Eastern Visayas ───────────────────────────────────────────
('Tacloban',          'Leyte',         'Region VIII'),
('Baybay',            'Leyte',         'Region VIII'),
('Ormoc',             'Leyte',         'Region VIII'),
('Calbayog',          'Samar',         'Region VIII'),
('Catbalogan',        'Samar',         'Region VIII'),
('Maasin',            'Southern Leyte','Region VIII'),
('Borongan',          'Eastern Samar', 'Region VIII'),

-- ── Region IX — Zamboanga Peninsula ─────────────────────────────────────────
('Zamboanga City',    'Zamboanga del Sur','Region IX'),
('Dapitan',           'Zamboanga del Norte','Region IX'),
('Dipolog',           'Zamboanga del Norte','Region IX'),
('Isabela City',      'Basilan',       'Region IX'),
('Pagadian',          'Zamboanga del Sur','Region IX'),

-- ── Region X — Northern Mindanao ────────────────────────────────────────────
('Cagayan de Oro',    'Misamis Oriental','Region X'),
('Gingoog',           'Misamis Oriental','Region X'),
('El Salvador',       'Misamis Oriental','Region X'),
('Iligan',            'Lanao del Norte','Region X'),
('Oroquieta',         'Misamis Occidental','Region X'),
('Ozamiz',            'Misamis Occidental','Region X'),
('Tangub',            'Misamis Occidental','Region X'),
('Malaybalay',        'Bukidnon',      'Region X'),
('Valencia',          'Bukidnon',      'Region X'),
('Cabadbaran',        'Agusan del Norte','Region X'),

-- ── Region XI — Davao ───────────────────────────────────────────────────────
('Davao City',        'Davao del Sur', 'Region XI'),
('Digos',             'Davao del Sur', 'Region XI'),
('Mati',              'Davao Oriental','Region XI'),
('Panabo',            'Davao del Norte','Region XI'),
('Samal',             'Davao del Norte','Region XI'),
('Tagum',             'Davao del Norte','Region XI'),
('Malalag',           'Davao del Sur', 'Region XI'),

-- ── Region XII — SOCCSKSARGEN ───────────────────────────────────────────────
('Cotabato City',     'Maguindanao',   'Region XII'),
('General Santos',    'South Cotabato','Region XII'),
('Kidapawan',         'North Cotabato','Region XII'),
('Koronadal',         'South Cotabato','Region XII'),
('Tacurong',          'Sultan Kudarat','Region XII'),

-- ── Region XIII — Caraga ────────────────────────────────────────────────────
('Butuan',            'Agusan del Norte','Region XIII'),
('Bayugan',           'Agusan del Sur', 'Region XIII'),
('Bislig',            'Surigao del Sur','Region XIII'),
('Surigao City',      'Surigao del Norte','Region XIII'),
('Tandag',            'Surigao del Sur','Region XIII'),

-- ── Cordillera Administrative Region (CAR) ──────────────────────────────────
('Baguio',            'Benguet',       'CAR'),
('Bangued',           'Abra',          'CAR'),
('Bontoc',            'Mountain Province','CAR'),
('Kabugao',           'Apayao',        'CAR'),
('La Trinidad',       'Benguet',       'CAR'),
('Lagawe',            'Ifugao',        'CAR'),
('Tabuk',             'Kalinga',       'CAR'),

-- ── BARMM ───────────────────────────────────────────────────────────────────
('Jolo',              'Sulu',          'BARMM'),
('Lamitan',           'Basilan',       'BARMM'),
('Marawi City',       'Lanao del Sur', 'BARMM');
