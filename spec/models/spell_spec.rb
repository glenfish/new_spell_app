require 'rails_helper'

RSpec.describe Spell, type: :model do
  context "validation test" do
    before(:all) do
      @spell = create(:spell)
    end

    it "is valid when given all attributes" do
      expect(@spell).to be_valid
    end

    it "is not valid without a name" do
      new_spell = build(:spell, name: nil)
      expect(new_spell).to_not be_valid
    end

    it "is not valid without a category" do
      new_spell = build(:spell, category: nil)
      expect(new_spell).to_not be_valid
    end

    it "is not valid without a description" do
      new_spell = build(:spell, description: nil)
      expect(new_spell).to_not be_valid
    end

  end
end
