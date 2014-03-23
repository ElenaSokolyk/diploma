require 'spec_helper'

describe Department do
  it { should belong_to(:faculty) }
  it { should validate_numericality_of(:faculty_id).is_greater_than(0) }
end
