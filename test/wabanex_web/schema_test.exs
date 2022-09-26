defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.User
  describe "users queries" do
    test "when a valid id is given, return the user", %{conn: conn} do
      params = %{email: "felipe2@gmail.com", name: "Felipe", password: "123456"}

      {:ok, %User{id: user_id}} = Wabanex.Users.Create.call(params)

      query = """
        {
          getUser(id: "#{user_id}"){
            name,
            email
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      expected_response = %{"data" => %{"getUser" => %{"email" => "felipe2@gmail.com", "name" => "Felipe"}}}

      assert expected_response == response
    end
  end

  describe "users mutations" do
    test "when all params are valid, return the user", %{conn: conn} do

    mutation = """
      mutation{
        createUser(input: {name: "Joao", email: "joanderson@gmail.com", password: "123456"}){
          name
          id
        }
      }
    """
    response =
      conn
      |> post("/api/graphql", %{query: mutation})
      |> json_response(:ok)

    assert %{"data" => %{"createUser" => %{"id" => _id, "name" => "Joao"}}} = response

    end

  end


end
