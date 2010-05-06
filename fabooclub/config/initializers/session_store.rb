# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_fabooclub_session',
  :secret => '259b2b84851a11d44e9b666e48def2f68ff89f03cf7faf2c33e7c1035f7c958dcc914c32ca114e0e060435be305f4dd7573e96fdbdc67f34944a866e4cfa9d3f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
