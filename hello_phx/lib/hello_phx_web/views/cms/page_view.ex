defmodule HelloPhxWeb.CMS.PageView do
  use HelloPhxWeb, :view

  alias HelloPhx.CMS

  def author_name(%CMS.Page{author: author}) do
    author.user.name
  end
end
