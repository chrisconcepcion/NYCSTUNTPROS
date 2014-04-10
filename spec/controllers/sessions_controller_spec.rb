require 'spec_helper'

describe SessionsController do
    describe "GET new" do
        
    end
    
    describe "POST create" do
        let(:user) { Fabricate(:user) }
        it "signs in a user" do
            post :create, email: user.email, password: user.password
            expect(session[:user_id]).to eq user.id
        end

        it "redirects to home" do
            post :create, email: user.email, password: user.password
            expect(response).to redirect_to root_path
        end
        it "displays a flash notice" do
            post :create, email: user.email, password: user.password
            expect(flash[:notice]).to eq "You have successfully logged in!"
        end
    end
    
    describe "GET destroy" do
        it "logs out a user" do
            post :destroy
            expect(session[:user_id]).to eq nil
        end
        
        it "redirects to root path" do
            get :destroy 
            expect(response).to redirect_to root_path
        end
        
        it "displays a flash notice" do
            get :destroy
            expect(flash[:notice]).to eq "You have successfully logged out."
        end
    end
end