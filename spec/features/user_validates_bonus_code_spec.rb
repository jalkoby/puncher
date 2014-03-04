require 'spec_helper'

feature 'User validates a bonus code' do
  let!(:product)   { create :product, :name => "SmartWatch" }
  let(:bonus_code) { SecureRandom.hex }

  scenario 'bonus is not found', :js do
    fill_form

    expect(page).to have_content("Bonus is not found")
  end

  scenario 'bonus is invalid', :js do
    create :bonus, :product => product, :code => bonus_code

    fill_form

    expect(page).to have_content("Bonus is not sold")
  end

  scenario 'bonus is valid', :js do
    create :bonus, :sold, :product => product, :code => bonus_code

    fill_form

    expect(page).to have_content("Bonus is valid")
  end

  def fill_form
    visit root_path

    select product.name, :from => "product_id"
    fill_in "bonus_code", :with => bonus_code
    click_on 'Validate'
  end
end
