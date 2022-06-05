class SignupPage

USERNAME_FIELD = {id: "user_username"}
PASSWORD_FIELD = {id: "user_password"}
EMAIL_FIELD = {id: "user_email"}
SUBMIT_BUTTON = {id: "submit"}

attr_reader :driver

def initialize(driver)
	@driver = driver
end

def enter_username(u_name)
	username = @driver.find_element(USERNAME_FIELD)
	username.send_keys(u_name)
end

def enter_mail(e_mail)
	email = @driver.find_element(EMAIL_FIELD)
	email.send_keys(e_mail)
end

def enter_password(password)
	password = @driver.find_element(PASSWORD_FIELD)
	password.send_keys(password)
end

def submit_form()
	signup = @driver.find_element(SUBMIT_BUTTON)
	signup.click
end

end