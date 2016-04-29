feature 'User logs in' do
  scenario 'they are redirected to the welcome page' do

    existing_user = User.create(name: "Mary", password: "password1", password_confirmation: "password1")

    visit login_path

    fill_in 'session[name]', with: existing_user.name
    fill_in 'session[password]', with: existing_user.password

    click_button 'Login'

    expect(page.body).to match Regexp.new(existing_user.name)
    expect(current_path).to eq "/"

    # Check is persistent
    visit root_path
    expect(page.body).to match Regexp.new(existing_user.name)
  end
end