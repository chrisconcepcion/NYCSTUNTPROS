class StuntProfile < ActiveRecord::Base
	belongs_to :user
	
	has_many :films, dependent: :destroy
	accepts_nested_attributes_for :films, :allow_destroy => true, :reject_if => :all_blank

	has_many :televisions, dependent: :destroy
	accepts_nested_attributes_for :televisions, :allow_destroy => true, :reject_if => :all_blank
	
	has_many :commercials, dependent: :destroy
	accepts_nested_attributes_for :commercials, :allow_destroy => true, :reject_if => :all_blank

	has_many :music_videos, dependent: :destroy
	accepts_nested_attributes_for :music_videos, :allow_destroy => true, :reject_if => :all_blank

	has_many :video_games, dependent: :destroy
	accepts_nested_attributes_for :video_games, :allow_destroy => true, :reject_if => :all_blank

	has_many :industrials, dependent: :destroy
	accepts_nested_attributes_for :industrials, :allow_destroy => true, :reject_if => :all_blank

	has_many :profile_pictures, dependent: :destroy
	accepts_nested_attributes_for :profile_pictures, :allow_destroy => true, :reject_if => :all_blank

	
	validates :occupation, format: { with: /\A[a-zA-Z]+\z/,
    message: "Only letters allowed." }, allow_blank: true, :on => :update


    def self.search(params)
	    conditions = String.new
    	wheres = Array.new

	    # Age
	    if params[:min_age].present?
	    	conditions << " AND " unless conditions.length == 0
	    	conditions << "age >= ?"
      		wheres << params[:min_age]
	    end
	    if params[:max_age].present?
	    	conditions << " AND " unless conditions.length == 0
	    	conditions << "age <= ?"
      		wheres << params[:max_age]
	    end

	    # Height
	    if params[:min_height].present?
	    	conditions << " AND " unless conditions.length == 0
	    	conditions << "height >= ?"
      		wheres << params[:min_height]
	    end
	    if params[:max_height].present?
	    	conditions << " AND " unless conditions.length == 0
	    	conditions << "height <= ?"
      		wheres << params[:max_height]
	    end

	    # Weight
	    if params[:min_weight].present?
	    	conditions << " AND " unless conditions.length == 0
	    	conditions << "weight >= ?"
      		wheres << params[:min_weight]
	    end
	    if params[:max_weight].present?
	    	conditions << " AND " unless conditions.length == 0
	    	conditions << "weight <= ?"
      		wheres << params[:max_weight]
	    end

	    # Physique
	    if params[:physique_search].present?
	    	conditions << " AND " unless conditions.length == 0
	    	conditions << "physique = ?"
      		wheres << params[:physique_search]
	    end

	    # Ethnicity
	    if params[:ethnicity_search].present?
	    	conditions << " AND " unless conditions.length == 0
	    	conditions << "ethnicity = ?"
      		wheres << params[:ethnicity_search]
	    end

	    # Eye Color
	    if params[:eye_color_search].present?
	    	conditions << " AND " unless conditions.length == 0
	    	conditions << "eye_color = ?"
      		wheres << params[:eye_color_search]
	    end

	    # Hair Color
	    if params[:hair_color_search].present?
	    	conditions << " AND " unless conditions.length == 0
	    	conditions << "hair_color = ?"
      		wheres << params[:hair_color_search]
	    end



	    wheres.insert(0, conditions)

	    where(wheres)


	    # 
	    # if params[:min_age].present? && params[:max_age].present?
	    #   where("age > ? AND age < ?", "#{params[:min_age]}", "#{params[:max_age]}")
	    # elsif params[:min_age].present? && !params[:max_age].present?
	    #   where("age > ?", "#{params[:min_age]}")	
	    # elsif !params[:min_age].present? && params[:max_age].present?
	    #   where("age < ?", "#{params[:max_age]}")
	    # end

	    # if params[:min_height].present? && params[:max_height].present?
	    #   where("height > ? AND height < ?", "#{params[:min_height]}", "#{params[:max_height]}")
	    # elsif params[:min_height].present? && !params[:max_height].present?
	    #   where("height > ?", "#{params[:min_height]}")	
	    # elsif !params[:min_height].present? && params[:max_height].present?
	    #   where("height < ?", "#{params[:max_height]}")
	    # end
	    # 

	end

end
