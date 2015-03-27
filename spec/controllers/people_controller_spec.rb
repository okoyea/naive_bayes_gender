require 'rails_helper'
require 'spec_helper'

describe PeopleController, type: :controller do

  describe 'GET index' do
    let!(:test_people) { create_list :person, 4, :male  }
    before(:each) { get :index }

    it 'should assign all users to @posts' do
      expect(assigns(:people)).to match_array test_people
    end

    it 'should succeed' do
      expect(response).to be_success
    end
  end

  describe 'POST create' do
    it "should create a new post" do
      expect {
        post :create, person: attributes_for(:person), format: :js
      }.to change(Person, :count).by(1)
    end
  end

  describe 'PUT update' do
    let! (:person) { create :person, :male  }

    it "should update the post post" do
      put :update, id: person.id, person: { gender: 'female'}, format: :js
      expect(person.reload.gender).to eq 'female'
    end
  end

  describe 'PUT update' do
    let! (:person) { create :person }

    it "should update the post post" do
      expect { delete :destroy, id: person.id, format: :js }.to change(Person, :count).by(-1)
    end
  end
end