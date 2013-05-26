require 'spec_helper'
require 'omniauth_helper'

describe User do

  describe '#mass assignment' do
    it { should_not allow_mass_assignment_of :provider }
    it { should_not allow_mass_assignment_of :uid }
    it { should_not allow_mass_assignment_of :user_name }
    it { should_not allow_mass_assignment_of :secret }
    it { should_not allow_mass_assignment_of :token }
  end

  describe '#validations' do
    it { should validate_presence_of :provider }
    it { should validate_presence_of :uid }
    it { should validate_presence_of :username }
    it { should validate_presence_of :token }
    it { should validate_presence_of :secret }
  end

  context '#static methods' do

    describe '#from_omni_auth' do
      it 'creates new user' do
        @auth = OmniAuth.config.mock_auth[:twitter]
        expect {
          User.from_omniauth(@auth)
        }.to change{User.count}.by(1)
      end
    end
  end

  describe '#model methods' do
    describe '#update_last_search_time' do
      it 'updates last search term' do
        user = FactoryGirl.create :user
        user.update_last_search_term 'wat'

        user.reload.last_search_term.should eq 'wat'
      end
    end
  end

end
