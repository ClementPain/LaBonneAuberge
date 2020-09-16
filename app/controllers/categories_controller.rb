class CategoriesController < ApplicationController
  before_action :find_category, only: [:edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(cat_params)
    @category.update(display: true)
    
    if @category.save
        redirect_to villages_path, notice: "La catégorie #{@category.title} a bien été créée ! Bien joué petit génie !"
    else
        redirect_to new_category_path, alert: "Veuillez renseigner toutes les informations"
    end
  end

  def edit

  end

  def update
    if @category.update(cat_params)
      redirect_to villages_path, notice: "La catégorie #{@category.title} a bien été mise à jour"
    else
      redirect_to edit_category_path(@category), alert: "Veuillez renseigner toutes les informations"
    end
  end

  def destroy

    @category.delete

    redirect_to villages_path, alert: "La catégorie a bien été supprimée"
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def cat_params
    params.require(:category).permit(:title)
  end
end
