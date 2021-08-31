defmodule Chat do
  use Application

  # Starts the application once "iex -S mix" is run on the shell
  def start(_type, _args) do
    Chat.Supervisor.start_link
  end
end
