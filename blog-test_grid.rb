require "selenium-webdriver"
require "rspec"

# TEST: Sign up for blog
describe "Blog application" do 
	describe "singup to the blog application" do
		it "confirm that a user successfully singup" do
			driver = Selenium::WebDriver.for :remote, desired_capabilities: :firefox
			driver.navigate.to "https://selenium-blog.herokuapp.com/signup"
			username = driver.find_element(id: "user_username")
			username.send_keys("ramse3")
			email = driver.find_element(id: "user_email")
			email.send_keys("ramse89@test.com")
			password = driver.find_element(id: "user_password")
			password.send_keys("1234")
			signup = driver.find_element(id: "submit")

			signup.click

			banner = driver.find_element(id: "flash_success")
			b_text = banner.text
			expect(b_text).to eq("Welcome to the alpha blog ramse3")

			driver.quit
		end
	end
end