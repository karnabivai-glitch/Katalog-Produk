-- Jalankan di Nhost Dashboard > Database > SQL (atau Hasura Console > Data > SQL).
-- Centang "Track this" agar tabel muncul di GraphQL.

create table public.store_settings (
  id int primary key default 1 check (id = 1),
  name text not null default 'Toko Kami',
  tagline text not null default '',
  wa text not null default ''
);
insert into public.store_settings (id) values (1);

create table public.products (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  price integer not null default 0,
  category text not null default '',
  description text not null default '',
  image_id uuid,
  in_stock boolean not null default true,
  created_at timestamptz not null default now()
);
