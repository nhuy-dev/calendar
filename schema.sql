-- Chỉ chạy khi bạn muốn bật đồng bộ trực tiếp qua Supabase.
-- Vào Supabase > SQL Editor > dán toàn bộ file này > Run.
-- Lưu ý: RLS dưới đây mở đọc/ghi cho anon key để nhóm bạn dùng chung dễ setup,
-- giống kiểu app nhóm nhỏ. Đừng dùng cho dữ liệu nhạy cảm.
create table if not exists profiles (
  id text primary key,
  username text,
  name text,
  avatar text,
  sleeping boolean default false,
  sleep_since timestamptz,
  last_active timestamptz,
  updated_at timestamptz default now()
);
-- Bản sửa v1.1: cột "end" là từ khóa riêng của Postgres nên bản cũ báo
-- syntax error at or near "end". Đã đổi thành start_time / end_time / weekday.
-- Nếu lần chạy trước bị lỗi thì cứ chạy lại toàn bộ file này, bảng nào có rồi sẽ giữ nguyên.
create table if not exists events (
  id text primary key,
  owner_id text,
  title text,
  weekday int,
  start_time text,
  end_time text,
  tag text,
  repeat_weekly boolean default true,
  note text,
  created_at timestamptz default now()
);
-- Bảng đã tạo từ bản cũ thì thêm cột username để link ngắn ?u=tên dùng được:
alter table profiles add column if not exists username text;
alter table profiles enable row level security;
alter table events enable row level security;
drop policy if exists "open profiles" on profiles;
drop policy if exists "open events" on events;
create policy "open profiles" on profiles for all using (true) with check (true);
create policy "open events" on events for all using (true) with check (true);
