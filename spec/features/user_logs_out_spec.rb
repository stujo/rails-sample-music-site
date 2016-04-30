feature 'User logs out' do

  scenario 'they are redirected to the welcome page' do
    visit signup_path

    fill_in 'user[name]', with: 'Mary'
    fill_in 'user[password]', with: 'MaryMaryPass'
    fill_in 'user[password_confirmation]', with: 'MaryMaryPass'

    click_button 'Register'

    click_link 'Log Out'

    expect(current_path).to eq "/"
    expect(page.body).to include "Sign Up"
  end
end