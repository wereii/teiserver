defmodule CentralWeb.Admin.GeneralView do
  use CentralWeb, :view
  use Timex

  @build_time_priv Timex.now()

  def build_time() do
    @build_time_priv
  end

  @spec view_colour :: atom
  def view_colour(), do: :default

  @spec icon() :: String.t()
  def icon(), do: Central.Admin.AdminLib.icon()

  @spec view_colour(String.t()) :: atom
  def view_colour("user"), do: Central.Account.UserLib.colours()
  def view_colour("codes"), do: Teiserver.Account.CodeLib.colours()
  def view_colour("site_config"), do: Teiserver.Config.SiteConfigLib.colours()
  def view_colour("tool"), do: Central.Admin.ToolLib.colours()
end
