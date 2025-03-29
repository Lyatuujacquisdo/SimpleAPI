# SimpleAPI

SimpleAPI is a simple Laravel-based API that provides endpoints for managing student data and subjects related to the Software Engineering program. This API serves two main endpoints:
1. `/students` - Lists students with their names and enrolled programs.
2. `/subjects` - Lists subjects for the Software Engineering program, categorized by academic years (Year 1 to Year 4).

## Table of Contents
- [Installation](#installation)
- [Dependencies](#dependencies)
- [Usage](#usage)
- [Endpoints](#endpoints)

---

## Installation

Follow the steps below to set up this project locally on your machine:

### 1. Clone the Repository

Start by cloning the repository to your local machine:
```bash
git clone https://github.com/Lyatuujacquisdo/StudentAPI.git
```
### 2.  Navigate to Project Directory
Change into the project directory:
```bash
cd StudentAPI
```

### 3. Install Composer Dependencies
Ensure you have Composer installed. Run the following command to install the required PHP dependencies:
```bash
composer install
```

### 4. Set Up Environment Variables
Copy the .env.example file to .env:
```bash
cp .env.example .env
```

### 5. Generate Application Key
Run the following command to generate a new application key:
```bash
php artisan key:generate
```

### 6. Configure Database
Update the .env file with your database credentials:
```bash
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=studentapi
DB_USERNAME=root
DB_PASSWORD=
```

### 7.  Run Migrations
Run the following command to create the database tables:
```bash
php artisan migrate
```

## Dependencies
1. Laravel 9.x: The PHP framework used to develop the API.
2. Composer: Dependency management tool for PHP.
3. MySQL: Database management system.
   
N.B: Make sure to install all dependencies using composer install before proceeding

## Usage
### 1. Serve the API Locally
   ```bash
   php artisan serve
   ```
   This will start the server at http://127.0.0.1:8000.

### 2. Test the Endpoints.
   You can test the endpoints on your browser or using postman.
   
  1. Get Students:
   
   Endpoint: /api/students
   
   Method: GET
   
   Response: A JSON array of students, each containing their name and program.

   2. Get Subjects:
   
   Endpoint: /api/subjects
   
   Method: GET
   
   Response: A JSON array of subjects for each academic year.
