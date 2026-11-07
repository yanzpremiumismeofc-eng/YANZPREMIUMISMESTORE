-- YANZ Premiumisme: catalog + secure admin access
create table if not exists public.store_products (
  id text primary key,
  nama text not null,
  kode text not null,
  varian jsonb not null default '[]'::jsonb,
  enabled boolean not null default true,
  updated_at timestamptz not null default now()
);
alter table public.store_products enable row level security;

drop policy if exists "Catalog is visible" on public.store_products;
drop policy if exists "Only owner can insert products" on public.store_products;
drop policy if exists "Only owner can update products" on public.store_products;
drop policy if exists "Only owner can delete products" on public.store_products;

create policy "Catalog is visible" on public.store_products
for select to anon, authenticated
using (enabled = true or lower(coalesce(auth.jwt()->>'email','')) = 'yanz.premiumismeofc@gmail.com');

create policy "Only owner can insert products" on public.store_products
for insert to authenticated
with check (lower(coalesce(auth.jwt()->>'email','')) = 'yanz.premiumismeofc@gmail.com');

create policy "Only owner can update products" on public.store_products
for update to authenticated
using (lower(coalesce(auth.jwt()->>'email','')) = 'yanz.premiumismeofc@gmail.com')
with check (lower(coalesce(auth.jwt()->>'email','')) = 'yanz.premiumismeofc@gmail.com');

create policy "Only owner can delete products" on public.store_products
for delete to authenticated
using (lower(coalesce(auth.jwt()->>'email','')) = 'yanz.premiumismeofc@gmail.com');

grant select on public.store_products to anon, authenticated;
grant insert, update, delete on public.store_products to authenticated;

