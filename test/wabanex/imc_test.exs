defmodule Wabanex.INCTest do
  use ExUnit.Case, async: true

  describe "calculate/1" do
    test "when the file exists, returns the data" do
      params =%{"filename" => "students.csv"}
      response = Wabanex.IMC.calculate(params)
      expected_response =
        {:ok,
        %{
          "Dani" => 18.75,
          "Diego" => 20.50561797752809,
          "Gabul" => 20.0,
          "Rafael" => 22.033898305084744,
          "Rodrigo" => 23.61111111111111
        }}
      assert expected_response == response
    end

    test "when the file doesnt exists" do
      params =%{"filename" => "invalid.csv"}
      response = Wabanex.IMC.calculate(params)
      expected_response = {:error, "Erro ao abrir arquivo"}
      assert expected_response == response
    end
  end
end
