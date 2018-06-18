# crowd_count_api

This is code for server that has following components:

1. Rails API to accept image.
2. Python code to do the counting of customers from image
3. Rails API to send count to client Android.
4. Database to store count of different shops

### /python/mcnn
This folder contains the code for counting customers. It uses MCNN adapted from this paper http://www.cv-foundation.org/openaccess/content_cvpr_2016/papers/Zhang_Single-Image_Crowd_Counting_CVPR_2016_paper.pdf

### /python
This folder except the `mcnn` folder contains code for counting people using Viola Jones. This code is no longer being used as the accuracy is less.

### /send
This folder contains the code to send the pic to the server for processing and updating the customer count of shop specified.

### /app/controllers/shop_controller.rb
This file implements the main API of accepting the image, provide count to the Android app, save count to database and calling Python to do the counting.

## Installation
1. Install Ruby 2.4 (rvm recommended)
2. Run `bundle install`.
3. Migrate database schema using `rake db:migrate`.
4. Populate shop table in the database:
    1. Open rails console using `rails c`.
    2. Create 3, 4 entries such as:
      * `Shop.create! name: 'KBH', count: 20`
      * `Shop.create! name: 'Nescafe', count: 30`
      * `Shop.create! name: 'Hospital', count: 5`
      * `Shop.create! name: 'Hangouts', count: 100`
    3. Make sure these shops appear in the home page by running `rails s`.
