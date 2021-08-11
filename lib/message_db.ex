defmodule MessageDb do
  def run(script, env \\ [], opts \\ []) do
    path = Keyword.get(opts, :path, Path.join([Application.app_dir(:message_db), "priv"]))

    system_opts = [
      cd: path,
      env: env,
      stderr_to_stdout: true,
      into: IO.stream(:stdio, :line)
    ]

    System.cmd("bash", ["database/#{script}.sh"], system_opts)
  end
end
