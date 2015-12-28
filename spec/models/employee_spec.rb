require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe ".validates" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:position) }
    it { is_expected.to validate_presence_of(:company_id) }
  end
end
