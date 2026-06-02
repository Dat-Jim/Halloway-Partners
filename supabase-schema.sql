-- Supabase schema for Halloway site
-- Run these statements in the Supabase SQL editor to create example tables.
-- Posts used by the demo panel
create table if not exists public.posts (
    id uuid primary key default gen_random_uuid(),
    title text,
    content text,
    created_at timestamptz default now()
);
-- Contact form submissions
create table if not exists public.contacts (
    id uuid primary key default gen_random_uuid(),
    first_name text,
    last_name text,
    name text,
    email text,
    phone text,
    practice_area text,
    preferred_contact_method text,
    message text,
    created_at timestamptz default now()
);
alter table if exists public.contacts
add column if not exists first_name text;
alter table if exists public.contacts
add column if not exists last_name text;
alter table if exists public.contacts
add column if not exists practice_area text;
alter table if exists public.contacts
add column if not exists preferred_contact_method text;
-- Team members / bios
create table if not exists public.team_members (
    id uuid primary key default gen_random_uuid(),
    full_name text,
    title text,
    bio text,
    photo_url text,
    display_order int default 0
);
-- Practice areas
create table if not exists public.practices (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    slug text unique,
    description text
);
-- Testimonials
create table if not exists public.testimonials (
    id uuid primary key default gen_random_uuid(),
    author text,
    role text,
    body text,
    created_at timestamptz default now()
);
-- Appointments / booking requests
create table if not exists public.appointments (
    id uuid primary key default gen_random_uuid(),
    name text,
    email text,
    phone text,
    requested_at timestamptz,
    message text,
    created_at timestamptz default now()
);
-- Helpful indexes
create index if not exists idx_posts_created_at on public.posts (created_at desc);
create index if not exists idx_contacts_created_at on public.contacts (created_at desc);