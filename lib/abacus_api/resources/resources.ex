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

  alias AbacusApi.Resources.Match

  @doc """
  Returns the list of matches.

  ## Examples

      iex> list_matches()
      [%Match{}, ...]

  """
  def list_matches do
    Repo.all(Match)
  end

  @doc """
  Gets a single match.

  Raises `Ecto.NoResultsError` if the Match does not exist.

  ## Examples

      iex> get_match!(123)
      %Match{}

      iex> get_match!(456)
      ** (Ecto.NoResultsError)

  """
  def get_match!(id), do: Repo.get!(Match, id)

  @doc """
  Creates a match.

  ## Examples

      iex> create_match(%{field: value})
      {:ok, %Match{}}

      iex> create_match(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_match(attrs \\ %{}) do
    %Match{}
    |> Match.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a match.

  ## Examples

      iex> update_match(match, %{field: new_value})
      {:ok, %Match{}}

      iex> update_match(match, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_match(%Match{} = match, attrs) do
    match
    |> Match.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Match.

  ## Examples

      iex> delete_match(match)
      {:ok, %Match{}}

      iex> delete_match(match)
      {:error, %Ecto.Changeset{}}

  """
  def delete_match(%Match{} = match) do
    Repo.delete(match)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking match changes.

  ## Examples

      iex> change_match(match)
      %Ecto.Changeset{source: %Match{}}

  """
  def change_match(%Match{} = match) do
    Match.changeset(match, %{})
  end
end
