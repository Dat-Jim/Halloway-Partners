Supabase integration (quick start)
--------------------------------

1) Create a Supabase project
   - Go to https://app.supabase.com and create a new project.

2) Create the `posts` table (SQL)
   - In the Supabase dashboard, open the SQL editor and run:

   ```sql
   create table public.posts (
     id uuid primary key default gen_random_uuid(),
     title text,
     content text,
     created_at timestamptz default now()
   );
   ```

Alternatively, run the full schema in `supabase-schema.sql` to create additional tables used by the site.

3) Allow public access for testing
   - For quick local testing you can temporarily disable Row Level Security (RLS) for `posts` in Table Editor → Settings.
   - For production, enable RLS and add policies that allow authenticated or limited access.

4) Get keys
   - In Project Settings → API copy `URL` and the `anon` public key.
   - Copy `supabase-config.js.sample` to `supabase-config.js` and replace the values.

5) Test locally
   - Open `index.html` in your browser (file:// works) and the Supabase panel near the page bottom will attempt to connect.
   - Create posts with the form and they will be stored in the `posts` table.

Notes
   - This page uses the Supabase JS client via CDN. For production use, consider a build step and server-side protections.
   - If you enable RLS, create suitable policies for `select`, `insert`, and `delete` depending on your auth model.
