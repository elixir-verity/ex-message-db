defmodule MessageDb do
  def run(script, env \\ [], opts \\ []) do
    path = path(opts)
    system_opts = [
      cd: path,
      env: env,
      stderr_to_stdout: true,
      into: IO.stream(:stdio, :line)
    ]

    Mix.shell().info("Running database scripts in #{path}...")
    System.cmd("bash", ["database/#{script}.sh"], system_opts)
  end

  defp path(opts) do
    cwd = File.cwd!()
    Keyword.get(opts, :path, Path.join([cwd, "priv"]))
  end
end
