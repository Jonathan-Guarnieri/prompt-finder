require 'rails_helper'

RSpec.describe Prompt, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:content) }
  end

  describe 'searchkick' do
    it 'should have searchkick' do
      expect(Prompt).to respond_to(:searchkick_options)
    end
  end

  describe 'search functionality' do
    let!(:prompt_1) { create(:prompt, content: "Example prompt") }
    let!(:prompt_2) { create(:prompt, content: "Another example") }

    before { Prompt.searchkick_index.refresh }

    it 'should find records by searching' do
      results = Prompt.search("example")
      expect(results).to include(prompt_1, prompt_2)
    end

    it 'should not return unrelated records' do
      results = Prompt.search("unrelated")
      expect(results).not_to include(prompt_1, prompt_2)
    end
  end
end
