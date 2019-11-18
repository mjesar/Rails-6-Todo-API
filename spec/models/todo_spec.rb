require 'rails_helper'

RSpec.describe Todo, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_length_of(:title).is_at_least(3) }
  it { is_expected.to validate_length_of(:description).is_at_most(50).is_at_least(2) }
  it { is_expected.to validate_inclusion_of(:status).in_array([true, false]) }
end
