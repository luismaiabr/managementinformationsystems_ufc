create table public.ies (
  id uuid not null default extensions.uuid_generate_v4 (),
  university_id uuid null,
  career_center_id uuid null,
  name text not null,
  trade_name text null,
  campus text null,
  cnpj text not null,
  zip_code text null,
  city text null,
  state text null,
  address text null,
  address_number text null,
  neighborhood text null,
  complement text null,
  created_at timestamp with time zone null default now(),
  updated_at timestamp with time zone null default now(),
  deleted_at timestamp with time zone null,
  constraint ies_pkey primary key (id)
) TABLESPACE pg_default;

create trigger trg_ies_updated_at BEFORE
update on ies for EACH row
execute FUNCTION update_updated_at ();