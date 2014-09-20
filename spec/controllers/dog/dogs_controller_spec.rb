require 'rails_helper'

describe DogsController, type: :controller do

  let(:user){Owner.create(email: 'shiraj', password: 'test')}
  
  before(:each) do 
    session[:current_user] = user.id
  end

  describe "#new" do 
    it "Should show the dog creation form" do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "#create" do 
    it "Should create a new dog and redirect to it" do
      post :create, dog: { 
        name: "TestDog",
        gender: "female",
        size: "Small",
        breed: "SomeBreed",
        location: "Bronx",
        tagline: "Hot to Trot",
        bio: "Im just a girl"
      }
      expect(response).to redirect_to(dog_path(Dog.last))
    end
  end

  describe "#update" do 
    it "Should update a dogs info" do
      new_dog = Dog.create(name: "Barky")
      put :update, id: new_dog.id, dog:{ name: "Sir Barky"} 
      expect(response).to redirect_to(dog_path(Dog.last))
      expect(Dog.last.name).to eq("Sir Barky")
    end

    it "Should not update a dogs info when incorectly filled in" do
      new_dog = Dog.create(name: "Barky")
      put :update, id: new_dog.id, dog:{ name: ""} 
      expect(response).to render_template('edit')
    end
  end  

  describe "#destroy" do 
    it "Should delete a dog" do
      first_dog = Dog.create(name: "BarksyPrime")
      new_dog = Dog.create(name: "Barksy")
      user.dogs << new_dog
      delete :destroy, id: new_dog.id 
      expect(response).to redirect_to(root_path)
      expect(Dog.last.id).to eq(first_dog.id)
    end

    it "Should not delete a dog you dont own" do
      first_dog = Dog.create(name: "BarksyPrime")
      new_dog = Dog.create(name: "Barksy")
      user.dogs << new_dog
      delete :destroy, id: first_dog.id 
      expect(response).to render_template("edit")
    end
  end

end