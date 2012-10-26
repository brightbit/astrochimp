AstroChimp Installation
=======================

## Installation

Add it to your Gemfile:

`gem 'astrochimp'`

Run the following command to install it:

`bundle install`

Copy the migrations over:

    rake astrochimp:install:migrations
    rake db:migrate

Now edit config/astrochimp.yml and add your MailChimp API Key and List ID.

Your app is now chimpified. Start your server and navigate to the root:

    rails s
    open http://localhost:3000
