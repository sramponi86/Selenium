require "selenium-webdriver"
require "rspec"
timestamp = Time.now.to_i
user = "ramse#{timestamp}"
mail = "ramse#{timestamp}@test.com"
pass = "1234"

def enter_username(u_name)
	username = @driver.find_element(id: "user_username")
	username.send_keys(u_name)
end

def enter_mail(e_mail)
	email = @driver.find_element(id: "user_email")
	email.send_keys(e_mail)
end

def enter_password(password)
	password = @driver.find_element(id: "user_password")
	password.send_keys(password)
end
# TEST: Sign up for blog
describe "Blog application" do 
	describe "singup to the blog application" do
		it "confirm that a user successfully singup" do
			@driver = Selenium::WebDriver.for :firefox
			@driver.navigate.to "https://selenium-blog.herokuapp.com/signup"
			enter_username(user)

			enter_mail(mail)

			enter_password(pass)
			
			signup = @driver.find_element(id: "submit")

			signup.click

			banner = @driver.find_element(id: "flash_success")
			b_text = banner.text
			expect(b_text).to eq("Welcome to the alpha blog #{user}")

			@driver.quit
		end
	end
end
