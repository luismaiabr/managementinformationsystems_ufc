create table public.activity_equivalency_activity_logs (
  id uuid not null default extensions.uuid_generate_v4 (),
  activity_equivalency_id uuid not null,
  activity_log jsonb null,
  created_at timestamp with time zone null default now(),
  updated_at timestamp with time zone null default now(),
  constraint activity_equivalency_activity_logs_pkey primary key (id),
  constraint activity_equivalency_activity_logs_activity_equivalency_id_fkey foreign KEY (activity_equivalency_id) references activity_equivalencies (id)
) TABLESPACE pg_default;

create index IF not exists activity_equivalency_activity_logs_activity_equivalency_id_idx on public.activity_equivalency_activity_logs using btree (activity_equivalency_id) TABLESPACE pg_default;

create trigger trg_activity_equivalency_activity_logs_updated_at BEFORE
update on activity_equivalency_activity_logs for EACH row
execute FUNCTION update_updated_at ();