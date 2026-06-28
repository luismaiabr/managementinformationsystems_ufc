create table public.activity_equivalencies (
  id uuid not null default extensions.uuid_generate_v4 (),
  status text not null,
  student jsonb null,
  activities_type text null,
  activities_description text null,
  total_worktime numeric null,
  files jsonb null,
  created_at timestamp with time zone null default now(),
  updated_at timestamp with time zone null default now(),
  deleted_at timestamp with time zone null,
  constraint activity_equivalencies_pkey primary key (id)
) TABLESPACE pg_default;

create trigger trg_activity_equivalencies_updated_at BEFORE
update on activity_equivalencies for EACH row
execute FUNCTION update_updated_at ();