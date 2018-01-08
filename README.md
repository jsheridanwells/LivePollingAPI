# LivePolling
Poll and quiz an audience in real time.
<hr>

[View the deployed version](http://jeremywells.io/live-polling).

[View the LivePolling Client source code](https://github.com/jsheridanwells/LivePolling).

<hr>

## Features

Create presentations with live __polls__ and __quizzes__. The results of the polls and quizzes can be displayed as charts in real time, or they can be hidden from audiences.
 
 <img src="https://github.com/jsheridanwells/LivePolling/blob/master/documentation/live-polling1.png" width="500" />
 
Easily share links with an audience using a URL shortener and QR codes.

<img src="https://github.com/jsheridanwells/LivePolling/blob/master/documentation/live-polling2.png" width="500" />
 
An audience can easily follow a presentation and respond to questions using any device.

<img src="https://github.com/jsheridanwells/LivePolling/blob/master/documentation/live-polling3.png" width="500" />
 
 ## Local Installation and Setup
 You will need to have [Ruby 2.4.3](https://www.ruby-lang.org/en/downloads/) and [Ruby on Rails 5.1.4](http://rubyonrails.org/) installed. Additionally, you will ned to have [Bundler](https://bundler.io/) installed.
 
 Note: You will also need to have the [client-side code](https://github.com/jsheridanwells/LivePolling) installed and compiled. 
 
 1. Clone this repository: 
 
 ```$ git clone https://github.com/jsheridanwells/LivePollingAPI.git```
 
 2. Navigate to the LivePollingAPI directory:
 
 ```$ cd LivePollingAPI```
 
 3. Install the required gems:
 
 ```$ bundle install```
 
 4. Create and migrate the database:
 
 ``` $ rails db:migrate```
 
 5. (Optional): Seed the database. This will give you a test login which is username: `example@example.com`, password: `123456`:
 
 ``` $ rails db:seed```
 
 6. Launch the rails server. This will run the API endpoints from http://localhost:3000:
 
 ``` $ rails server```
 
 7. If you have installed the [client side code](https://github.com/jsheridanwells/LivePolling), navigate to `http://localhost:8080`. The app should be functioning from the browser.
 
 ## Build With:

[Ruby on Rails 5.1.4](http://rubyonrails.org/)

## Author
  Jeremy Sheridan Wells

  [Github: jsheridanwells](http://www.github.com/jsheridanwells)

  [Twitter: @jsheridanwells](http://twitter.com/jsheridanwells)
