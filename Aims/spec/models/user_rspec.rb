require 'rails_helper'
RSpec.describe User, type: :model do 
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_presence_of(:session_token)}

describe '::find_by_credentials' do
    let!(:user) { create(:user) }
    context 'user found' do 
        it "user found and valid password return true" do 
            # allow(subject).to receive(:is_password?) and_return(true)
            expect(User.find_by_credentials(user.username, "starwars")).to eq(user)
        end
        it "user found but invalid password" do 
             expect(User.find_by_credentials(user.username, "starwa")).to be(nil)
        end
    end
    context 'user not found' do 
        it "returns false" do 
        expect(User.find_by_credentials("oliver", "starwar")).to be(nil)
    end
    end
end

describe '#is_password?' do 
    let!(:user) { create(:user) }
    context "valid password" do 
        it "should return true" do
            expect(user.is_password?('starwars')).to be(true)
        end
    end
    context "invalid password" do
        it "should return false" do
            expect(user.is_password?('star')).to be(false)
        end
    end
end

describe "#reset_session_token" do
    let!(:user) {create(:user)}
 
    it "resets session token" do
        expect(user.session_token).not_to eq(user.reset_session_token!)
    end
end

describe "#ensure_session_token" do
    let!(:user) {create(:user)}
    it "assigns session token" do
        expect(user.session_token.empty?).to be(false)
    end
end
    

end
