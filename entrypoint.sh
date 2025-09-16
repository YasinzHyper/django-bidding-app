#!/bin/bash

# Exit on any error
set -e

echo "Starting Django application..."

# Wait for database to be ready (not needed for SQLite but good practice)
echo "Checking database connection..."

# Apply database migrations
echo "Applying database migrations..."
python manage.py migrate --noinput

# Create superuser if it doesn't exist
echo "Creating superuser if it doesn't exist..."
python manage.py shell -c "
from django.contrib.auth import get_user_model
User = get_user_model()
if not User.objects.filter(username='admin').exists():
    User.objects.create_superuser('admin', 'admin@example.com', 'admin123')
    print('Superuser created: admin/admin123')
else:
    print('Superuser already exists')
"

# Only collect static files in production
if [ "$DJANGO_ENVIRONMENT" = "PRODUCTION" ]; then
    echo "Collecting static files..."
    python manage.py collectstatic --noinput --clear || echo "Static files collection failed, continuing..."
fi

echo "Starting server..."
exec "$@"