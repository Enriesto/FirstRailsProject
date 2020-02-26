# frozen_string_literal: true

class AuthorsController < ApplicationController
  # GET /authors
  def index
    @authors = Author.order(:name)
  end
  # Automatically loads view:
  # views/authors/index.html.erb

  # GET /authors/:id    => params[:id]
  def show
    @author = Author.find(params[:id])
  end
  # Automatically loads view:
  # views/authors/show.html.erb
end
