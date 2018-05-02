# A Goblin Colosseum data store API

An API to store game state date for the game Goblin Colosseum.
It allows players to register as users of the API and store their games, which
can be reloaded at any time to continue play.

The API does not currently validate game states.

## API URL

- Production: https://goblin-colosseum-api.herokuapp.com/

## Gobin Colosseum Client URL

- Live web app: https://ismurray.github.io/goblin-colosseum/
- Client Github Repo: https://github.com/ismurray/goblin-colosseum

## API End Points

| Verb   | URI Pattern                 | Controller#Action         |
|--------|-----------------------------|---------------------------|
| POST   | `/sign-up`                  | `users#signup`            |
| POST   | `/sign-in`                  | `users#signin`            |
| DELETE | `/sign-out`                 | `users#signout`           |
| PATCH  | `/change-password`          | `users#changepw`          |
| GET    | `/gold`                     | `users#see_gold`          |
| PATCH  | `/gold-transaction/:amount` | `users#gold_transaction`  |
| GET    | `/games`                    | `games#index`             |
| POST   | `/games`                    | `games#create`            |
| GET    | `/games/:id`                | `games#show`              |
| PATCH  | `/games/:id`                | `games#update`            |
| DELETE | `/games/:id`                | `games#destroy`           |
| GET    | `/high-scores/:range`       | `games#high_scores`       |
| GET    | `/transactions`             | `transactions#index`      |
| POST   | `/transactions`             | `transactions#create`     |
| PATCH  | `/transactions/:id`         | `transactions#update`     |
| DELETE | `/transactions/:id`         | `transactions#destroy`    |


All data returned from API actions is formatted as JSON.

## API Guides
- [User Documentation](docs/user.md)
- [Game Documentation](docs/game.md)

## Entity Relationship Diagram (ERD)
![ERD](https://i.imgur.com/CKmT4em.png)


## Technologies Used
* Ruby on Rails
* PostgresQL
* Heroku
* Git/Github
* Atom

## Disclaimer
This API may be reset or altered at anytime.  The future of this API may not align with the current state and therefore the state your client application expects.  If you would like to maintain a version of this API in its current state for your future use, please fork and clone the repository and launch it on heroku.
