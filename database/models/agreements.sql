create table public.agreements (
  id uuid not null default extensions.uuid_generate_v4 (),
  status text not null,
  ies jsonb null,
  company jsonb null,
  created_at timestamp with time zone null default now(),
  updated_at timestamp with time zone null default now(),
  ies_id uuid null,
  company_id uuid null,
  constraint agreements_pkey primary key (id),
  constraint agreements_company_id_fkey foreign KEY (company_id) references company_legal_infos (id),
  constraint agreements_ies_id_fkey foreign KEY (ies_id) references ies (id)
) TABLESPACE pg_default;

create index IF not exists agreements_status_idx on public.agreements using btree (status) TABLESPACE pg_default;

create trigger trg_agreements_updated_at BEFORE
update on agreements for EACH row
execute FUNCTION update_updated_at ();