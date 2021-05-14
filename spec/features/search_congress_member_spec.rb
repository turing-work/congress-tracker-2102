require 'rails_helper'

RSpec.describe 'Govt Search' do
  describe 'happy path' do
    it 'allows user to search for govt members' do
      visit root_path

      fill_in :search, with: 'Sanders'
      click_button 'Search'

      expect(page.status_code).to eq 200
      expect(page).to have_content("Senator Bernard Sanders was found!")
      expect(page).to have_content("SenSanders")
    end
  end
end
