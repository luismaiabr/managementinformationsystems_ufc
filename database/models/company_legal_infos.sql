create table public.company_legal_infos (
  id uuid not null default extensions.uuid_generate_v4 (),
  company_id uuid not null,
  trade_name text null,
  cnpj text not null,
  zip_code text null,
  city text null,
  state text null,
  address text null,
  address_number text null,
  neighborhood text null,
  complement text null,
  legal_representative_id uuid null,
  legal_representative jsonb null,
  name text null,
  avatar text null,
  documents jsonb null,
  created_at timestamp with time zone null default now(),
  updated_at timestamp with time zone null default now(),
  deleted_at timestamp with time zone null,
  ies_id uuid null,
  constraint company_legal_infos_pkey primary key (id),
  constraint company_legal_infos_ies_id_fkey foreign KEY (ies_id) references ies (id)
) TABLESPACE pg_default;

create index IF not exists company_legal_infos_company_id_idx on public.company_legal_infos using btree (company_id) TABLESPACE pg_default;

create index IF not exists company_legal_infos_cnpj_idx on public.company_legal_infos using btree (cnpj) TABLESPACE pg_default;

create trigger trg_company_legal_infos_updated_at BEFORE
update on company_legal_infos for EACH row
execute FUNCTION update_updated_at ();