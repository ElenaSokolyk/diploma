require 'spec_helper'

describe Comment do
  it { should belong_to(:user) }
  it { should have_many(:subcomments).dependent(:destroy) }
  it { should validate_presence_of(:text) }
end
