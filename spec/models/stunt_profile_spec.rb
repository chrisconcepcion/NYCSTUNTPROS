require 'spec_helper'


describe StuntProfile do
  #pending "add some examples to (or delete) #{__FILE__}"
	let(:stunt_profile) { Fabricate(:stunt_profile) }
	#before { user.create_profile }
	#subject { stunt_profile }

	it { should be_valid }

	it { should respond_to(:age) }
	it { should respond_to(:occupation) }
	it { should respond_to(:height) }
	it { should respond_to(:weight) }
	it { should respond_to(:physique) }
	it { should respond_to(:user_id) }

	it { should_not respond_to(:user_id_dummy) }	

	it {should respond_to(:films)}
	it {should_not respond_to(:film)}

end
