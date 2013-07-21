# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_agendamento_session',
  :secret      => 'af34654498dc0b01f06e9b40b2e7cdcc16481cf12aae02dd24b54a51b85a75ab56f8f35a0b6a3245c9a09ba80213376db5eee99566abee0b3574535264aa1162'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
