defmodule HomebridgeWebSwitchWeb.API.TVSwitchController do
  use HomebridgeWebSwitchWeb, :controller

  require Logger

  @cec_on_command "echo 'on __CEC_ADDRESS__' | cec-client -s -d 1"
  @cec_off_command "echo 'standby __CEC_ADDRESS__' | cec-client -s -d 1"

  def index(conn, %{"on" => on_off}) do
    case on_off |> get_cec_command() |> send_cec_command() do
      :ok -> json(conn, %{"resp" => "ok"})
      {:error, msg} -> json(conn, %{"resp" => "error while calling command line: #{msg}"})
    end
  end

  def index(conn, params) do
    Logger.error("illegal params: #{inspect(params)}")
    json(conn, %{"resp" => "error, illegal params"})
  end

  defp get_cec_command(true), do: @cec_on_command
  defp get_cec_command(false), do: @cec_off_command

  defp send_cec_command(cmd) do
    case cmd |> String.replace("__CEC_ADDRESS__", cec_address()) |> System.shell() do
      {_, 0} ->
        :ok

      {_, exit_val} ->
        Logger.error("error while sending command, exited with #{exit_val}")
        {:error, "exited with #{exit_val}"}
    end
  end

  defp cec_address,
    do: Application.get_env(:homebridge_web_switch, __MODULE__) |> Keyword.get(:cec_address)
end
