defmodule ImageSharing.Model.Image do
  use ImageSharing.Web, :model

  schema "images" do
    field :filename, :string
    timestamps()
  end

  @required_fields ~w(filename)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def create_changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
