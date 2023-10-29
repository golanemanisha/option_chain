import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :option_chain, OptionChainWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "iZTw1+CdweiC905FLhpEtaz9bBw8O/2YVecmt9ecuS3BtizWRlu0r9StbMytiPzU",
  server: false

# In test we don't send emails.
config :option_chain, OptionChain.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
