# frozen_string_literal: true

class AuthorsController < ApplicationController
  # GET /authors
  # We're also taking care of any potential N+1 issues
  # Future consideration: better way to put it?
  def index
    @authors = Author.includes(:books).order(:name)
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
