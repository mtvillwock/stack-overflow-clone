# stack-overflow-clone
Status: Functional.

Users can add, edit, delete, upvote, and downvote questions and answers.

To use:
- `git clone <url>`
- `bundle install`
- `rails server`
- navigate to (localhost:3000)
Note: You will need to create a `.env` file and include a GitHub Zen API auth token if you want to use this application. Go [here](https://github.com/settings/tokens) to get a token, and save it as `AUTH_TOKEN=<YOURTOKEN>` in the root folder (same level as the Gemfile and README.md file).

## What is it?
Ruby on Rails web app built to mimic the functionality of Stack Overflow.
Utilizes AJAX and form partials to facilitate smoother user experience.
Includes GitHub Zen API call (displayed on the index page) for fun.

Collaborators:
[@Pyu06](https://github.com/pyu06)
