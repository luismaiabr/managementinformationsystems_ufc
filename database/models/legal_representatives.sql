create table public.legal_representatives (
  id uuid not null default extensions.uuid_generate_v4 (),
  company_id uuid not null,
  name text not null,
  office text null,
  email text null,
  phone_number text null,
  created_at timestamp with time zone null default now(),
  updated_at timestamp with time zone null default now(),
  deleted_at timestamp with time zone null,
  constraint legal_representatives_pkey primary key (id)
) TABLESPACE pg_default;

create trigger trg_legal_representatives_updated_at BEFORE
update on legal_representatives for EACH row
execute FUNCTION update_updated_at ();