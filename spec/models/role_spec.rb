require 'spec_helper'

describe Role do
  context 'custom validation' do
    context 'when name is student' do
      it { expect(build(:role, name: 'student')).to be_valid }
    end
    
    context 'when name is professor' do
      it { expect(build(:role, name: 'professor')).to be_valid }
    end
    
    context 'when name is head' do
      it { expect(build(:role, name: 'head')).to be_valid }
    end
    
    context 'when name is invalid' do
      it { expect(build(:role, name: 'invalid')).to_not be_valid }

      it 'has error message' do
        role = build(:role, name: 'invalid')
        role.valid?

        expect(role.errors.messages).to_not be_empty
        expect(role.errors.messages[:name]).to be_eql ['Only student, professor or head is available']
      end
    end
  end
end
