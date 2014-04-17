module StuntProfilesHelper
	def credit_types
	    [
	      	['Movie', 'M'],
	      	['Commercial', 'C'],
	    	['Video', 'V']      
	    ]
	end

	def physique
		[
			['-- Please Select --', ''],
			['Average', 'AV'],
			['Build', 'BL']
		]
	end	

	def ethnicity
		[
			['-- Please Select --', ''],
			['Asian', 'AS'],
			['African', 'AF'],
			['Caucasian', 'CS'],
			['Hispanic', 'HS'],
			['Middle Eastern', 'ME']

		]
	end

	def eye_color
		[
			['-- Please Select --', ''],
			['Blue', 'Blue'],
			['Green', 'Green'],
			['Gray', 'Gray'],
			['Black', 'Black']
		]
	end

	def hair_color
		[
			['-- Please Select --', ''],
			['Gray', 'Gray'],
			['Brown', 'Brown'],
			['Black', 'Black']
		]
	end

	def hair_length
		[
			['-- Please Select --', ''],
			['Small', 'S'],
			['Large', 'L'],
			['Medium', 'Medium']
		]
	end

	def yes_no
		[
			['-- Please Select --', ''],
			['Yes', 1],
			['No', 0]
		]
	end

	def us_states
    [
      ['-- Please Select --', ''],
      ['Alabama', 'AL'],
      ['Alaska', 'AK'],
      ['Arizona', 'AZ'],
      ['Arkansas', 'AR'],
      ['California', 'CA'],
      ['Colorado', 'CO'],
      ['Connecticut', 'CT'],
      ['Delaware', 'DE'],
      ['District of Columbia', 'DC'],
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'],
      ['Idaho', 'ID'],
      ['Illinois', 'IL'],
      ['Indiana', 'IN'],
      ['Iowa', 'IA'],
      ['Kansas', 'KS'],
      ['Kentucky', 'KY'],
      ['Louisiana', 'LA'],
      ['Maine', 'ME'],
      ['Maryland', 'MD'],
      ['Massachusetts', 'MA'],
      ['Michigan', 'MI'],
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'],
      ['Missouri', 'MO'],
      ['Montana', 'MT'],
      ['Nebraska', 'NE'],
      ['Nevada', 'NV'],
      ['New Hampshire', 'NH'],
      ['New Jersey', 'NJ'],
      ['New Mexico', 'NM'],
      ['New York', 'NY'],
      ['North Carolina', 'NC'],
      ['North Dakota', 'ND'],
      ['Ohio', 'OH'],
      ['Oklahoma', 'OK'],
      ['Oregon', 'OR'],
      ['Pennsylvania', 'PA'],
      ['Puerto Rico', 'PR'],
      ['Rhode Island', 'RI'],
      ['South Carolina', 'SC'],
      ['South Dakota', 'SD'],
      ['Tennessee', 'TN'],
      ['Texas', 'TX'],
      ['Utah', 'UT'],
      ['Vermont', 'VT'],
      ['Virginia', 'VA'],
      ['Washington', 'WA'],
      ['West Virginia', 'WV'],
      ['Wisconsin', 'WI'],
      ['Wyoming', 'WY']
    ]
  end


	def link_to_remove_fields(name, f)
		f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")		
	end

	def link_to_add_fields(name, f, association)
	    new_object = f.object.class.reflect_on_association(association).klass.new
	    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
	      #render(association.to_s.singularize + "_fields", :ff => builder)
	      render("credit_fields", :ff => builder)
	    end
	    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end
end
