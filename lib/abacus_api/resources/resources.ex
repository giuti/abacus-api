defmodule AbacusApi.Resources do
  @moduledoc """
  The Resources context.
  """

  import Ecto.Query, warn: false
  alias AbacusApi.Repo

  alias AbacusApi.Resources.Team
  alias AbacusApi.Resources.Gap

  @doc """
  Returns the list of teams.

  ## Examples

      iex> list_teams()
      [%Team{}, ...]

  """
  def list_teams do
    Repo.all(Team)
  end

  @doc """
  Gets a single team.

  Raises `Ecto.NoResultsError` if the Team does not exist.

  ## Examples

      iex> get_team!(123)
      %Team{}

      iex> get_team!(456)
      ** (Ecto.NoResultsError)

  """
  def get_team!(id), do: Repo.get!(Team, id)

  @doc """
  Creates a team.

  ## Examples

      iex> create_team(%{field: value})
      {:ok, %Team{}}

      iex> create_team(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_team(attrs \\ %{}) do
    %Team{}
    |> Team.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a team.

  ## Examples

      iex> update_team(team, %{field: new_value})
      {:ok, %Team{}}

      iex> update_team(team, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_team(%Team{} = team, attrs) do
    team
    |> Team.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Team.

  ## Examples

      iex> delete_team(team)
      {:ok, %Team{}}

      iex> delete_team(team)
      {:error, %Ecto.Changeset{}}

  """
  def delete_team(%Team{} = team) do
    Repo.delete(team)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking team changes.

  ## Examples

      iex> change_team(team)
      %Ecto.Changeset{source: %Team{}}

  """
  def change_team(%Team{} = team) do
    Team.changeset(team, %{})
  end

  alias AbacusApi.Resources.Gap

  @doc """
  Returns the list of gaps.

  ## Examples

      iex> list_gaps()
      [%Gap{}, ...]

  """
  def list_gaps do
    Repo.all(Gap)
  end

  @doc """
  Gets a single gap.

  Raises `Ecto.NoResultsError` if the Gap does not exist.

  ## Examples

      iex> get_gap!(123)
      %Gap{}

      iex> get_gap!(456)
      ** (Ecto.NoResultsError)

  """
  def get_gap!(id), do: Repo.get!(Gap, id)

  @doc """
  Creates a gap.

  ## Examples

      iex> create_gap(%{field: value})
      {:ok, %Gap{}}

      iex> create_gap(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_gap(attrs \\ %{}) do
    %Gap{}
    |> Gap.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a gap.

  ## Examples

      iex> update_gap(gap, %{field: new_value})
      {:ok, %Gap{}}

      iex> update_gap(gap, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_gap(%Gap{} = gap, attrs) do
    gap
    |> Gap.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Gap.

  ## Examples

      iex> delete_gap(gap)
      {:ok, %Gap{}}

      iex> delete_gap(gap)
      {:error, %Ecto.Changeset{}}

  """
  def delete_gap(%Gap{} = gap) do
    Repo.delete(gap)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking gap changes.

  ## Examples

      iex> change_gap(gap)
      %Ecto.Changeset{source: %Gap{}}

  """
  def change_gap(%Gap{} = gap) do
    Gap.changeset(gap, %{})
  end
end
