require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  describe 'Creating a new post' do
    context 'GET /' do
      it 'should get the form to add a new post' do
        response = get('/')

        expect(response.status).to eq(200)
        expect(response.body).to include('<form method="POST" action="/posts">')
        expect(response.body).to include('<input type="text" name="title" pattern="[a-zA-Z0-9,]*"/>')
        expect(response.body).to include('<input type="text" name="content" pattern="[a-zA-Z0-9,]*"/>')
        expect(response.body).to include('<input type="text" name="tags" pattern="[a-zA-Z0-9,]*"/>')
      end
    end

    context 'POST /' do
     it 'should add the new post' do
        response = post(
          '/posts',
          title: 'A new post',
          content: ('https://www.youtube.com/watch?v=_u-7rWKnVVo'),
          tags: 'random,things'
        )

        response = get('/')

        expect(response.body).to include('<h3>A new post</h3>')
        expect(response.body).to_not include('=+*%@#£^`!/?-')
      end
    end
  end
end

