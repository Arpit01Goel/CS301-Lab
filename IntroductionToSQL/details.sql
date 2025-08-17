-- List tables, columns, and constraints
SELECT
    tc.table_schema,
    tc.table_name,
    kcu.column_name,
    tc.constraint_type
FROM
    information_schema.table_constraints AS tc
    JOIN information_schema.key_column_usage AS kcu
      ON tc.constraint_name = kcu.constraint_name
WHERE
    tc.constraint_type IN ('PRIMARY KEY', 'FOREIGN KEY', 'UNIQUE')
ORDER BY
    tc.table_name, kcu.column_name;