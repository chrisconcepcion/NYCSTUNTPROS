require 'spec_helper'

describe SignUp do
    
    describe "#sign_up" do
        let(:user) { Fabricate(:user) }
        it "calls method create_profile on User" do
            expect_any_instance_of(User).to receive(:create_profile)
            SignUp.new(user).sign_up
        end
        it "calls method welcome_email on UserMailer" do
            expect_any_instance_of(UserMailer).to receive(:welcome_email)
            SignUp.new(user).sign_up
        end
    end

end