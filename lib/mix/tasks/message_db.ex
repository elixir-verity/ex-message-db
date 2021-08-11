defmodule Mix.Tasks.MessageDb do
  defmodule CreateDb do
    use Mix.Task

    @shortdoc "Creates the Message DB database"

    @impl true
    def run(_args) do
      MessageDb.run("install")
    end
  end

  defmodule DeleteDb do
    use Mix.Task

    @shortdoc "Delete the Message DB database"

    @impl true
    def run(_args) do
      MessageDb.run("uninstall")
    end
  end
end
