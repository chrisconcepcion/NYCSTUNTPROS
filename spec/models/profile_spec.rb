require 'spec_helper'

describe Profile do
	it { should have_many(:credits) }
	it { should belong_to(:user) }
  it { should validate_presence_of(:user_id) }
  it { should have_one(:contact) }
  it { should have_one(:employment) }
	it { should	ensure_inclusion_of(:height).in_range(48..96).allow_nil  }
	it { should ensure_inclusion_of(:physique).in_array(%w[slim average athletic muscular heavyset]).allow_nil.allow_blank   }
	it { should ensure_inclusion_of(:eye_color).in_array(%w[amber blue brown green grey hazel]).allow_nil.allow_blank  }
	it { should ensure_inclusion_of(:hair_color).in_array(%w[black brown blond auburn chestnut red gray]).allow_nil.allow_blank   }
	it { should ensure_inclusion_of(:ethnicity).in_array(%w[asian biracial indian hispanic middle_eastern native_american pacific_islander caucasian other]).allow_nil.allow_blank  }
	it { should ensure_inclusion_of(:hair_length).in_array(%w[short medium long]).allow_nil.allow_blank  }
  
end