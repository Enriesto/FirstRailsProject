# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'authors/index'
  # get 'authors/show'
  # get 'books/index'
  # get 'books/show'

  # Both of these will go to the main "root" page
  root to: 'books#index'
  # get 'books', to: 'books#index'

  resources 'books', only: %i[index show]
  # GET /books      => books#index
  # GET /books/:id  => books#show

  resources 'authors', only: %i[index show]
  # GET /authors      => authors#index
  # GET /authors/:id  => authors#show

  # get 'authors', to: 'authors#index, as: ...'
  # get 'books/:id', to: 'books#show', id: /\d+/, as: 'book' # book_path
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
