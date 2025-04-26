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
git clone https://github.com/Lyatuujacquisdo/SimpleAPI.git
```
### 2.  Navigate to Project Directory
Change into the project directory:
```bash
cd SimpleAPI
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
DB_DATABASE=student_api
DB_USERNAME=student_user
DB_PASSWORD=StrongPassword123
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

   # Assignment 2.
## Backup Schemes
###  1. Full Backup
Description: Backs up the entire system (files + database).

Execution: All files and data are copied each time.

Pros: Complete recovery.

Cons: Time- and storage-consuming.

### 2. Incremental Backup
Description: Backs up only the changes since the last backup (full or incremental).

Execution: Requires previous backup history.

Pros: Saves space and time.

Cons: Restoring takes longer (needs all incremental + full).

### 3. Differential Backup
Description: Backs up changes since the last full backup.

Execution: Simpler than incremental for restoring.

Pros: Faster to restore than incremental.

Cons: Takes more space than incremental but less than full.

## Bash_scripts/

### health_check.sh
Logs CPU, memory, disk usage

Checks API and Apache status

### Output: /var/log/health_check.log

### backup_api.sh
Backs up Laravel files and MySQL DB

Keeps backups in /home/ubuntu/backups

Deletes backups older than 7 days

### Output: /var/log/backup.log

### update_server.sh
Updates system packages

Pulls latest changes from GitHub

Restarts Apache

### Output: /var/log/update_server.log

## How to run scripts:
```bash
chmod +x scriptname.sh
./scriptname.sh

```
