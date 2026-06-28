create table public.envelopes (
  id uuid not null default extensions.uuid_generate_v4 (),
  contract_id uuid not null,
  envelope_id text null,
  documents jsonb null,
  signers jsonb null,
  provider text null,
  status text null,
  signable_group text null,
  created_at timestamp with time zone null default now(),
  updated_at timestamp with time zone null default now(),
  constraint envelopes_pkey primary key (id),
  constraint envelopes_contract_id_fkey foreign KEY (contract_id) references contracts (id)
) TABLESPACE pg_default;

create index IF not exists envelopes_contract_id_idx on public.envelopes using btree (contract_id) TABLESPACE pg_default;

create trigger trg_envelopes_updated_at BEFORE
update on envelopes for EACH row
execute FUNCTION update_updated_at ();