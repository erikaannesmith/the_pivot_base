# The Pivot - Base Project

Erika Smith, Aaron Schreck, and Sam Lim built this app for a project called "The Pivot" as a part of their education at The Turing School of Software and Design. For this project, we inherited a [pre-existing single-tenant e-commerce site](https://github.com/turingschool-examples/the_pivot_base) and migrated that site to multitenancy. Throughout the project we simulated on-the-job git practices, kept the app live on heroku, and met with an assigned teacher as a mock product owner. The deployed app can be found [here](http://pivotshop.herokuapp.com/)

## Setup

Built using Ruby 2.4.1 and Rails 5.1.3

Install required gems:
`$ bundle install`

Load the database dump:
` $ rake import_dump:load`

After the import you should see a return value of 1011 when running `Item.count` in the console.

Run the database migrations:
` $ rails db:create`
` $ rails db:migrate`

Add store column to users: 
`$ rake reassign:store_reassignment`

And import the item price into invoice items:
` $ rake rewind:go`

And create the new role associations on users:
` $ rake roles:go`

And finally, the cloudinary image functionality:
` $ rake reassign:images_to_cloudinary`

**NOTE: this cloudinary task takes a very long time and can be skipped without impacting the rest of the application.**

All users have a password of `password` if you want to login and explore.
