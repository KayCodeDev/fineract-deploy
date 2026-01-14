#!/bin/bash
set -e

# Execute SQL commands using environment variables for the user substitution
mariadb -v -u root -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
    CREATE DATABASE IF NOT EXISTS fineract_tenants;
    CREATE DATABASE IF NOT EXISTS fineract_default;

    -- Grant privileges to the user defined in MYSQL_USER environment variable
    GRANT ALL PRIVILEGES ON fineract_tenants.* TO '$MYSQL_USER'@'%';
    GRANT ALL PRIVILEGES ON fineract_default.* TO '$MYSQL_USER'@'%';
    
    FLUSH PRIVILEGES;
EOSQL