insert into public.store_products (id,nama,kode,varian,enabled) values ('bstation','Bstation','bs','[{"label":"Account Basic","stok":10,"harga":5500},{"label":"1 Minggu | 1 Akun","stok":5,"harga":9500},{"label":"1 Minggu | 5 Akun","stok":5,"harga":34000},{"label":"1 Minggu | 10 Akun","stok":3,"harga":45000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('duolingo','Duolingo','du','[{"label":"Account Basic","stok":10,"harga":5500},{"label":"1 Bulan | 1 Akun","stok":5,"harga":7000},{"label":"1 Bulan | 5 Akun","stok":3,"harga":23000},{"label":"1 Bulan | 10 Akun","stok":5,"harga":35000},{"label":"1 Tahun | Promo","stok":10,"harga":20000},{"label":"2 Bulan | Promo","stok":5,"harga":12000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('iqiyi','IQIYI','iq','[{"label":"Account Basic","stok":10,"harga":5500},{"label":"1 Bulan","stok":0,"harga":22000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('meitu','Meitu VIP+','me','[{"label":"Account Basic","stok":10,"harga":5600},{"label":"14D VIP | 10 Akun","stok":5,"harga":40000},{"label":"14D VIP+ | 1 Akun","stok":5,"harga":10000},{"label":"14D VIP+ | 5 Akun","stok":5,"harga":30000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('scribd','Scribd','sc','[{"label":"Account Basic","stok":10,"harga":5500},{"label":"1 Bulan | 1 Akun","stok":10,"harga":10000},{"label":"1 Bulan | 5 Akun","stok":5,"harga":30000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('wink','WINK','wi','[{"label":"Account Basic","stok":10,"harga":5500},{"label":"7 Hari | Android","stok":5,"harga":10000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('zoom','Zoom','zo','[{"label":"Account Basic","stok":10,"harga":5500},{"label":"14 Hari | 1 Akun","stok":10,"harga":7500},{"label":"14 Hari | 5 Akun","stok":3,"harga":25000},{"label":"14 Hari | 10 Akun","stok":3,"harga":39000},{"label":"30 Hari | 1 Akun","stok":10,"harga":10000},{"label":"30 Hari | 5 Akun","stok":5,"harga":35000},{"label":"30 Hari | 10 Akun","stok":3,"harga":57000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('alightmotion','Alight Motion','am','[{"label":"1 Tahun | 1 Akun","stok":10,"harga":7500},{"label":"1 Tahun | 5 Akun","stok":3,"harga":22000},{"label":"1 Tahun | 10 Akun","stok":10,"harga":30000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('camscanner','CamScanner','cs','[{"label":"1 Bulan | 1 Akun","stok":1,"harga":10000},{"label":"1 Bulan | 5 Akun","stok":2,"harga":35000},{"label":"1 Bulan | 10 Akun","stok":1,"harga":45000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('canva','Canva','cv','[{"label":"1 Bulan | Head 1 Akun","stok":5,"harga":10000},{"label":"1 Bulan | Head 5 Akun","stok":2,"harga":35000},{"label":"Famhead | Lifetime","stok":5,"harga":655000},{"label":"Member Lifetime","stok":10,"harga":15000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('capcut','CapCut','ct','[{"label":"Individual 7 Bulan | 1 Akun","stok":10,"harga":205000},{"label":"Team 1 Bulan | 1 Akun","stok":10,"harga":30000},{"label":"Team 1 Bulan | 5 Akun","stok":5,"harga":135000},{"label":"Team 1 Bulan | 10 Akun","stok":10,"harga":265000},{"label":"Team 1 Minggu | 1 Akun","stok":5,"harga":9000},{"label":"Team 1 Minggu | 5 Akun","stok":10,"harga":32000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('chatgpt','ChatGPT','cg','[{"label":"1 Hari | Plus Garansi Penuh","stok":10,"harga":15000},{"label":"3 Bulan | GO Garansi 7D","stok":5,"harga":100000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('dana','DANA Fresh','dn','[{"label":"DANA","stok":10,"harga":8500}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('gsuite','GSuite Payment','gs','[{"label":"Paysafecard | 1 Hari","stok":0,"harga":5800}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('gemini','Gemini','gm','[{"label":"Account 3 Bulan | Akun Buyer","stok":10,"harga":15000},{"label":"Link 3 Bulan | Stok terakhir","stok":10,"harga":15000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('getcontact','Getcontact','gc','[{"label":"1 Bulan | Manual","stok":10,"harga":10000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('gmail','Gmail Fresh','gl','[{"label":"Gmail | 1 Akun","stok":10,"harga":12000},{"label":"Gmail | 5 Akun","stok":2,"harga":47000},{"label":"Gmail | 10 Akun","stok":2,"harga":82000},{"label":"Hotmail | 1 Akun","stok":10,"harga":6000},{"label":"Hotmail | 5 Akun","stok":10,"harga":18500},{"label":"Outlook | 1 Akun","stok":10,"harga":6000},{"label":"Outlook | 5 Akun","stok":10,"harga":18500}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('googledrive','Google Drive','gd','[{"label":"18 Bulan | 5 TB","stok":1,"harga":55000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('hbomax','HBO Max','hb','[{"label":"1 Bulan | 1 Akun","stok":10,"harga":40000},{"label":"1 Bulan | 5 Akun","stok":10,"harga":170000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('loklok','LokLok','ll','[{"label":"1 Bulan | Website","stok":10,"harga":10000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('msoffice','MS Office 365','mo','[{"label":"1 Bulan Head | 1 Akun","stok":10,"harga":10000},{"label":"1 Bulan Head | 5 Akun","stok":5,"harga":35000},{"label":"1 Bulan Head | 10 Akun","stok":0,"harga":45000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('netflix','Netflix','nf','[{"label":"1 Bulan | 1P 1U","stok":10,"harga":40000},{"label":"1 Bulan | 1P 2U","stok":10,"harga":25000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('perplexity','Perplexity AI','px','[{"label":"1 Bulan | Sharing","stok":10,"harga":30000},{"label":"1 Minggu | Sharing","stok":10,"harga":15000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('picsart','PicsArt','pa','[{"label":"3 Hari | 1 Akun","stok":10,"harga":8999},{"label":"3 Hari | 5 Akun","stok":3,"harga":25000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('primevideo','Prime Video','pv','[{"label":"1 Bulan | 1 Akun","stok":10,"harga":11000},{"label":"1 Bulan | 5 Akun","stok":5,"harga":42500},{"label":"1 Bulan | 10 Akun","stok":3,"harga":72000},{"label":"6 Bulan | Promo","stok":10,"harga":35000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('spotify','Spotify','sp','[{"label":"Account 1 Bulan | Garansi Penuh","stok":10,"harga":18000},{"label":"Link 1 Bulan | Student","stok":10,"harga":6250}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('viu','VIU','vu','[{"label":"Lifetime | Private","stok":10,"harga":13000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('vpnexpress','VPN Express','ve','[{"label":"1 Bulan | Private","stok":10,"harga":22000},{"label":"3 Hari | 1 Akun","stok":10,"harga":8999},{"label":"3 Hari | 5 Akun","stok":1,"harga":30000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('vpnhma','VPN HMA','vh','[{"label":"1 Bulan | 1 Akun","stok":10,"harga":10000},{"label":"1 Bulan | 5 Akun","stok":3,"harga":30000},{"label":"1 Bulan | 10 Akun","stok":5,"harga":45000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('vpnproton','VPN Proton','vp','[{"label":"1 Bulan | 1 Akun","stok":4,"harga":30000},{"label":"1 Bulan | 5 Akun","stok":3,"harga":130000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('vpnsurfshark','VPN Surfshark','vs','[{"label":"1 Minggu | 1 Akun","stok":2,"harga":9999},{"label":"1 Minggu | 5 Akun","stok":1,"harga":25000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('vpnnord','VPN Nord','vn','[{"label":"1 Bulan | Private","stok":10,"harga":25000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('wetv','WeTV','wt','[{"label":"1 Bulan | Private","stok":5,"harga":30000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('youtube','YouTube Premium','yt','[{"label":"1 Bulan | 1 Akun","stok":7,"harga":18000},{"label":"1 Bulan | 5 Akun","stok":3,"harga":77000},{"label":"1 Bulan | 10 Akun","stok":0,"harga":145000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('applemusic','Apple Music','ap','[{"label":"1 Bulan | Head 1 Akun","stok":0,"harga":10000}]'::jsonb,true) on conflict (id) do nothing;
insert into public.store_products (id,nama,kode,varian,enabled) values ('voucher','Voucher Spesial','vc','[{"label":"1 Hari | Capcut ID","stok":3,"harga":12000},{"label":"1 Hari | Capcut US","stok":10,"harga":10000},{"label":"3 Hari | Alight Motion","stok":10,"harga":15000},{"label":"7 Hari | Zoom","stok":10,"harga":10000}]'::jsonb,true) on conflict (id) do nothing;

-- Existing invoice table (optional order persistence)
create table if not exists public.orders (
 id bigint generated by default as identity primary key,
 user_id uuid not null references auth.users(id) on delete cascade,
 invoice text not null unique,
 items jsonb not null,
 total integer not null,
 unique_code integer not null,
 status text not null default 'awaiting_confirmation',
 created_at timestamptz not null default now()
);
alter table public.orders enable row level security;
drop policy if exists "Customers can create own orders" on public.orders;
drop policy if exists "Customers can view own orders" on public.orders;
create policy "Customers can create own orders" on public.orders
 for insert to authenticated with check (auth.uid() = user_id);
create policy "Customers can view own orders" on public.orders
 for select to authenticated using (auth.uid() = user_id);

-- Premium media + public store statistics
alter table public.store_products add column if not exists image_url text;

insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('product-images', 'product-images', true, 5242880, array['image/jpeg','image/png','image/webp'])
on conflict (id) do update set public = true, file_size_limit = 5242880, allowed_mime_types = array['image/jpeg','image/png','image/webp'];

drop policy if exists "Public can view product images" on storage.objects;
drop policy if exists "Owner can upload product images" on storage.objects;
drop policy if exists "Owner can update product images" on storage.objects;
drop policy if exists "Owner can delete product images" on storage.objects;
create policy "Public can view product images" on storage.objects for select to anon, authenticated using (bucket_id = 'product-images');
create policy "Owner can upload product images" on storage.objects for insert to authenticated with check (bucket_id = 'product-images' and lower(coalesce(auth.jwt()->>'email','')) = 'yanz.premiumismeofc@gmail.com');
create policy "Owner can update product images" on storage.objects for update to authenticated using (bucket_id = 'product-images' and lower(coalesce(auth.jwt()->>'email','')) = 'yanz.premiumismeofc@gmail.com') with check (bucket_id = 'product-images' and lower(coalesce(auth.jwt()->>'email','')) = 'yanz.premiumismeofc@gmail.com');
create policy "Owner can delete product images" on storage.objects for delete to authenticated using (bucket_id = 'product-images' and lower(coalesce(auth.jwt()->>'email','')) = 'yanz.premiumismeofc@gmail.com');

create table if not exists public.store_metrics (
  id boolean primary key default true check (id),
  page_views bigint not null default 0,
  sales_baseline bigint not null default 1281400
);
insert into public.store_metrics(id,page_views,sales_baseline) values(true,0,1281400) on conflict(id) do nothing;
alter table public.store_metrics enable row level security;
revoke all on public.store_metrics from anon, authenticated;

create or replace function public.record_store_view()
returns void language sql security definer set search_path = public
as $$ update public.store_metrics set page_views = page_views + 1 where id = true; $$;
revoke all on function public.record_store_view() from public;
grant execute on function public.record_store_view() to anon, authenticated;

create or replace function public.get_store_stats()
returns table(views bigint, sold bigint)
language sql stable security definer set search_path = public
as $$
  select m.page_views,
         m.sales_baseline + coalesce((
           select sum(coalesce((item->>'qty')::bigint,0))
           from public.orders o
           cross join lateral jsonb_array_elements(o.items) item
           where o.status = 'paid'
         ),0)::bigint
  from public.store_metrics m where m.id = true;
$$;
revoke all on function public.get_store_stats() from public;
grant execute on function public.get_store_stats() to anon, authenticated;

drop policy if exists "Only owner can update order status" on public.orders;
create policy "Only owner can update order status" on public.orders
for update to authenticated
using (lower(coalesce(auth.jwt()->>'email','')) = 'yanz.premiumismeofc@gmail.com')
with check (lower(coalesce(auth.jwt()->>'email','')) = 'yanz.premiumismeofc@gmail.com');
grant update on public.orders to authenticated;

drop policy if exists "Owner can view all orders" on public.orders;
create policy "Owner can view all orders" on public.orders
for select to authenticated
using (lower(coalesce(auth.jwt()->>'email','')) = 'yanz.premiumismeofc@gmail.com');
grant select on public.orders to authenticated;
