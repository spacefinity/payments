Firebase = require "firebase"
balanced_library = require "balanced-official"


fb = new Firebase process.env.FIREBASE_URL
fbUsers = fb.child 'users'
fbListings = fb.child 'listings'

balanced = new balanced_library marketplace_uri: process.env.MARKETPLACE_URI, secret: process.env.BALANCED_SECRET

fbUsers.on 'value', (users) ->
  # TODO: actually do something
  # TODO: handle only modified users
  return
  console.log user.first_name for user in users.val()

fbListings.on 'value', (listings) ->
  # TODO: actually do something
  # TODO: handle only modified listings
  return
  console.log listing.zipcode for listing in listings.val()

fbUsers.on 'child_added', (user) ->
  # Everybody gets a new balanced account!
  userRef = user.ref()
  userVal = user.val()
  if not userVal.balanced_account?
    await balanced.Accounts.create defer err, account_result
    console.log err if err
    userRef.child('balanced_account').set account_result.uri
