# Hello API!

This is an exercise API that greets you with five different messages in a JSON format. 

Additionally, an UI that feeds from this API was also built. Find the [React App here](https://github.com/danalvrz/hello-react-front-end).

## Built With

- Ruby on Rails
- PostgreSQL


## Getting Started

1. Clone the project using git-bash or Githup Desktop.
2. Open the project folder with VSCode or any Editor.
3. Open terminal and navigate to the project folder.
4. Run `rails db:create`.
5. Run `rails db:migrate`.
6. Run `rails s`.

## Usage

- Greetings (endpoint):
`GET '/greetings'`
returns a JSON object with all five greetings and their unique message.

- Random (endpoint):
`GET '/greetings/random'`
returns a JSON object with a random greeting message.


## Author

👤 **Dante Alvarez**

- GitHub: [@danalvrz](https://github.com/danalvrz)
- Twitter: [@danalvrz](https://twitter.com/danalvrz)
- LinkedIn: [Dante Alvarez](https://www.linkedin.com/in/dante-alvarez-p/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!


## 👏 Show your support

Give a ⭐️ if you like this project!

## 📝 License

[License: MIT](https://opensource.org/licenses/MIT)