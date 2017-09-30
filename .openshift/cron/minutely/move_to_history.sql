insert into public.history(
  title,
  address,
  municipality,
  postal,
  tel1,
  tel2,
  fax,
  email,
  site,
  facebook,
  twitter,
  category,
  description,
  static_or_dynamic,
  comments,
  the_geom,
  verification_status,
  input_date,
  valid_until,
  valid_from,
  inserter,
  cocoon_like,
  cocoon_dislike,
  category_id
  )
select title,
  address,
  municipality,
  postal,
  tel1,
  tel2,
  fax,
  email,
  site,
  facebook,
  twitter,
  category,
  description,
  static_or_dynamic,
  comments,
  the_geom,
  verification_status,
  input_date,
  valid_until,
  valid_from,
  inserter,
  cocoon_like,
  cocoon_dislike,
  category_id
from public.master
where when_to_move_to_history <= now()
and static_or_dynamic = 'dynamic'
and verification_status = TRUE;

update public.master
set verification_status = FALSE
where when_to_move_to_history <= now()
and static_or_dynamic = 'dynamic'
and verification_status = TRUE;
