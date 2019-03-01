require 'rails_helper'
RSpec.describe UsersController, type: :controller do 
    describe "GET #new" do
        it "should render a new form" do
            get :new
            expect(response).to render_template(:new)
        end
    end

    describe "POST #create" do 
        let(:valid_user) {{ user: {username: "josh", password: "hunter" }}}
        let(:invalid_user) {{ user: {username: "", password: ""}}}
        context "valid user" do 
            before :each do 
                post :create, params: valid_user
            end
            it "should render show " do
                redirect_to user_url(User.last)
                expect(response).to redirect_to(user_url(User.last))
            end
            it "should create a new user" do
                expect(User.last.username).to eq("josh")
            end
        end
        context "invalid user" do 
            before :each do
                post :create, params: invalid_user
            end

            it "should render new" do 
                get :new
                expect(response).to render_template(:new)
            end
            it "gives error message" do
                expect(flash[:errors]).to be_present
            end
    
        end
    end
end

