class ArtsController < ApplicationController
  before_action :set_art, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize!, only: [:edit, :update, :destroy]

  # GET /arts
  # GET /arts.json
  def index
    @arts = Art.all.all_with_comment_counts.order('updated_at DESC')
  # curl -H "Accept: application/json" http://localhost:3000/arts
    respond_to do |format|
      format.html {render}
      format.json {render json: @arts}
    end
  end

  # GET /arts/1
  # GET /arts/1.json
  def show
    @comment = Comment.new
    @comments = @art.comments.order(created_at: :desc)
    #show the likes inside the arts so we need to find the users who 
    #like the arts and save it in @like variable
    @like = @art.likes.find_by(user: current_user)
  end

  # GET /arts/new
  def new
    @art = Art.new
  end

  # GET /arts/1/edit
  def edit
  end


  def liked
    # all the art that this particular logged in user has liked
    @arts = current_user.liked_arts.all_with_comment_counts.order(created_at: :desc)
   
  end

  # POST /arts
  # POST /arts.json
  def create
    @art = Art.new(art_params)
    @art.user = current_user
    respond_to do |format|
      if @art.save
        format.html { redirect_to @art, notice: 'Art was successfully created.' }
        format.json { render :show, status: :created, location: @art }
      else
        format.html { render :new }
        format.json { render json: @art.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arts/1
  # PATCH/PUT /arts/1.json
  def update
    respond_to do |format|
      if @art.update(art_params)
        format.html { redirect_to art_path(@art), notice: 'Art was successfully updated.' }
        format.json { render :show, status: :ok, location: @art }
      else
        format.html { render :edit }
        format.json { render json: @art.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arts/1
  # DELETE /arts/1.json
  def destroy
    @art.destroy
    respond_to do |format|
      format.html { redirect_to arts_url, notice: 'Art was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_art
      @art = Art.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def art_params
      params.require(:art).permit(:title, :description, :image)
    end

    def authorize!
      redirect_to root_path, alert: 'Not Authorized' unless can?(:crud, @art)
  end
end
