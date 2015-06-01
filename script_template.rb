/class name			:class_name			:class
css selector		:css
id					:id
link text			:link_text			:link
name				:name
partial link text	:partial_link_text
tag name			:tag_name
xpath				:xpath/

require 'selenium-webdriver'

	USERNAME = 'rhadevadmin@rhadev.onmicrosoft.com'
	PASSWORD = 'RHAdev9891'
	ENVIRONMENT_UNDER_TEST = 'https://rha.azurewebsites.net/'

	CLIENT_FIRST_NAME = "Angela"
	CLIENT_LAST_NAME = "Renard"

	def setup
		@driver = Selenium::WebDriver.for :firefox
		@driver.navigate.to ENVIRONMENT_UNDER_TEST
		@driver.manage.timeouts.implicit_wait = 10
	end

	def teardown
		puts "Test Completed."
		@driver.quit
	end

	def run
		setup
		yield
		teardown
	end

	def login(username,password)
		puts 'Logging in'

		@driver.find_element(id: 'cred_userid_inputtext').send_keys username # 'rhadevadmin@rhadev.onmicrosoft.com'
		@driver.find_element(id: 'cred_password_inputtext').send_keys password # 'RHAdev9891'
		@driver.find_element(id: 'cred_sign_in_button').click
		sleep(1)
		@driver.find_element(id: 'cred_sign_in_button').click
	end

	def logout
		puts 'Logging out'
		@driver.find_element(css: 'a.dropdown-toggle i.caret').click
		@driver.find_element(css: 'a[href="/account/signout"]').click
	end

	run do
		# 1. Login
		login USERNAME, PASSWORD

        # 2. Do some things with descriptive function names

        # 3. ???

		# 4. Profit
		logout
	end
