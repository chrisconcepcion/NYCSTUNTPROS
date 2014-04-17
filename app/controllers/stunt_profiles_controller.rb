class StuntProfilesController < ApplicationController
  before_action :set_stunt_profile, only: [:show, :edit, :update, :destroy]

  # GET /stunt_profiles
  # GET /stunt_profiles.json
  def index
    @stunt_profiles = StuntProfile.all
  end

  # GET /stunt_profiles/1
  # GET /stunt_profiles/1.json
  def show
  end

  # GET /stunt_profiles/new
  def new
    @stunt_profile = StuntProfile.new    
  end

  # GET /stunt_profiles/1/edit
  def edit
    if @stunt_profile.profile_pictures.count == 0
      @stunt_profile.profile_pictures.create!
    end
  end

  # POST /stunt_profiles
  # POST /stunt_profiles.json
  def create
    @stunt_profile = StuntProfile.new(stunt_profile_params)

    respond_to do |format|
      if @stunt_profile.save
        format.html { redirect_to @stunt_profile, notice: 'Stunt profile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @stunt_profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @stunt_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stunt_profiles/1
  # PATCH/PUT /stunt_profiles/1.json
  def update
    respond_to do |format|
      if @stunt_profile.update(stunt_profile_params)
        format.html { redirect_to @stunt_profile, notice: 'Stunt profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @stunt_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stunt_profiles/1
  # DELETE /stunt_profiles/1.json
  def destroy
    @stunt_profile.destroy
    respond_to do |format|
      format.html { redirect_to stunt_profiles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stunt_profile
      @stunt_profile = StuntProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stunt_profile_params
      params.require(:stunt_profile).permit(:user_id, :age, :occupation, :height, :weight, :physique, :ethnicity, :eye_color, :hair_color, :hair_length, :neck_size, :sleeve_size, :suit_size, :waist, :pant_length, :shoe_size, :hat_size, :glove_size, :address, :city, :state, :zip_code, :phone_number, :website, :skills, :education, :training, :work_history, :job_categories, :post_job_titles, :unpaid_work, :authorized_to_work, :primary_citizenship, :valid_passport,
        films_attributes: [:id, :stunt_profile_id, :credit_type, :project_title, :role, :company,:_destroy],
        televisions_attributes: [:id, :stunt_profile_id, :credit_type, :project_title, :role, :company,:_destroy],
        commercials_attributes: [:id, :stunt_profile_id, :credit_type, :project_title, :role, :company,:_destroy],
        music_videos_attributes: [:id, :stunt_profile_id, :credit_type, :project_title, :role, :company,:_destroy],
        video_games_attributes: [:id, :stunt_profile_id, :credit_type, :project_title, :role, :company,:_destroy],
        industrials_attributes: [:id, :stunt_profile_id, :credit_type, :project_title, :role, :company,:_destroy],
        profile_pictures_attributes: [:id, :stunt_profile_id, :picture, :is_profile_picture, :_destroy])
    end
end
