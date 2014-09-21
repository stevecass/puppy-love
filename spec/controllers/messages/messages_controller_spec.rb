require 'rails_helper'

describe MessagesController, type: :controller do

  let(:user){Owner.create(email: 'test@test.com', password: 'test')}

  before(:each) do 
    session[:current_user] = user.id
  end


  describe "#index" do 
    it "Should show all sent and received messages" do
      scruffy = Dog.create(name: 'Scruffy')
      zoey = Dog.create(name: 'Zoey')
      user.dogs << zoey
      message_to = Message.create(sender_id: zoey.id, recipient_id: scruffy.id, content: "Hi you.")
      message_from = Message.create(sender_id: scruffy.id, recipient_id: zoey.id, content: "Hello to you too.")
      
      get :index
      expect #there to be divs with the message ids specific to those two?
    end
    it "Should show the 'no messages' text if there aren't any messages" do 
      get :index
      expect #the inbox div to have the text for no messages
      expect #the sent messages div to have the text for no messages
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
      post :create, message: { 
        sender_id: 1,
        recipient_id: 2,
        content: "Hey there, Buddy!"
      }
      expect(response).to redirect_to '/messages'
    end
  end

  describe "#show" do 
    it "Should show the content" do 
      pending
    end
    it "Should have a delete button" do 
      pending
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
