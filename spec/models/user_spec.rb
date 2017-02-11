require 'rails_helper'

RSpec.describe User, type: :model do
  context '#join_date' do
    it 'returns correctly formatted date' do
      user = create_user
      user.created_at = "2017-02-11 22:10:31"
      user.save
      expect(user.join_date).to eq('02-11-2017')
    end
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end
end
