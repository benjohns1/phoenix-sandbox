defmodule Rumbl.UserTest do
  use Rumbl.ModelCase, async: true
  alias Rumbl.User
  @valid_attrs %{name: "A User", username: "eva", password: "secret"}
  @invalid_attrs %{}
  @username_maxlength 20
  @password_minlength 6

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changset does not accept long usernames" do
    attrs = Map.put(@valid_attrs, :username, String.duplicate("a", @username_maxlength+1))
    assert {:username, "should be at most #{@username_maxlength} character(s)"} in errors_on(%User{}, attrs)
  end

  test "registration_changeset password must be at least #{@password_minlength} chars long" do
    attrs = Map.put(@valid_attrs, :password, String.duplicate("a", @password_minlength-1))
    changeset = User.registration_changeset(%User{}, attrs)
    assert {:password, {"should be at least %{count} character(s)", [count: @password_minlength, validation: :length, min: @password_minlength]}} in changeset.errors
  end

  test "registration_changeset with valid attributes hashes password" do
    attrs = Map.put(@valid_attrs, :password, "123456")
    changeset = User.registration_changeset(%User{}, attrs)
    %{password: pass, password_hash: pass_hash} = changeset.changes

    assert changeset.valid?
    assert pass_hash
    assert Comeonin.Bcrypt.checkpw(pass, pass_hash)
  end
end