# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mc_session',
  :secret      => '43a989dc0752453456445cb73bd101354be7eae4f4f4a68c093bcca62e9b56f4232a8de1cda6913d9f246e3235b972ba46e45ee7f554ae1f3a562060269c59ae'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
