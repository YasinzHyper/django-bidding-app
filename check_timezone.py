#!/usr/bin/env python
"""
Simple script to verify PostgreSQL timezone configuration
"""
import os
import django
from django.conf import settings

# Set up Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'bidding_system.settings')
django.setup()

from django.db import connection

def check_database_timezone():
    """Check if the database is configured with UTC timezone"""
    with connection.cursor() as cursor:
        # Check PostgreSQL timezone setting
        cursor.execute("SHOW timezone;")
        timezone = cursor.fetchone()[0]
        print(f"PostgreSQL timezone: {timezone}")
        
        # Check current timestamp
        cursor.execute("SELECT NOW();")
        current_time = cursor.fetchone()[0]
        print(f"Current database time: {current_time}")
        
        # Check if timezone is UTC
        if timezone.upper() == 'UTC':
            print("✅ Database timezone is correctly set to UTC")
            return True
        else:
            print(f"❌ Database timezone is {timezone}, should be UTC")
            return False

if __name__ == "__main__":
    try:
        check_database_timezone()
    except Exception as e:
        print(f"Error checking database timezone: {e}")