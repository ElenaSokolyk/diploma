require 'spec_helper'

describe University do
  it { should have_many(:faculties) }
  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:name).is_at_most(100) }
end
