defmodule Mix.Tasks.Mdb.SymlinkDatabaseScripts do
  use Mix.Task

  @shortdoc "Symlinks the database scripts"

  @switches [
    home: [:string, :keep],
    database_source: [:string, :keep]
  ]

  @aliases [
    h: :home,
    s: :database_source
  ]

  @target "./priv/database"

  @moduledoc """
  Symlinks the database scripts for the given home path.

  ## Examples

      $ mix mdb.symlink_database_scripts -h ..
      $ mix mdb.symlink_database_scripts -h ..-s scripts

  ## Command line options

    * `-h`, `--home` - the home path for the MessageDB source
    * `-s`, `--database_source` - the database source, defaults to ./database
  """

  @impl true
  def run(args) do
    Mix.shell().info("Symlinking Database Scripts to #{@target}")
    {opts, _} = OptionParser.parse!(args, strict: @switches, aliases: @aliases)

    message_db_home = Keyword.get(opts, :home)

    unless message_db_home do
      Mix.raise("--home is not set")
    end

    default_database_source = Path.join(message_db_home, "message-db/database")

    unless message_db_home do
      Mix.shell().error("--home is not set")
      exit(:normal)
    end

    unless Keyword.get(opts, :database_source) do
      Mix.shell().info("(--database_source is not set. Default will be used.)")
    end

    database_source = Keyword.get(opts, :database_source, default_database_source)
    Mix.shell().info("Database source is: #{database_source}")

    Mix.shell().info("")
    Mix.shell().info("Removing database directory (#{@target})")
    System.cmd("rm", ["-rf", @target])

    Mix.shell().info("Symlinking database scripts from #{database_source}")
    System.cmd("ln", ["-s", database_source, @target])
  end
end
