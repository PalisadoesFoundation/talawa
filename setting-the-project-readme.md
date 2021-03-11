## Documentation for Setting up the Project

* Backend Setup
* Frontend Setup
* Url Entry

## Backend Setup

Go to [Talawa-Api Backend](https://github.com/PalisadoesFoundation/talawa-api) and follow the procedure to configure it on your system. 
If you are running MongoDB locally on your system then only MONGO_DB env variable is necessary. You can also use the hosted instamce of mongodb using atlas by 
following the given steps.

-   Visit [Monngodb Website](https://www.mongodb.com) and signup or create your account
-   Configure a cluster and click connect to connect your application
-   Configuration string will appear something like this:
```sh
mongodb+srv://<username>:<password>@cluster0.fyihs.mongodb.net/<dbName>?retryWrites=true&w=majority
```
- In [Talawa-Api Backend](https://github.com/PalisadoesFoundation/talawa-api), go to db.js file and replace the const mongoUrl with the configuration string
```sh
const mongoURL = `mongodb+srv://<username>:<password>@cluster0.fyihs.mongodb.net/<dbName>?retryWrites=true&w=majority`
```
- Do not forget to create .env file to set ACCESS_TOKEN_SECRET and REFRESH_TOKEN_SECRET. The .env file will appear like:
```sh
ACCESS_TOKEN_SECRET = mysupersecureaccesstoken
REFRESH_TOKEN_SECRET = mysupersecurerefreshtoken
```
On the `successfull` execution, your local server will start running on port 4000. Following output will be shown in terminal:
```sh
[nodemon] 2.0.4
[nodemon] to restart at any time, enter `rs`
[nodemon] watching path(s): *.*
[nodemon] watching extensions: js,graphql,json
[nodemon] starting `node index.js`
🚀 Server ready at http://localhost:4000/graphql
🚀 Subscriptions ready at ws://localhost:4000/graphql
```

You can now open the graphql playground to check the schema design and start playing with graph api's.


## App Setup

Go to [Talawa](https://github.com/PalisadoesFoundation/talawa/blob/master/README.md) and follow the procedure to configure project on your system. 
Once the project is configured go to [login_page.dart](https://github.com/PalisadoesFoundation/talawa/blob/master/lib/views/pages/login_signup/login_page.dart) 
and perform the following change:
```sh
orgUrl = "${dropdownValue.toLowerCase()}://${urlController.text}/";
```

Now `Run` the app.

## App Url Entry
As the app opens, enter the url: 
- Remeber you only need to enter `local host` and `Port Number`. 
The [Graphql Client](https://github.com/PalisadoesFoundation/talawa/blob/master/lib/utils/GQLClient.dart) 
is itself configured with `graphql` string at the end to form the uri.
- If you are running app on emulator use `10.0.2.2` inplace of `localhost`. This is done because the local host of the emulator is within the device itself.
To know more refer [this](https://stackoverflow.com/questions/5528850/how-do-you-connect-localhost-in-the-android-emulator).
```sh
10.0.2.2:4000
```
- If you are running app on real smartphone then use `Network IP` instead of `localhost`
```sh
<IP>:4000
```
