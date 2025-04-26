# Assignment 1: SimpleAPI

SimpleAPI is a simple Laravel-based API that provides endpoints for managing student data and subjects related to the Software Engineering program. This API serves two main endpoints:
1. `/students` - Lists students with their names and enrolled programs.
2. `/subjects` - Lists subjects for the Software Engineering program, categorized by academic years (Year 1 to Year 4).


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

# Assignment 3.
## Instructions on building docker image on the deployed API
Step 1: Make sure docekr is installed in your EC2, you can run this command to check if docker is installed

```bash
docker --version
```
Step 2: If Docker isn't installed in your EC2, follow the following steps:
-> Update packages
```bash
sudo apt update
sudo apt upgrade -y
```
-> Install Docker dependencies
```bash
sudo apt install apt-transport-https ca-certificates curl software-properties-common gnupg -y
```
-> Add Docker’s official GPG key
```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```
-> Add Docker repo
```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
-> Install Docker Engine
```bash
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io -y
```
-> Verify Docker is installed
```bash
docker --version
```
The expected output is the current version of docker
### After installing docker, add the docker file into the Laravel project,the following steps will guide you:
Step 1: Go to your Laravel project
```bash
cd /var/www/SimpleAPI
```
Step 2: Create a Dockerfile
```bash
nano Dockerfile
```
This will open an editor add the required information for the docker file, then save and exit.

Step 3: Build the Docker image
```bash
docker build -t simpleapi-laravel .
```
After the build is completed, run the following command:
```bash
docker images
```
you can see the image created.

### Instructions for deploying and managing containers using Docker Compose.

Step 1: Create docker-compose.yml
In you project directory, run the following command, it will open an editor add the necessary information for the docker-compose.yml
```bash
nano docker-compose.yml
```
Then save and exit

Step 2: Update .env for Laravel 
Edit the database configuration to much the ones in the docker-composer.yml

Step 3: Start Everything with Docker Compose
```bash
docker-compose up -d
```

Step 4: Verify it’s running
```bash
docker ps
```

Step 5: Test in the Browser
Open the url to the api
```bash
http://your-ec2-ip:8000/api/students
```

## Docker Registry Upload 
You can acces the docker image here, the one I registered
https://hub.docker.com/repository/docker/jacquisdo/simpleapi_app/general
