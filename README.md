# README
- *Project Name*: Prompt Finder
- *Repository*: https://github.com/Jonathan-Guarnieri/prompt-finder
- *Local address*: http://localhost:3000/
- *Web application address*: https://prompt-finder.herokuapp.com/

# Local requirements
To run this project locally you will need to have installed on your machine:
- Docker
- Docker Compose

# Installation
In your first usage, you need to build the docker image with:
```
docker-compose build
```
And starts the application with:
```
docker-compose up
```
Afterwards, you must configure your database: 
- Access the database container:
```
docker-compose exec db mysql -u root -p
```
- Enter your MYSQL_ROOT_PASSWORD environment variable when prompted.
- Grant necessary permissions:
```
GRANT ALL PRIVILEGES ON *.* TO 'user'@'%' WITH GRANT OPTION;
```
- Flush privileges to apply changes:
```
FLUSH PRIVILEGES;
```
- And then you can `exit`.

# Running the Application
- Remember, always run your containers if you want to use the application:
```
docker-compose up -d
```

# Importing data
To populate the application's database, I chose to use rake tasks.
To import, just place your csv file inside the `data` folder and run the following commands:
- Local environment:
```
docker-compose exec app bundle exec rake import_csv:prompts[example.csv]
```
- Heroku environment:
```
heroku run bundle exec rake import_csv:prompts[example.csv] -a prompt-finder
```

# Elasticsearch Reindexing
Consider running a reindex in the following situations:
- **Index schema changes**: Update mappings or analyzers? Reindex to reflect these changes.
- **Elasticsearch upgrade**: Check release notes for index structure changes or compatibility issues. Reindex if necessary.
- **Index optimization**: Improve search performance by adjusting shards or replicas, or consolidating segments.
- **Data corruption or loss**: Reindex from the original data source (MySQL) to ensure data consistency and integrity.
- **MySQL record updates**: Reflect changes in Elasticsearch. This will (should) be automatic with Searchkick.

Remember, reindexing can be resource-intensive and time-consuming. Plan and test reindexing in a development or test environment before applying in production.
- Local environment:
```
docker-compose exec app rails searchkick:reindex CLASS=Prompt
```
- Heroku environment:
```
heroku run rails searchkick:reindex CLASS=Prompt -a prompt-finder
```

# That's All Folks
Now you are all set!
