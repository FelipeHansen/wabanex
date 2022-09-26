defmodule WabanexWeb.IMCControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "when all params are valid, returns the imc info", %{conn: conn} do
      params = %{"filename" => "students.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

      expected_response = %{"result" =>
      %{
        "Dani" => 18.75,
        "Diego" => 20.50561797752809,
        "Gabul" => 20.0,
        "Rafael" => 22.033898305084744,
        "Rodrigo" => 23.61111111111111
        }}

      assert expected_response == response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{"filename" => "banana.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

      expected_response = %{"result" => "Erro ao abrir arquivo"}

      assert expected_response == response
    end
  end

end
