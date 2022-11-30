{{ GET }} {{ /names }} Route Design Recipe


1. Design the Route Signature
You'll need to include:

the HTTP method
the path
any query parameters (passed in the URL)
or body parameters (passed in the request body)

2. Design the Response

`200 OK`  

`Julia,Mary,Karim` 



`200 OK`

`Alice,Joe,Julia,Kieran,Zoe`


3. Write Examples
Replace these with your own design.

# Request:

GET /names

# Expected response:

Response for 200 OK

# Request:

POST /sort-names

# Expected response:

Response for 200 OK


4. Encode as Tests Examples


require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /names" do
    it 'returns 200 OK' do
     
      response = get('/names', names:["Julia,Mary,Karim"])
      expect(response.status).to eq(200)
      # expect(response.body).to eq("Julia,Mary,Karim")
    end


    context "POST/sort-names" do
    it 'returns 200 OK' do 

    response = post('/sort-names', names:["Joe,Alice,Zoe,Julia,Kieran"])
    expect(response.status).to eq(200)
    # expect(responde.body).to eq [Alice,Joe,Julia,Kieran,Zoe]
  end
end

5. Implement the Route
Write the route and web server code to implement the route behaviour.