# Bidding Application with Django
This application was built as a side project, in order to learn how to design and build a bidding system from scratch. The theme is based on capital raising for companies. It includes an auth system, marketplace, companies, placements, dashboard, mobile friendly design. I used Django mainly, to develop this application.

# Before you get started
Concepts covered in this app
- Routing
- ORM, database design
- Form handling
- Templates
- Charting with `Chart.js`
- Design with `Materialize.css`

# Routes
- `/` The home page. Contains news.
- `about/` Holds details about the application.
- `register/` Allows users to register an account
- `login/` Allows users to login to an account
- `logout/` Allows users to logout and clear their session
- `marketplace/` Listing of placements from various companies.
- `marketplace/slug/` Detailed view for a placement within the marketplace.
- `my-bids/` User scope bid summary for available placements.
- `dashboard/` Basic analytics and animated charts for the database.

# Setup

**Prerequisites:**
- Docker and Docker Compose installed on your system
- Git (for cloning the repository)

## Quick Start with Docker

**1. Clone and Start:**
```bash
git clone https://github.com/danielc92/django-bidding-app.git
cd django-bidding-app

# For development (with auto-reload)
docker-compose -f docker-compose.dev.yml up --build

# For production
docker-compose up --build
```

**2. Access the application:**
- Main app: http://localhost:8000
- Admin panel: http://localhost:8000/admin 
  - Username: `admin`
  - Password: `admin123`

**3. Stop the application:**
```bash
docker-compose down
```

## Docker Setup Details

**What happens automatically:**
- ✅ Database migrations are applied
- ✅ Default superuser is created (admin/admin123)
- ✅ Static files are handled by WhiteNoise
- ✅ Data persists in `./data/` directory
- ✅ Development mode includes file watching for auto-reload

**Available Docker commands:**

Using Docker Compose directly:
```bash
# Development mode (with file watching)
docker-compose -f docker-compose.dev.yml up --build

# Production mode (with Gunicorn)
docker-compose up --build

# Stop containers
docker-compose down

# View logs
docker-compose logs -f

# Run management commands
docker-compose exec web python manage.py <command>
```

Using the included Makefile (Linux/macOS/WSL):
```bash
make dev         # Start in development mode
make prod        # Start in production mode  
make down        # Stop all containers
make logs        # View application logs
make clean       # Clean up containers and volumes
make shell       # Open container shell
make django-shell # Open Django shell
make admin       # Create additional superuser
make migrate     # Run migrations
make test        # Run tests
```

**File Structure:**
```
django-bidding-app/
├── docker-compose.yml          # Production configuration
├── docker-compose.dev.yml      # Development configuration  
├── Dockerfile                  # Docker image definition
├── entrypoint.sh              # Container startup script
├── .dockerignore              # Files to exclude from build
├── .gitattributes             # Git line ending configuration
├── data/                      # SQLite database (persistent)
└── staticfiles/               # Collected static files
```

**Troubleshooting:**
- If you see permission errors, ensure Docker has access to the project directory
- Database data persists in `./data/` - delete this folder to reset the database
- For Windows users: ensure line endings are correct (handled by .gitattributes)

## Alternative - Local Development (without Docker)

**Prerequisites:**
- Python 3.7+ 
- pip

**Setup:**
```bash
# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Run migrations
python manage.py migrate

# Create superuser (optional)
python manage.py createsuperuser

# Start development server
python manage.py runserver
```

Access at: http://localhost:8000

# Tests
- Tests performed on this project. What did you do? Which files were used? Was it successful?

# Screenshots 

**Home page**
![home page](https://github.com/danielc92/django-bidding-app/blob/master/screenshots/Screen%20Shot%202019-07-29%20at%202.14.19%20pm.jpg)

**About page**
![About page](https://github.com/danielc92/django-bidding-app/blob/master/screenshots/Screen%20Shot%202019-07-29%20at%202.14.43%20pm.jpg)

**Login page**
![login page](https://github.com/danielc92/django-bidding-app/blob/master/screenshots/Screen%20Shot%202019-07-29%20at%202.13.50%20pm.jpg)

**Registration page**
![registration page](https://github.com/danielc92/django-bidding-app/blob/master/screenshots/Screen%20Shot%202019-07-29%20at%202.13.56%20pm.jpg)

**Placements page**
![placements page](https://github.com/danielc92/django-bidding-app/blob/master/screenshots/Screen%20Shot%202019-07-29%20at%202.14.35%20pm.jpg)

**Bid summary page**
![bid summary page](https://github.com/danielc92/django-bidding-app/blob/master/screenshots/Screen%20Shot%202019-07-29%20at%202.14.40%20pm.jpg)

**Dashboard page**
![Dashboard page](https://github.com/danielc92/django-bidding-app/blob/master/screenshots/Screen%20Shot%202019-07-29%20at%202.14.47%20pm.jpg)

**Bid submission page**
![Bid submission page](https://github.com/danielc92/django-bidding-app/blob/master/screenshots/Screen%20Shot%202019-07-29%20at%202.20.31%20pm.jpg)

**Responsive on small devices**
![Responsive](https://github.com/danielc92/django-bidding-app/blob/master/screenshots/Screen%20Shot%202019-07-29%20at%202.20.45%20pm.jpg)

# Contributors
- Daniel Corcoran

# Sources
- [Materialize CSS](https://materializecss.com/)
- [Chart.js](https://www.chartjs.org/)
- [Django](https://docs.djangoproject.com/en/2.2/)
