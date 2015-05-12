/class name			:class_name			:class
css selector		:css	 
id					:id	 
link text			:link_text			:link
name				:name	 
partial link text	:partial_link_text	 
tag name			:tag_name	 
xpath				:xpath/

require "selenium-webdriver"

	USERNAME = 'rhadevadmin@rhadev.onmicrosoft.com'
	PASSWORD = 'RHAdev9891'
	ENVIRONMENT_UNDER_TEST = 'https://rha.azurewebsites.net/'
	
	def setup
		@driver = Selenium::WebDriver.for :firefox
		@driver.navigate.to ENVIRONMENT_UNDER_TEST
		@driver.manage.timeouts.implicit_wait = 10
		@wait = Selenium::WebDriver::Wait.new(timeout: 6)
	end

	def teardown
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
	
	def navigate_to_clients_page
		puts 'Navigating to Clients\' page'
		@driver.find_element(link_text: 'Clients').click
	end
	
	def navigate_to_a_client(name)
		puts 'Navigating to a Client: #{name}'
		@driver.find_element(id: 'search').send_keys 'Automation'
		@driver.find_element(css: 'input[value=Go]').click
		@driver.find_element(link_text:  '#{name}').click
	end
	
	def navigate_to_assignments_page
		puts 'Navigating to Assignments\' Page'
		@driver.find_element(link_text: "Assignments").click
	end
	
	def click_add_assignment
		puts 'Clicking on "Add Assignment"'
		@driver.find_element(xpath: "/html/body/div[1]/div[2]/div/div[3]/div/div[3]/a").click
	end
	
	def fill_in_associated_referral
		puts 'Filling in Associated Referral'
		@driver.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div[1]/section[1]/div[1]/div[1]/div/div/div[1]/input").click #Associated Referral drop down
		@driver.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div[1]/section[1]/div[1]/div[1]/div/div/div[1]/input").send_keys "Referralautomation" #enters a selection
		@driver.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div[1]/section[1]/div[1]/div[1]/div/div/div[1]/input").send_keys :return #selects the selection
	end
	
	def fill_in_location
		puts 'Filling in Location'
		@driver.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div[1]/section[1]/div[1]/div[2]/div/div/div[1]/input").click #Location drop down
		@driver.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div[1]/section[1]/div[1]/div[2]/div/div/div[1]/input").send_keys "AddedByAutomationLocation1" #enters a selection
		@driver.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div[1]/section[1]/div[1]/div[2]/div/div/div[1]/input").send_keys :return #selects the selection
	end
	
	def fill_in_program
		puts 'Filling in Program'
		@driver.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div[1]/section[1]/div[2]/div[1]/div/div/div[1]/input").click #Location drop down
		@driver.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div[1]/section[1]/div[2]/div[1]/div/div/div[1]/input").send_keys "AddedByAutomationProgram1" #enters a selection
		@driver.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div[1]/section[1]/div[2]/div[1]/div/div/div[1]/input").send_keys :return #selects the selection
	end
	
	def fill_in_admit_time
		puts 'Filling in Admit Time'
		@driver.find_element(id: "AdmitTime").click
		@driver.find_element(id: "AdmitTime").send_keys "12:00pm"
	end
	
	def fill_in_admit_date
		puts 'Filling in Admit Date'
		@driver.find_element(id: "AdmitDate").click
		@driver.find_element(id: "AdmitDate").send_keys "01/10/2015"
	end
	
	def fill_in_staff_type
		puts 'Filling in Staff Type'
		@driver.find_element(xpath: "//*[@id='staff-members']/div/div[1]/div/div/div[1]/input").click #Location drop down
		@driver.find_element(xpath: "//*[@id='staff-members']/div/div[1]/div/div/div[1]/input").send_keys "Admin" #enters a selection
		@driver.find_element(xpath: "//*[@id='staff-members']/div/div[1]/div/div/div[1]/input").send_keys :return #selects the selection
	end
	
	def fill_in_staff_member
		puts 'Filling in Staff Member'
		wait.until {@driver.find_element(xpath: "//*[@id='staff-members']/div/div[2]/div/div/div[1]/input").displayed?}
		@driver.find_element(xpath: "//*[@id='staff-members']/div/div[2]/div/div/div[1]/input").click #Location drop down
		@driver.find_element(xpath: "//*[@id='staff-members']/div/div[2]/div/div/div[1]/input").send_keys "Admin" #enters a selection
		@driver.find_element(xpath: "//*[@id='staff-members']/div/div[2]/div/div/div[1]/input").send_keys :return #selects the selection
	end
	
	def fill_in_staff_assignment_date
		puts 'Filling in Staff Assignment Date'
		@driver.find_element(id: "StaffAssignmentDate").click
		@driver.find_element(id: "StaffAssignmentDate").send_keys "01/10/2015"
		@driver.find_element(id: "StaffAssignmentDate").send_keys "01/10/2015"
	end
	
	def save_assignment
		puts 'Clicking "Save"'
		@driver.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div[2]/ul/li[2]/button").click
	end
	
	run do
		# 1. Login
		login USERNAME, PASSWORD
		
		# 2. Navigate to Assignments' Page
		navigate_to_clients_page
		navigate_to_a_client 'Automationfirstname1 Automationlastname1'
		navigate_to_assignments_page
		
		# 3. Add an Assignment
		click_add_assignment
		fill_in_associated_referral
		fill_in_location
		fill_in_program
		fill_in_admit_time
		fill_in_admit_date
		fill_in_staff_type
		fill_in_staff_member
		fill_in_staff_assignment_date
		save_assignment
		
		# 4. Logout
		logout
	end