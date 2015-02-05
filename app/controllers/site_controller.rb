class SiteController < ApplicationController
  def home
    @people = Person.all
  end
end
