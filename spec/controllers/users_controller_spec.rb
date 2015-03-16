require 'spec_helper'

describe UsersController do
	describe "GET new" do
		it_behaves_like "when user is authenticated" do
			let(:action) { get :new }
		end
		
		it "sets user variable" do
			get :new
			expect(assigns(:user)).to be_new_record
			expect(assigns(:user)).to be_instance_of(User)
		end
	end
	describe "POST create" do
		it_behaves_like "when user is authenticated" do
			let(:action) { post :create, user: {} }
		end
    context "when user fields are valid" do
    	it "creates a user" do
      	post :create, user: Fabricate.attributes_for(:user)
        expect(User.count).to eq 1
      end 
      it "calls method sign_up on SignUp" do
			 	SignUp.any_instance.should_receive(:sign_up)
        post :create, user: Fabricate.attributes_for(:user)
      end 
      it "redirects to /" do
       	post :create, user: Fabricate.attributes_for(:user)
       	expect(response).to redirect_to root_path
      end
      it "displays a flash notice" do
      	post :create, user: Fabricate.attributes_for(:user)
        expect(flash[:notice]).to eq "Thanks for signing up! Now sign in with your credentials."
      end
    end
    context "when user field are invalid" do
    	it "doesn't call method signup service on SignUp" do
      	SignUp.any_instance.should_not_receive(:sign_up)
        post :create, user: Fabricate.attributes_for(:invalid_user)
      end
      it "doesn't create a user" do
      	post :create, user: Fabricate.attributes_for(:invalid_user)
        expect(User.count).to eq 0
      end
      it "renders new" do
      	post :create, user: Fabricate.attributes_for(:invalid_user)
        expect(response).to render_template :new
      end
    end
  end
	describe "GET edit" do
		it_behaves_like "when user is not authenticated" do
			let(:action) { get :edit, id: "not_a_real_id" }
		end
		it_behaves_like "when user is not owner" do
			let(:action) { get :edit, id: "not_a_real_id" }
		end
		it "sets user variable" do
			set_current_user
			get :edit, id: current_user.id
			expect(assigns(:user)).to eq current_user
		end
	end
	describe "POST update" do
		before { set_current_user(Fabricate(:user)) }
		let(:UpdateUser) { double(UpdateUser, successful?: true) }
		it_behaves_like "when user is not authenticated" do
			let(:action) { post :update, id: "not_a_real_id" }
		end
		it_behaves_like "when user is not owner" do
			let(:action) { post :update, id: "not_a_real_id" }
		end
		context "with valid user fields with password and password confirmation present" do
			it "redirects to root" do
				update = double(:update, successful?: true)
				UpdateUser.any_instance.should_receive(:update_user).and_return(update)
				post :update, id: current_user.id, user: { first_name: "name1", middle_name: "name2", last_name: "name3", email:"changedemail@example.com", password: "newPass", password_confirmation: "newPass", roles: "both", gender: "male" }
				expect(response).to redirect_to root_path
			end
			it "displays a flash notice" do
				update = double(:update, successful?: true)
				UpdateUser.any_instance.should_receive(:update_user).and_return(update)
				post :update, id: current_user.id, user: { first_name: "name1", middle_name: "name2", last_name: "name3", email:"changedemail@example.com", password: "newPass", password_confirmation: "newPass", roles: "both", gender: "male" }
				expect(flash[:notice]).to eq "Your account has been updated."
			end
		end
		context "with invalid input" do
			it "displays a flash error" do
				update = double(:update, successful?: false, error_message: "Please check the form for errors.")
				UpdateUser.any_instance.should_receive(:update_user).and_return(update)
				post :update, id: current_user.id, user: { first_name: "name1", middle_name: "name2", last_name: "name3", email:"changedemail@example.com", password: "not_working", password_confirmation: "badPass", roles: "both", gender: "male" }
				expect(flash[:error]).to eq "Please check the form for errors."
			end
			it "redirects to new" do
				update = double(:update, successful?: false, error_message: "lol")
				UpdateUser.any_instance.should_receive(:update_user).and_return(update)
				post :update, id: current_user.id, user: { first_name: "name1", middle_name: "name2", last_name: "name3", email:"changedemail@example.com", password: "not_working", password_confirmation: "badPass", roles: "both", gender: "male" }
				expect(response).to render_template :new
			end
		end
	end
end