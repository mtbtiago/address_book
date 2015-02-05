class PhonesController < ApplicationController
  def index
    @person = Person.find(params[:person_id])
    @phones = @person.phones.all
  end

  def new
    @person = Person.find(params[:person_id])
    @phone = @person.phones.new
  end

  def create
    @person = Person.find(params[:person_id])
    @phone = @person.phones.new(edit_params)

    if @phone.save
      redirect_to(action: 'index')
    end
  end

  def edit
    @person = Person.find(params[:person_id])
    @phone = @person.phones.find(params[:id])
  end

  def update
    @person = Person.find(params[:person_id])
    @phone = @person.phones.find(params[:id])
    @phone.update_attributes(edit_params)

    if @phone.save
      flash[:notice] = "Data updated sccessfully"
      redirect_to(action: 'index')
    else
      flash[:error] = "Please, check errors"
      render('edit')
    end
  end

  def destroy
    @person = Person.find(params[:person_id])
    @phone = @person.phones.find(params[:id])
    @phone.destroy
    redirect_to(action: 'index')
  end

  def show
    @person = Person.find(params[:person_id])
    @phone = @person.phones.find(params[:id])
  end

  private

  def edit_params
    params.require(:phone).permit(:hours, :minutes, :date)
  end
end
