class UserPage

FLASH_BANNER = {id: "flash_success"}

attr_reader :driver

def initialize(driver)
	@driver = driver
end

def get_banner()
	banner = @driver.find_element(FLASH_BANNER)
	b_text = banner.text
end

end