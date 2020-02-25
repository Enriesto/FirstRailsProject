# frozen_string_literal: true

class AuthorsController < ApplicationController
  # GET /authors
  def index
    @authors = Author.order(:name)
  end
  # Automatically loads view:
  # views/authors/index.html.erb

  # GET /authors/:id
  def show; end
end
