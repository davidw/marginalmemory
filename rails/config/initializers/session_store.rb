# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_marginalmemory-rails_session',
  :secret      => '2431360f3cc5b21e2b4c9312edbba6542abbe8dff68325e08cd91f9fdcf84e587a966c7830325fa37f00f7acddbb6d6fdf608d0eb64ddff17de2c86ca72ba51b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
