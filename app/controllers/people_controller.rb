class PeopleController < ApplicationController
  def index
    @people = Person.all.order(:name)
  end

  def show
    @person = Person.find(params[:id]) # raises an exception
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(edit_params)

    if @person.save
      redirect_to(action: 'index')
      flash[:notice] = "Person created sccessfully"
    else
      flash[:error] = "Please, check errors"
      render('new')
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    @person.update_attributes(edit_params)

    if @person.save
      flash[:notice] = "Data updated sccessfully"
      redirect_to(action: 'index')
    else
      flash[:error] = "Please, check errors"
      render('edit')
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    redirect_to(action: 'index')
  end

  private

  def edit_params
    params.require(:person).permit(:name, :address)
  end
end
