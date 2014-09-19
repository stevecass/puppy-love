require 'rails_helper'

describe WelcomeController, type: :controller do

  it "should display a welcome message" do
    get :index

    expect(response).to render_template("index")
  end

end
