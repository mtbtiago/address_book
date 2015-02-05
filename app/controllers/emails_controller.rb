class EmailsController < ApplicationController
  def index
    @person = Person.find(params[:person_id])
    @emails = @person.emails.all
  end

  def new
    @person = Person.find(params[:person_id])
    @email = @person.emails.new
  end

  def create
    @person = Person.find(params[:person_id])
    @email = @person.emails.new(edit_params)

    if @email.save
      redirect_to(action: 'index')
    end
  end

  def edit
    @person = Person.find(params[:person_id])
    @email = @person.emails.find(params[:id])
  end

  def update
    @person = Person.find(params[:person_id])
    @email = @person.emails.find(params[:id])
    @email.update_attributes(edit_params)

    if @email.save
      flash[:notice] = "Data updated sccessfully"
      redirect_to(action: 'index')
    else
      flash[:error] = "Please, check errors"
      render('edit')
    end
  end

  def destroy
    @person = Person.find(params[:person_id])
    @email = @person.emails.find(params[:id])
    @email.destroy
    redirect_to(action: 'index')
  end

  def show
    @person = Person.find(params[:person_id])
    @email = @person.emails.find(params[:id])
  end

  private

  def edit_params
    params.require(:email).permit(:hours, :minutes, :date)
  end

end
