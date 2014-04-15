require 'spec_helper'

describe ResetPassword do
  let(:user) { Fabricate(:user) }
    it "generates a reset_password_token for user" do
          ResetPassword.new(user).reset_password
        expect(user.reload.reset_password_token).to_not eq nil
      end
      it "sends user an email" do
          ResetPassword.new(user).reset_password
        expect(ActionMailer::Base.deliveries.count).to eq 1
      end
end