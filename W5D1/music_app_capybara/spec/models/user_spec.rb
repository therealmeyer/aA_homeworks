require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(email: 'r@r.com', password: 'password') }
  describe 'validations' do

    it { should validate_presence_of(:email) }
    # it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end
    it 'creates a password digest when password given' do
      expect(user.password_digest).to_not be_nil
    end

    it 'creates a session token before validation' do
      user.valid?
      expect(user.session_token).to_not be_nil
    end

    describe "::find_by_credentials" do
      before { user.save }

      it "returns user given valid credentials" do
        expect(User.find_by_credentials("r@r.com", "password")).to eq(user)
      end

      it "returns nil if given invalid credentials" do
        expect(User.find_by_credentials("r@r.com", "wrong_pwd")).to eq(nil)
      end
    end

    describe "#password=" do
      before {  }
      it "sets the password given a password" do
        user.password=("new_password")
        expect(user.password).to eq("new_password")
      end

      it "creates a new session token for the password" do
        old_digest = user.password_digest
        user.password=("new_password")
        expect(user.password_digest).to_not eq(old_digest)
      end
    end

    describe "#is_password?" do
      it "returns true if the password given matches the user password" do
        expect(user.is_password?("password")).to eq(true)
      end

      it "returns false if the password given doesn't match the user's" do
        expect(user.is_password?("wrong_password")).to eq(false)
      end
    end

    describe "#reset_session_token!" do
    it "sets a new session token on the user" do
      user.valid?
      old_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(old_token)
    end

    it "returns the new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end


end
