const SUPABASE_URL      = 'https://pqshfeuyeeakdhesclem.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBxc2hmZXV5ZWVha2RoZXNjbGVtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzU1NzYyMzcsImV4cCI6MjA5MTE1MjIzN30.sd6WQUANjZiTWpcfPwWrZ6egp5DURWC70JXQ-kcQnO0';
const BASE_URL          = 'https://autismpinas.com';

function toSlug(name) {
  return (name || '').toLowerCase().trim()
    .replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '');
}

export default async function handler(req, res) {
  const response = await fetch(
    `${SUPABASE_URL}/rest/v1/centers?select=slug,name&status=eq.approved`,
    { headers: { apikey: SUPABASE_ANON_KEY, Authorization: `Bearer ${SUPABASE_ANON_KEY}` } }
  );

  const centers = response.ok ? await response.json() : [];

  const staticUrls = [
    { loc: BASE_URL,          priority: '1.0', changefreq: 'daily'   },
    { loc: `${BASE_URL}/about`,   priority: '0.6', changefreq: 'monthly' },
    { loc: `${BASE_URL}/contact`, priority: '0.6', changefreq: 'monthly' },
  ];

  const centerUrls = centers.map(c => {
    const slug = c.slug || toSlug(c.name);
    return { loc: `${BASE_URL}/${slug}`, priority: '0.8', changefreq: 'weekly' };
  });

  const urlEntries = [...staticUrls, ...centerUrls]
    .map(u => `  <url>\n    <loc>${u.loc}</loc>\n    <changefreq>${u.changefreq}</changefreq>\n    <priority>${u.priority}</priority>\n  </url>`)
    .join('\n');

  const xml = `<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n${urlEntries}\n</urlset>`;

  res.setHeader('Content-Type', 'application/xml; charset=utf-8');
  res.setHeader('Cache-Control', 's-maxage=3600, stale-while-revalidate');
  res.status(200).send(xml);
}
