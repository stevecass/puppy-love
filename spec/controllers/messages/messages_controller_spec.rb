require 'rails_helper'
require 'spec_helper'

describe MessagesController, type: :controller do

  let(:user){Owner.create(email: 'test@test.com', password: 'test')}
  let(:dog){user.dogs.create(owner_id: user.id, name: 'scruffy')}

  before(:each) do
    session[:current_user] = user.id
  end


  describe "#index" do
    it "Should render the index template" do
      get :index
      expect(response).to render_template('index')
    end
    it "Should set @dog to current user's dog" do
      expect(@dog).to eq(Dog.find_by(owner_id: user.id))
    end
  end

describe "#new" do
    it "Should show the new message form" do
      get :new
      expect(response).to render_template('new')
    end
  end


  describe "#create" do
    session = {}
    user = Owner.create(email: 'test2@test.com', password: 'test')
    receiving_dog = Dog.create(name: 'Teddy')
    sending_dog = Dog.create(name: 'Max')
    session[:current_user] = user.id
    user.dogs << sending_dog

    it "Should create a new message and redirect to the index" do
      post :create, message: {sender: sending_dog.id, recipient: receiving_dog.id, content: "Hey there, Buddy!"}
      expect(response).to redirect_to '/messages'
    end
  end
# This one has been giving me trouble. Also, it can and probably should be split up into two tests - one for th creation and one for the redirect...?




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
