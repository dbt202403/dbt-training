
-- Use the `ref` function to select from other models

select *, id+5 as P5
from {{ ref('my_first_dbt_model') }}
where id = 1
