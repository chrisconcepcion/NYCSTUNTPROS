module ApplicationHelper
    def to_height(num)
		if num == nil
			""
		else
			feet = num/12
			remainder = num % 12
			if remainder == 0
				"#{feet} feet"
			else
				"#{feet} feet #{pluralize(remainder, 'inch', 'inches')}"
			end
			end
		end
	def age(dob)
  now = Time.now.utc.to_date
  now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
end
end
