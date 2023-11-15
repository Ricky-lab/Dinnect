# In spec/models/application_record_spec.rb
require 'rails_helper'

RSpec.describe ApplicationRecord, type: :model do
  it 'is an abstract class' do
    expect(ApplicationRecord.abstract_class).to be true
  end

  # Additional tests for any custom logic in ApplicationRecord can be added here
end
