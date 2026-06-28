create table public.reports (
  id uuid not null default extensions.uuid_generate_v4 (),
  contract_id uuid not null,
  report_number integer null,
  start_date date null,
  end_date date null,
  student_report jsonb null,
  company_report jsonb null,
  overall_status text null,
  created_at timestamp with time zone null default now(),
  updated_at timestamp with time zone null default now(),
  deleted_at timestamp with time zone null,
  constraint reports_pkey primary key (id),
  constraint reports_contract_id_fkey foreign KEY (contract_id) references contracts (id)
) TABLESPACE pg_default;

create index IF not exists reports_contract_id_idx on public.reports using btree (contract_id) TABLESPACE pg_default;

create index IF not exists reports_overall_status_idx on public.reports using btree (overall_status) TABLESPACE pg_default;

create trigger trg_reports_updated_at BEFORE
update on reports for EACH row
execute FUNCTION update_updated_at ();