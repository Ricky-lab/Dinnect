require 'rails_helper'

# ApplicationHelper module test
RSpec.describe ApplicationHelper, type: :helper do
  describe '#current_user' do
    context 'when user is logged in' do
      it 'returns the current user' do
        user = User.create(username: 'testuser', email: 'test@example.com', password: 'password')
        allow(helper).to receive(:current_user).and_return(user)
        expect(helper.current_user).to eq(user)
      end
    end

    context 'when user is not logged in' do
      it 'returns nil' do
        allow(helper).to receive(:current_user).and_return(nil)
        expect(helper.current_user).to be_nil
      end
    end
  end

  describe '#logged_in?' do
    context 'when user is logged in' do
      it 'returns true' do
        allow(helper).to receive(:logged_in?).and_return(true)
        expect(helper.logged_in?).to be true
      end
    end

    context 'when user is not logged in' do
      it 'returns false' do
        allow(helper).to receive(:logged_in?).and_return(false)
        expect(helper.logged_in?).to be false
      end
    end
  end
end
