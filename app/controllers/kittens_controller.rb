class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json {render :json => @kittens}
    end
  end

	def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render :json => @kitten}
    end

	end

	def new
    @kitten = Kitten.new
	end

	def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "Kitten Created"
      redirect_to kittens_path
    else
      render 'new'
    end
	end

	def edit
    @kitten = Kitten.find_by(params[:id])
	end

	def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update_attributes(kitten_params)
      flash[:success] = "kitten updated"
      redirect_to kittens_path
    else
      render 'edit'
    end
	end

	def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:success] = "Kitten Deleted"
    redirect_to kittens_path
	end


  private
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end


