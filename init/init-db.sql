-- init/init-db.sql

-- Create databases required by Fineract
CREATE DATABASE IF NOT EXISTS fineract_tenants;
CREATE DATABASE IF NOT EXISTS fineract_default;

-- Grant all privileges to the user on both databases
GRANT ALL PRIVILEGES ON fineract_tenants.* TO 'fineract_user'@'%';
GRANT ALL PRIVILEGES ON fineract_default.* TO 'fineract_user'@'%';

-- Flush privileges to apply the changes
FLUSH PRIVILEGES;