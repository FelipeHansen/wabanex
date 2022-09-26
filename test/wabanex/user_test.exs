defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  describe "changeset/1" do
    test "when all params are valid, return a valid changeset" do
      params = %{name: "Rafael", email: "rafael_banana.com", password: "123456"}
      response = Wabanex.User.changeset(params)
      assert %Ecto.Changeset{
        valid?: true,
         changes: %{email: "rafael_banana.com", name: "Rafael", password: "123456"},
         errors: []
         } = response
    end

    test "when there are invalid params, return an invalid changeset" do
      params =%{name: "R", email: "rafael@banana.com"}
      response = Wabanex.User.changeset(params)

      expected_response = %{name: ["should be at least 2 character(s)"], password: ["can't be blank"]}

      assert errors_on(response) == expected_response
    end

  end
end
