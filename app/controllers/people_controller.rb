class PeopleController < ApplicationController
  before_action :get_all_people, only: [:index, :create, :update, :destroy]
  before_action :find_person, only: [:edit, :update, :destroy]
  respond_to :html, :js

  def new
    @person = Person.new
  end

  def create
    @person = Person.create(person_params)
  end

  def update
    @person.update_attributes(person_params)
  end

  def destroy
    @person.destroy
  end

private

  def get_all_people
    @people = Person.order(:created_at)
  end

  def find_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:gender, :height, :weight)
  end
end