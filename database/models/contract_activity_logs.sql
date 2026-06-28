create table public.contract_activity_logs (
  id uuid not null default extensions.uuid_generate_v4 (),
  contract_id uuid not null,
  activity_log jsonb null,
  created_at timestamp with time zone null default now(),
  updated_at timestamp with time zone null default now(),
  constraint contract_activity_logs_pkey primary key (id),
  constraint contract_activity_logs_contract_id_fkey foreign KEY (contract_id) references contracts (id)
) TABLESPACE pg_default;

create index IF not exists contract_activity_logs_contract_id_idx on public.contract_activity_logs using btree (contract_id) TABLESPACE pg_default;

create trigger trg_contract_activity_logs_updated_at BEFORE
update on contract_activity_logs for EACH row
execute FUNCTION update_updated_at ();