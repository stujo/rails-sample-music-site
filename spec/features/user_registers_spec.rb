feature 'User registers' do

  let(:page_check){ 
  	/mary/ 
  }

  scenario 'they are redirected to the welcome page' do
    visit signup_path

    fill_in 'user[name]', with: 'Mary'
    fill_in 'user[password]', with: 'MaryMaryPass'
    fill_in 'user[password_confirmation]', with: 'MaryMaryPass'

    click_button 'Register'

    expect(page.body).to match page_check
    expect(current_path).to eq "/"

    # Check is persistent
    visit root_path
    expect(page.body).to match page_check
  end
end