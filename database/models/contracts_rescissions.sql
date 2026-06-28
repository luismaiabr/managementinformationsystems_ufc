create table public.contracts_rescissions (
  id uuid not null default extensions.uuid_generate_v4 (),
  contract_id uuid not null,
  rescission_date date null,
  justification text null,
  pdf_url text null,
  created_at timestamp with time zone null default now(),
  updated_at timestamp with time zone null default now(),
  deleted_at timestamp with time zone null,
  constraint contracts_rescissions_pkey primary key (id),
  constraint contracts_rescissions_contract_id_fkey foreign KEY (contract_id) references contracts (id)
) TABLESPACE pg_default;

create index IF not exists contracts_rescissions_contract_id_idx on public.contracts_rescissions using btree (contract_id) TABLESPACE pg_default;

create trigger trg_contracts_rescissions_updated_at BEFORE
update on contracts_rescissions for EACH row
execute FUNCTION update_updated_at ();