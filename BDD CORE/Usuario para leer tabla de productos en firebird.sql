/*crear usuario*/
create
user core password 'core' grant admin role;

/*Dar permisos*/
GRANT
    SELECT ON INVE01
    TO core;
