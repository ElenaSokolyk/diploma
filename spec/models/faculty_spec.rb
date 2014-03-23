require 'spec_helper'

describe Faculty do
  it { should validate_presence_of(:name) }
  it { should belong_to(:university) }
end
