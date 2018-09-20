require 'rails_helper'

RSpec.describe Soundscape, type: :model do
  let!(:soundscape) { create(:soundscape) }
  it "creates a soundscape" do
    expect(soundscape).to be_present
  end
end
