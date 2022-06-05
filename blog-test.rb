require "selenium-webdriver"
require "rspec"
require_relative "signup.rb"
require_relative "userpage.rb"

timestamp = Time.now.to_i
user = "ramse#{timestamp}"
mail = "ramse#{timestamp}@test.com"
pass = "1234"

# TEST: Sign up for blog
describe "Blog application" do 
	describe "singup to the blog application" do
		it "confirm that a user successfully singup" do
			@driver = Selenium::WebDriver.for :firefox
			@driver.navigate.to "https://selenium-blog.herokuapp.com/signup"

			signup = SignupPage.new(@driver)
			signup.enter_username(user)

			signup.enter_mail(mail)

			signup.enter_password(pass)
			
			signup.submit_form()
			users = UserPage.new(@driver)
			
			expect(users.get_banner()).to eq("Welcome to the alpha blog #{user}")

			@driver.quit
		end
	end
end
