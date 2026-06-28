create table public.agreement_activity_logs (
  id uuid not null default extensions.uuid_generate_v4 (),
  agreement_id uuid not null,
  user_action_type text null,
  activity_log jsonb null,
  created_at timestamp with time zone null default now(),
  updated_at timestamp with time zone null default now(),
  constraint agreement_activity_logs_pkey primary key (id),
  constraint agreement_activity_logs_agreement_id_fkey foreign KEY (agreement_id) references agreements (id)
) TABLESPACE pg_default;

create trigger trg_agreement_activity_logs_updated_at BEFORE
update on agreement_activity_logs for EACH row
execute FUNCTION update_updated_at ();