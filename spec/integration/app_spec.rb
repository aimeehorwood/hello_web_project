# file: spec/integration/application_spec.rb

require "spec_helper"
require "rack/test"
require_relative "../../app"

describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  context "GET to /hello" do
    it "returns 200 OK with the right content" do
      response = get("/hello", name: "Aimee")

      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello Aimee")
    end
  end

  context "GET /names" do
    it "returns 200 OK with the right content" do
      response = get("/names", names: "Julia,Mary,Karim")
      expect(response.status).to eq(200)
      expect(response.body).to eq("Julia,Mary,Karim")
    end
  end

  context "POST/sort-names" do
    it "returns 200 OK and sorts alphabetical" do
      response = post("/sort-names", names: "Joe,Alice,Zoe,Julia,Kieran")
      expect(response.status).to eq(200)
      expect(response.body).to eq ("Alice,Joe,Julia,Kieran,Zoe")
    end
  end

  context "POST to /submit" do
    it "returns 200 OK with the right content" do
      response = post("/submit", name: "Dana", message: "Hello world!")
      expect(response.status).to eq(200)
      expect(response.body).to eq("Thanks Dana, you sent this message: Hello world!")
    end
  end
end
