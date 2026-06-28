create table public.ies_insurance_options (
  id uuid not null default extensions.uuid_generate_v4 (),
  university_id uuid not null,
  insurance_company text null,
  insurance_policy text null,
  required_use_for_mandatory_internships boolean null default false,
  created_at timestamp with time zone null default now(),
  updated_at timestamp with time zone null default now(),
  deleted_at timestamp with time zone null,
  constraint ies_insurance_options_pkey primary key (id),
  constraint ies_insurance_options_university_id_fkey foreign KEY (university_id) references ies (id)
) TABLESPACE pg_default;

create index IF not exists ies_insurance_options_university_id_idx on public.ies_insurance_options using btree (university_id) TABLESPACE pg_default;

create trigger trg_ies_insurance_options_updated_at BEFORE
update on ies_insurance_options for EACH row
execute FUNCTION update_updated_at ();