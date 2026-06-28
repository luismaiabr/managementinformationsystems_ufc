create table public.contracts (
  id uuid not null default extensions.uuid_generate_v4 (),
  status text not null,
  company_legal_info jsonb null,
  intern jsonb null,
  internship jsonb null,
  created_at timestamp with time zone null default now(),
  updated_at timestamp with time zone null default now(),
  deleted_at timestamp with time zone null,
  constraint contracts_pkey primary key (id)
) TABLESPACE pg_default;

create index IF not exists contracts_status_idx on public.contracts using btree (status) TABLESPACE pg_default;

create index IF not exists contracts_deleted_at_idx on public.contracts using btree (deleted_at) TABLESPACE pg_default;

create trigger trg_contracts_updated_at BEFORE
update on contracts for EACH row
execute FUNCTION update_updated_at ();