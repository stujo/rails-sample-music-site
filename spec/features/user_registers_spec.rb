feature 'User registers' do
  scenario 'they see the foobar on the page' do
    visit signup_path

    fill_in 'user[name]', with: 'Mary'
    fill_in 'user[password]', with: 'MaryMaryPass'
    fill_in 'user[password_confirmation]', with: 'MaryMaryPass'

    click_button 'Register'

    expect(page.body).to match /Welcome/
  end
end