# Spotify stats API

### This is the backend for spotify stats musique tracking app. A web app will let you know your monthly stats about your artists tracks.

*Go check it out the front end [repository]() where you'll find the live demo app*

## Built With 

- Ruby on Rails 
- JWT Authentication
- Fast json [API gem](https://github.com/Netflix/fast_jsonapi)
- Bcrypt gem

## Getting Started

In order to start with this project you need the next:
### Download repository
- Get a copy of this project [this repository :blue_book:](https://github.com/bertil291utn/tracking_musique_api.git)
- Go to the directory 

```
 cd  tracking_musique_api
```

### Run the project 

- Runs the app in the development mode.<br />
  ```
  rails s
  ```
- Open [http://localhost:3000](http://localhost:3000) to view it in the browser.
- Follow this [routes](#Routes)

### Routes

This is base url `http:///localhost:3000/api/v1`

|ID|ROUTE|REQUEST|PARAMS|RESPONSE|DESCRIPTION|
|--|--|--|--|--|--|
|1|`/users/:id`|GET|Params id|User JSON object|Get information about a user|
|2|`/users`|POST|`{"user":{"name":"John","email":"john@email.com","password":"J123456"}}`|User created JSON object|Create a user|
|3|`/tokens`|POST|`{"user":{"email":"myemail@meail.com":"password":"J123456"}}`|User id and a token|After create or login get a token to start session. Each token is 24 hours valid|
|4|`/valid_token`|POST|Headers {Authorization: <token>}|User id or 400 unauthorized status|To validate a token whn a user want to open again the application|
|5|`user_artists/:id`|GET|Params id|Artists JSON object|Passing a user Id, displays all user artists|
|6|`/artists`|POST|`{"artist:{"id_string":"333","name":"The Weeknd","photoUrl":"https://myphoto"}"}`, |Headers {Authorization: <token> |Created artist JSON object|Create a new user artist. Token is used to find a user and crate an artist from there|


## Deployment

Deployed with [Heroku](https://www.heroku.com/)  


## Authors

👤 **Bertil Tandayamo**

- Github: [@bertil291utn](https://github.com/bertil291utn)
- Twitter: [@btandayamo](https://twitter.com/batandayamo)
- LinkedIn: [Bertil Tandayamo](http://bit.ly/bertil_linkedin)


## Improvements
- Add security tier to display (show and index) only owners data 


## Acknowledgment

Follow tutorial from Api on Rails 6 by [Alexandre Rosseau](https://www.goodreads.com/book/show/52354415-api-on-rails-6)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## Show your support

If you got until here, show your love hitting the ⭐️ button, I'd appreciate it.

**To crete a pull request:**
- Clone this project and create another branch
- Make the required changes 
- Send a pull request from the new branch  

## 📝 License

This project is [MIT](LICENSE) licensed.




