# Erlang version
erlang_version=21.1.4

# Elixir version
elixir_version=1.8.1

# Always rebuild from scratch on every deploy?
always_rebuild=true

# A command to run right before fetching dependencies
hook_pre_fetch_dependencies="pwd"

# A command to run right before compiling the app (after elixir, .etc)
hook_pre_compile="pwd"

# A command to run right after compiling the app
hook_post_compile="pwd"

# Set the path the app is run from
runtime_path=/app