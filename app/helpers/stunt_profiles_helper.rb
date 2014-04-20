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
			['-- Please Select --', 0],
			['Average', 1],
			['Build', 2]
		]
	end	

	def ethnicity
		[
			['-- Please Select --', 0],
			['Asian', 1],
			['African', 2],
			['Caucasian', 3],
			['Hispanic', 4],
			['Middle Eastern', 5]

		]
	end

	def eye_color
		[
			['-- Please Select --', 0],
			['Amber', 1],
			['Blue', 2],
			['Brown', 3],
			['Gray', 4],
			['Green', 5],			
			['Hazel', 6]
		]
	end

	def hair_color
		[
			['-- Please Select --', 0],
			['Auburn', 1],
			['Black', 2],
			['Blonde', 3],
			['Brown', 4],
			['Chestnut', 5],
			['Gray', 6],			
			['Red', 7],
			['White', 8]
		]
	end

	def hair_length
		[
			['-- Please Select --', 0],
			['Ear', 1],
			['Chin', 2],
			['Neck', 3],
			['Shoulder', 4],
			['Collarbone', 5],
			['Armpit', 6],
			['Bra Strap', 7],
			['Mid-back', 8],
			['Waist', 9],
			['Hip', 10],
			['Tailbone', 11],
			['Classic', 12],
			['Mid-thigh', 13],
			['Knee', 14],
			['Calf', 15],
			['Ankle', 16],
			['Floor', 17]
			
		]
	end

	def neck_size
		[
			['-- Please Select --', '0'],
			['14"', '1'],
			['14½"', '2'],
			['15"', '3'],
			['15½"', '4'],
			['16"', '5'],
			['16½"', '6'],
			['17"', '7'],
			['17½"', '8'],
			['18"', '9'],
			['18½"', '10']
		]
	end

	def suit_size
		[
			['-- Please Select --', ''],
			['36S', '1'],
			['36R', '2'],
			['36L', '3'],
			['38S', '4'],
			['38R', '5'],
			['38L', '6'],
			['40S', '7'],
			['40R', '8'],
			['40L', '9'],
			['42S', '10'],
			['42R', '11'],
			['42L', '12'],
			['44S', '13'],
			['44R', '14'],
			['44L', '15'],
			['46S', '16'],
			['46R', '17'],
			['46L', '18'],
			['48S', '19'],
			['48R', '20'],
			['48L', '21'],
			['50S', '22'],
			['50R', '23'],
			['50L', '24'],
			['52S', '25'],
			['52R', '26'],
			['52L', '27'],
			['54S', '28'],
			['54R', '29'],
			['54L', '30']
		]
	end

	def sleeve_size
		[
			['-- Please Select --', '0'],
			['32', '1'],
			['33', '2'],
			['34', '3'],
			['35', '4'],
			['36', '5']
		]
	end

	def waist_size
		[
			['-- Please Select --', '0'],
			['24', '1'],
			['25', '2'],
			['26', '3'],
			['27', '4'],
			['28', '5'],
			['29', '6'],
			['30', '7'],
			['31', '8'],
			['32', '9'],
			['33', '10'],
			['34', '11'],
			['35', '12'],
			['36', '13'],
			['37', '14'],
			['40', '15'],
			['41', '16'],
			['42', '17'],
			['43', '18'],
			['44', '19'],
			['45', '20'],
			['46', '21'],
			['47', '22'],
			['48', '23'],

		]
	end

	def pant_length_inseam
		[
			['-- Please Select --', '0'],
			['28"', '1'],			
			['29"', '2'],			
			['30"', '3'],			
			['31"', '4'],
			['32"', '5'],
			['33"', '6'],
			['34"', '7'],
			['35"', '8'],
			['36"', '9'],
			['37"', '10'],
			['38"', '11'],
			['39"', '12'],
			['40"', '13'],
			['41"', '14'],
			['42"', '15'],
			['43"', '16'],
			['44"', '17']
		]
	end

	def shoe_size
		[
			['-- Please Select --', '0'],
			['5"', '1'],
			['5½"', '2'],
			['6"', '3'],
			['6½"', '4'],
			['7"', '5'],
			['7½"', '6'],
			['8"', '7'],
			['8½"', '8'],
			['9"', '9'],
			['9½"', '10'],
			['10"', '11'],
			['10½"', '12'],
			['11"', '13'],
			['11½"', '14'],
			['12"', '15'],
			['12½"', '16']
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

def javascript(*files)
  content_for(:head) { javascript_include_tag(*files) }
end