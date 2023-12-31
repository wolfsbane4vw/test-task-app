This is a project written for a test task using Laravel 10, PHP 8.2, Laravel sail, Tailwind CSS and AlpineJS 

The original index.html is in the root directory with the name "original_index.html"
Database dump is in the file db-dump.sql in the root directory
* 

##  Setup:
---
1. to install sail(and other dependencies) in the project

    From [Laravel site](https://laravel.com/docs/10.x/sail#installing-composer-dependencies-for-existing-projects)<br>
    
   `docker run --rm \
    -u "$(id -u):$(id -g)" \
    -v "$(pwd):/var/www/html" \
    -w /var/www/html \
    laravelsail/php82-composer:latest \
    composer install --ignore-platform-reqs`

   
   one line: `docker run --rm -u "$(id -u):$(id -g)" -v "$(pwd):/var/www/html" -w /var/www/html laravelsail/php82-composer:latest composer install --ignore-platform-reqs`

   Issues I have encountered: 
    * Laravel sail needed a linux distro to be defined in Docker Desktop for windows. However there is a docker-compose file in the root directy if needed. Sail needs to be installed with composer directly in the project folder on the host machine if not using the docker run command below
    * If docker run command does not work then it might help to add pull to the command to pull the image
3. `sail up -d`
   P.S: if sail up -d does not work it is possible to run it as `./vendor/bin/sail up -d` or add an aliase with the command `alias sail='bash ./vendor/bin/sail'`
4. `sail npm install`
---
   
   ### If setting up the project without the database use the commands below, otherwise read in the database dump, included with the code, manually.
5. `sail artisan migrate`
6. `sail artisan app:parse-sectors` - command to fill the database sectors table with data
       *could've been done with seeders instead to always have the same sectors data on startup*
       
---
8. `sail npm run build`
    *P.S: the sail npm run dev command does not compile the frontend assets!!*
9. access site on localhost

## Teardown
If you wish to only stop the containers run `sail stop`
If you wish to stop the containers and remove them then run `sail down`
