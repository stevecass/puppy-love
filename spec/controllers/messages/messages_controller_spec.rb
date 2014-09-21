require 'rails_helper'
require 'spec_helper'

describe MessagesController, type: :controller do

  let(:user){Owner.create(email: 'test@test.com', password: 'test')}

  before(:each) do
    session[:current_user] = user.id
  end


  describe "#index" do
    it "Should show all sent and received messages" do
      user_one = Owner.create(email: 'testy@test.com', password: 'test')
      scruffy = Dog.create(name: 'Scruffy')
      zoey = Dog.create(name: 'Zoey')
      user_one.dogs << zoey
      message_to = Message.create(sender_id: zoey.id, recipient_id: scruffy.id, content: "Hi you.")
      message_from = Message.create(sender_id: scruffy.id, recipient_id: zoey.id, content: "Hello to you too.")

      get :index
      expect(response.body).to have_css('div#inbox div#received_message')
      expect(response.body).to have_css('div#outbox div#sent_message')
    end
    it "Should show the 'no messages' text if there aren't any messages" do
      get :index
      expect(response.body).to have_css('div#inbox p', :text => "You have 0 messages in your inbox.")
      expect(response.body).to have_css('div#outbox p', :text => "You have not sent a message.")
    end
  end

describe "#new" do
    it "Should show the new message form" do
      get :new
      expect(response).to render_template('new')
    end
  end


  describe "#create" do
    it "Should create a new message and redirect to the index" do
      scruffy = Dog.create(name: 'Scruffy')
      zoey = Dog.create(name: 'Zoey')

      post :create, message: {
        sender_id: scruffy.id,
        recipient_id: zoey.id,
        content: "Hey there, Buddy!"
      }
      expect(response).to redirect_to '/messages'
    end
  end

  describe "#show" do
    user_two = Owner.create(email: 'test2@test.com', password: 'test')
    scruffy = Dog.create(name: 'Scruffy')
    zoey = Dog.create(name: 'Zoey')
    user_two.dogs << zoey
    message = Message.create(sender_id: zoey.id, recipient_id: scruffy.id, content: "Hi you.")
    it "Should show the content" do
      redirect_to '/messages/1'
      expect(response.body).to have_content(message.content)
    end
    it "Should have a delete button" do
      redirect_to '/messages/1'
      expect(response.body).to have_css('form')
    end
  end

  describe "#destroy" do
    it "Should delete a message" do
      message_one = Message.create(sender_id: 1, recipient_id: 2, content: "Hi you.")
      message_two = Message.create(sender_id: 2, recipient_id: 1, content: "Hello to you too.")
      delete :destroy, id: message_two.id
      expect(response).to redirect_to '/messages'
      expect(Message.last.id).to eq(message_one.id)
    end
  end
end
