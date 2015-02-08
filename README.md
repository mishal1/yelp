#Yelp
Week 8 at Makers Academy

##Context
The task for the week was to create a Yelp clone.
The website has the following functionality:
- Visitors can create new restaurants using a form, specifying a name and rating
- Restaurants can be edited and deleted
- Visitors can leave reviews for restaurants, providing a numerical score (1-5) and a comment about their experience
- The restaurants listings page should display all the reviews, along with the average rating of each restaurant
- Validations should be in place for the restaurant and review forms - restaurants must be given a name and rating, reviews must be given a rating from 1-5 (comment is optional)
- Users can log in with facebook
- A user must be logged in to create restaurants
- User can only edit/delete restaurants which they've created
- Users can only leave one review per restaurant
- User can delete their own reviews
-Some indication should be given on the page whether the user is currenty logged in, with links to the available actions
- The email address of the reviewer should be displayed as part of the review
- Restaurants show their average rating
- Users can endorse other reviews (updated in realtime with AJAX)
- Restaurants have images, hosted using AWS

##Learning Objectives
- Creating Rails applications
- The structure of Rails apps (MVC, the router, helpers)
- TDD in Rails, with RSpec & Capybara
- Associations
- Validations
- AJAX in Rails

##Technology Used
- Ruby
- Rails
- Javascript
- Capybara
- Rspec
- ActiveRecord
- Devise Gem
- Omniauth
- AWS S3
- HTML
- CSS
