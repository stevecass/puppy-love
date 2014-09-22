require 'rails_helper'

describe MessagesController, type: :controller do

  let(:user){Owner.create(email: 'test@test.com', password: 'test')}
  let(:dog){user.dogs.create(owner_id: user.id, name: 'scruffy')}

  before(:each) do
    session[:current_user] = user.id
    session[:current_dog] = dog.id
  end

  describe "#index" do
    it "Should render the index template" do
      get :index
      expect(response).to render_template('index')
    end
    it "Should set @dog to current user's dog" do
      get :index
      expect(assigns(:dog)).to eq(Dog.find(session[:current_dog]))
    end
  end

describe "#new" do
    it "Should show the new message form" do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "#create" do
    receiving_dog = Dog.create(name: 'Teddy')

    it "Should create a new message and redirect to the index" do
      post :create, message: {sender_id: session[:current_dog], recipient_id: receiving_dog.id, content: "Hey there, Buddy!"}
      expect(response).to redirect_to '/messages'
    end
  end

  describe "#show" do
    let(:message){Message.create(sender_id: 1, recipient_id: 2, content: "Hey there, Buddy!")}
    it "Should render the show template" do
      get :show, id: message.id
      expect(response).to render_template('show')
    end
    it "Should show the message by id" do
      get :show, id: message.id
      expect(assigns(:message)).to eq(message)
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
