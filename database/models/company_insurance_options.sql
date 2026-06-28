create table public.company_insurance_options (
  id uuid not null default extensions.uuid_generate_v4 (),
  company_id uuid not null,
  insurance_company text null,
  insurance_policy text null,
  created_at timestamp with time zone null default now(),
  updated_at timestamp with time zone null default now(),
  constraint company_insurance_options_pkey primary key (id)
) TABLESPACE pg_default;

create trigger trg_company_insurance_options_updated_at BEFORE
update on company_insurance_options for EACH row
execute FUNCTION update_updated_at ();