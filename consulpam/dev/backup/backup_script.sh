source /etc/backup_env
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="/backups/backup_${DATE}.sql"

PGPASSWORD=$DB_PASSWORD pg_dump -h $DB_HOST -U $DB_USER -d $DB_NAME > $BACKUP_FILE
gzip $BACKUP_FILE
ls -t /backups/backup_*.sql.gz | tail -n +4 | xargs rm -f