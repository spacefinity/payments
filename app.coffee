Firebase = require "firebase"
balanced_library = require "balanced-official"


fb = new Firebase process.env.FIREBASE_URL
fbUsers = fb.child 'users'
fbListings = fb.child 'listings'

balanced = new balanced_library marketplace_uri: process.env.MARKETPLACE_URI, secret: process.env.BALANCED_SECRET

fbUsers.on 'value', (users) ->
  # TODO: actually do something
  # TODO: handle only modified users
  console.log user.first_name for user in users.val()

fbListings.on 'value', (listings) ->
  # TODO: actually do something
  # TODO: handle only modified listings
  console.log listing.zipcode for listing in listings.val()
