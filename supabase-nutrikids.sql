create table if not exists public.nutrikids_data (
  key text primary key,
  value jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.nutrikids_data enable row level security;

drop policy if exists "Anyone can read NutriKids data" on public.nutrikids_data;
create policy "Anyone can read NutriKids data"
on public.nutrikids_data
for select
to anon, authenticated
using (true);

drop policy if exists "Authenticated users can insert NutriKids data" on public.nutrikids_data;
create policy "Authenticated users can insert NutriKids data"
on public.nutrikids_data
for insert
to authenticated
with check (true);

drop policy if exists "Authenticated users can update NutriKids data" on public.nutrikids_data;
create policy "Authenticated users can update NutriKids data"
on public.nutrikids_data
for update
to authenticated
using (true)
with check (true);

drop policy if exists "Authenticated users can delete NutriKids data" on public.nutrikids_data;
create policy "Authenticated users can delete NutriKids data"
on public.nutrikids_data
for delete
to authenticated
using (true);
