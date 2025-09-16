SELECT
    occupation_field
FROM {{ ref('dim_occupation') }}
WHERE occupation_field NOT IN ('Säkerhet och bevakning', 'Yrken med social inriktning', 'Data/IT')