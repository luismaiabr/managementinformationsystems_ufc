create table public.cnpj_cache (
  id uuid not null default extensions.uuid_generate_v4 (),
  cnpj text not null,
  exists boolean null,
  is_active boolean null,
  data jsonb null,
  created_at timestamp with time zone null default now(),
  updated_at timestamp with time zone null default now(),
  constraint cnpj_cache_pkey primary key (id),
  constraint cnpj_cache_cnpj_key unique (cnpj)
) TABLESPACE pg_default;

create trigger trg_cnpj_cache_updated_at BEFORE
update on cnpj_cache for EACH row
execute FUNCTION update_updated_at ();