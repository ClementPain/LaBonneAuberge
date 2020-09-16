class CategoriesController < ApplicationController
  before_action :find_category, only: [:edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end
end
