defmodule Wabanex.Training do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wabanex.{Exercise, User}

  @fields [:end_date, :start_date, :user_id]
  @primary_key {:id, :binary_id, autogenerate: true}

  @foreign_key_type :binary_id

  schema "trainings" do
    field :end_date, :date
    field :start_date, :date

    belongs_to :user, User
    has_many :exercises, Exercise

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> unique_constraint([:user_id])
    |> cast_assoc(:exercises)
  end
end
