# README

![Build Status](https://codeship.com/projects/1f337cf0-94c5-0135-ea79-5e19c06be32c/status?branch=master)
![Code Climate](https://codeclimate.com/github/eschron/food-truck-reviews.png)
![Coverage Status](https://coveralls.io/repos/eschron/food-truck-reviews/badge.png)

# Food Truck Reviews: YummyBear

This site is a platform for listing and reviewing Boston area food trucks. This repository is a group project created at the coding bootcamp Launch Academy as a way to showcase our skills with a variety of web development technologies.

Check out our site at [yummybear.herokuapp.com](http://yummybear.herokuapp.com)

## Technologies

We used a Rails back end to serve up the majority of our views. The show page for a specific food truck includes front-end functionality with React.js. This allows the page to update dynamically based on user input (for example, if someone adds a review or up-votes/down-votes a review).

Our test suite incorporates RSpec for Rails model tests, Capybara and RSpec for Rails acceptance tests, and Jasmine/Enzyme for React components.

Images are uploaded and stored via the CarrierWave Ruby gem, and user registration and authentication is handled by Devise. The ActionMailer Gem, together with the SendGrid Heroku add-on, handles email deliveries (so that a food truck owner can be notified of a new review).

## Setup

After cloning down the repo, create a `.env` file in the main project folder and paste in the following:

```
AWS_ACCESS_KEY_ID=<<YOUR_ID_HERE>>
AWS_SECRET_ACCESS_KEY=<<YOUR_SECRET_ACCESS_KEY_HERE>>
S3_BUCKET_PRODUCTION=foodtruckreviewsproduction
S3_BUCKET_DEVELOPMENT=foodtruckreviewsdevelopment

SENDGRID_USERNAME=<<YOUR_USERNAME_HERE>>
SENDGRID_PASSWORD=<<YOUR_PASSWORD_HERE>>
```

Then sign up for an Amazon Web Services account (used for storing images on the cloud) and paste your id and secret access key in the appropriate places above.

If you deploy to Heroku and want to include mailer functionality, you will also need to install the SendGrid Heroku add-on and include your username and password in the `.env` file.

Then run the following in your terminal:

```
$ bundle  
$ rake db:create
$ rake db:migrate
$ rails s
```

In a separate terminal tab, run:

```
$ npm install
$ npm start
```

Then navigate to localhost:3000 in your browser.

Finally, to run our test suite, in a separate terminal tab, run:  
`rake` for the Rails models/features test  
`npm test` for our Jasmine/Enzyme React component test.  

## Contributors

* Emily Schron (github.com/eschron)
* Shannon Paek (github.com/shapaek)
* Jeffery Shivers (github.com/jefferyshivers)
* Casey Brennan (github.com/cbrennan31)
* Shirin Hunold (github.com/shirinhunold)

