require 'spec_helper'

describe UserMailer do
    describe "#welcome_email" do
        let(:user) { Fabricate(:user) }
        it "sends an email" do
            UserMailer.delay.welcome_email(user)
            expect(ActionMailer::Base.deliveries).to_not be_empty
        end
        it "sends an email to user" do
            UserMailer.delay.welcome_email(user)
            expect(ActionMailer::Base.deliveries.last.to.first).to eq user.email
        end
        it "sends an email from receiver" do
            UserMailer.delay.welcome_email(user)
            expect(ActionMailer::Base.deliveries.last.from.first).to eq "info@nycstuntpros.com"
        end
        it "sends an email with subject" do
            UserMailer.delay.welcome_email(user)
            expect(ActionMailer::Base.deliveries.last.subject).to eq "Welcome to NYCSTUNTPROS!"
        end
        it "sends an email with body" do
            UserMailer.delay.welcome_email(user)
            expect(ActionMailer::Base.deliveries.last.body).to include "Welcome to NYCSTUNTPROS BODY"
        end
    end
    
    describe "#reset_password" do
        let(:user) { Fabricate(:user, reset_password_token: "token") }
            
      it "sends an email" do
        UserMailer.delay.reset_password(user)
        expect(ActionMailer::Base.deliveries.count).to eq 1
      end
        
      it "sends an email to user" do
        UserMailer.delay.reset_password(user)
        expect(ActionMailer::Base.deliveries.last.to.first).to eq user.email
      end
      it "sends an email from receipient" do
          UserMailer.delay.reset_password(user)
          expect(ActionMailer::Base.deliveries.last.from.first).to eq "info@nycstuntpros.com"
      end
      it "sends an email with subject" do
        UserMailer.delay.reset_password(user)
        expect(ActionMailer::Base.deliveries.last.subject).to eq "Reset your password for NYCSTUNTPROS"
      end
      it "sends an email with body" do
        UserMailer.delay.reset_password(user)
        expect(ActionMailer::Base.deliveries.last.body).to include update_password_url(user.reset_password_token).to_s
      end
    end
end