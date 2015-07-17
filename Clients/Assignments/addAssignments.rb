/class name			:class_name			:class
css selector		:css
id					:id
link text			:link_text			:link
name				:name
partial link text	:partial_link_text
tag name			:tag_name
xpath				:xpath/

require "selenium-webdriver"
require 'colorize'

	USERNAME = ENV["USERNAME"]
	PASSWORD = ENV["PASSWORD"]
	ENVIRONMENT_UNDER_TEST = ENV["ENVIRONMENT_UNDER_TEST"]
	CLIENT_FIRST_NAME = ENV["CLIENT_FIRST_NAME"]
	CLIENT_LAST_NAME = ENV["CLIENT_LAST_NAME"]

	def setup
		@driver = Selenium::WebDriver.for :firefox
		@driver.navigate.to ENVIRONMENT_UNDER_TEST
		@driver.manage.timeouts.implicit_wait = 10
		@wait = Selenium::WebDriver::Wait.new(timeout: 6)
	end

	def teardown
		puts "Add Assignment to Client Test Completed.".green
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
		puts "Navigating to a Client: #{name}"
		@driver.find_element(id: 'Search').send_keys name
		@driver.find_element(css: 'input[value=Go]').click
		@driver.find_element(link_text:  name).click
	end

	def navigate_to_assignments_page
		puts 'Navigating to Assignments\' Page'
		@driver.find_element(link_text: "Assignments").click
	end

	def click_add_assignment
		puts 'Clicking on "Add Assignment"'
		@driver.find_element(css: "a[href*=\"assignments/create\"]").click
	end

	def fill_in_associated_referral
		puts 'Filling in Associated Referral'
		associated_referral_dropdown = @driver.find_element(id: "AssignmentInfo_Referral_SelectedValue").find_element(xpath: "..").find_element(css: "input")
		associated_referral_dropdown.click #Associated Referral drop down
		associated_referral_dropdown.send_keys "Referralautomation" #enters a selection
		associated_referral_dropdown.send_keys :return #selects the selection
	end

	def fill_in_location
		puts 'Filling in Location'
		location_dropdown = @driver.find_element(id: "AssignmentInfo_Location_SelectedValue").find_element(xpath: "..").find_element(css: "input")
		location_dropdown.click #Location drop down
		location_dropdown.send_keys "AddedByAutomationLocation1" #enters a selection
		location_dropdown.send_keys :return #selects the selection
	end

	def fill_in_program
		puts 'Filling in Program'
		program_dropdown = @driver.find_element(id: "AssignmentInfo_Program_SelectedValue").find_element(xpath: "..").find_element(css: "input")
		program_dropdown.click #Location drop down
		program_dropdown.send_keys "AddedByAutomationProgram1" #enters a selection
		program_dropdown.send_keys :return #selects the selection
	end

	def fill_in_admit_time
		puts 'Filling in Admit Time'
		@driver.find_element(id: "AssignmentInfo_AdmitTime").click
		@driver.find_element(id: "AssignmentInfo_AdmitTime").send_keys "12:00pm"
	end

	def fill_in_admit_date
		puts 'Filling in Admit Date'
		@driver.find_element(id: "AssignmentInfo_AdmitDate").click
		@driver.find_element(id: "AssignmentInfo_AdmitDate").send_keys "01/10/2015"
	end

	def fill_in_staff_type
		puts 'Filling in Staff Type'
		staff_type_dropdown = @driver.find_element(id: "StaffInfo_StaffType").find_element(xpath: "..").find_element(css: "input")
		staff_type_dropdown.click #Location drop down
		staff_type_dropdown.send_keys "Admin" #enters a selection
		staff_type_dropdown.send_keys :return #selects the selection
	end

	def fill_in_staff_member
		puts 'Filling in Staff Member'
		staff_member_dropdown = @driver.find_element(id: "StaffInfo_StaffMember_SelectedValue").find_element(xpath: "..").find_element(css: "input")
		@wait.until {staff_member_dropdown.displayed?}
		staff_member_dropdown.click #Location drop down
		staff_member_dropdown.send_keys "Admin" #enters a selection
		staff_member_dropdown.send_keys :return #selects the selection
	end

	def fill_in_staff_assignment_date
		puts 'Filling in Staff Assignment Date'
		@driver.find_element(id: "StaffInfo_StaffAssignmentDate").click
		@driver.find_element(id: "StaffInfo_StaffAssignmentDate").send_keys DateTime.now.strftime('%m/%d/%Y')
		# @driver.find_element(id: "StaffInfo_StaffAssignmentDate").send_keys "01/10/2015"
	end

	def save_assignment
		puts 'Clicking "Save"'
		@driver.find_element(css: 'button[type="submit"].btn.btn-primary').click
		"Assignment not saved." unless @driver.find_element(xpath: "//h1[contains(., \"Assignments List\")]").displayed?
	end

	run do
		# 1. Login
		login USERNAME, PASSWORD

		# 2. Navigate to Assignments' Page
		navigate_to_clients_page
		navigate_to_a_client "#{CLIENT_FIRST_NAME} #{CLIENT_LAST_NAME}"
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
