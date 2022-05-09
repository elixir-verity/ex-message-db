defmodule Mix.Tasks.Mdb do
  defmodule CreateDb do
    use Mix.Task

    @shortdoc "Creates the Message DB database"

    @switches [
      path: [:string, :keep]
    ]

    @aliases [
      p: :path
    ]

    @impl true
    def run(args) do
      {opts, _} = OptionParser.parse!(args, strict: @switches, aliases: @aliases)
      MessageDb.run("install", [], opts)
    end
  end

  defmodule DeleteDb do
    use Mix.Task

    @shortdoc "Delete the Message DB database"

    @switches [
      path: [:string, :keep]
    ]

    @aliases [
      p: :path
    ]

    @impl true
    def run(args) do
      {opts, _} = OptionParser.parse!(args, strict: @switches, aliases: @aliases)
      MessageDb.run("uninstall", [], opts)
    end
  end

  defmodule RecreateDb do
    use Mix.Task

    @shortdoc "Recreates the Message DB database"

    @switches [
      path: [:string, :keep]
    ]

    @aliases [
      p: :path
    ]

    @impl true
    def run(args) do
      {opts, _} = OptionParser.parse!(args, strict: @switches, aliases: @aliases)
      MessageDb.run("uninstall", [], opts)
      MessageDb.run("install", [], opts)
    end
  end
end
