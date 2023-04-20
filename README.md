# CS3200_SeatWise![](https://raw.githubusercontent.com/appsmithorg/appsmith/release/static/appsmith_logo_primary.png)

This app is built using Appsmith. Turn any datasource into an internal app in minutes. Appsmith lets you drag-and-drop components to build dashboards, write logic with JavaScript objects and connect to any API, database or GraphQL source.

![](https://raw.githubusercontent.com/appsmithorg/appsmith/release/static/images/integrations.png)

### [Github](https://github.com/appsmithorg/appsmith) • [Docs](https://docs.appsmith.com/?utm_source=github&utm_medium=social&utm_content=appsmith_docs&utm_campaign=null&utm_term=appsmith_docs) • [Community](https://community.appsmith.com/) • [Tutorials](https://github.com/appsmithorg/appsmith/tree/update/readme#tutorials) • [Youtube](https://www.youtube.com/appsmith) • [Discord](https://discord.gg/rBTTVJp)

##### You can visit the application using the below link

###### [![](https://assets.appsmith.com/git-sync/Buttons.svg) ](http://localhost:8080/applications/642d9287243c9832af6a1f71/pages/642d9287243c9832af6a1f74) [![](https://assets.appsmith.com/git-sync/Buttons2.svg)](http://localhost:8080/applications/642d9287243c9832af6a1f71/pages/642d9287243c9832af6a1f74/edit)

## Build your data in DataGrip
To build our app, you need to first set up a MySQL Data Source in DataGrip. 
After you create a Data Source, a `Data Sources and Drivers` page will pop up, and in here, make sure these files are change:
    1. Change the `Name` field into `SeatWise` to make sure when you run your Flask code, the name of the DB you set there is match with this name. 
    2. You also need to add `root` in `User` field
    3. Make sure you put the secrets which you create in your Flask code into the `Password` field. 
After that, make sure your `Test Connection` passed and your Data Source is set up. 

Moreover, make sure you create an sql file on your right hand side of DataGrip to contain all your database code. 

## Build your database
To allocate our database information, we store our sql file `seatwise_init_db.sql` under `Additional` folder. 
You will copy the entire code and pass it into the sql file you just created in DataGrip. 
After that, you can go ahead and make sure all your SQL code is passed. With that, your database is created with all the informations.

## To run AppSmith
After you had set up your database, make sure you had all your container is running in Docker. 
If not, make sure you open your Flask repository, and run this command on your terminal while making sure you follow all the instructions in the Flask repository README and the secret README file:
    1. Start the containers with `docker compose up`.  To run in detached mode, run `docker compose up -d`. 

With your Docker running, you can then open any of your browser and type `localhost:8080`. This will take you to the Welcome Page of AppSmith