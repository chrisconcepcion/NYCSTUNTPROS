require 'spec_helper'

describe ResetPassword do
  let(:user) { Fabricate(:user) }
		around(:each) { ActionMailer::Base.deliveries.clear }
    it "generates a reset_password_token for user" do
          ResetPassword.new(user).reset_password
        expect(user.reload.reset_password_token).to_not eq nil
      end
		it "sets reset_password_sent_at for user" do
			ResetPassword.new(user).reset_password
        expect(user.reload.reset_password_sent_at).to_not eq nil
		end	
	
		it "call save method on user" do
			expect(user).to receive(:save!).and_return(:true)
			ResetPassword.new(user).reset_password
		end
      it "sends user an email" do
          ResetPassword.new(user).reset_password
        expect(ActionMailer::Base.deliveries.count).to eq 1
      end
end