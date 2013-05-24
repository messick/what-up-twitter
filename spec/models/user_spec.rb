require 'spec_helper'

describe User do

  describe '#mass-assignment' do
    it { should allow_mass_assignment_of :email }
    it { should allow_mass_assignment_of :password }
    it { should_not allow_mass_assignment_of :provider }
    it { should_not allow_mass_assignment_of :uid }
    it { should_not allow_mass_assignment_of :user_name }
    it { should_not allow_mass_assignment_of :secret }
    it { should_not allow_mass_assignment_of :token }
  end
end
