/class name			:class_name			:class
css selector		:css
id					:id
link text			:link_text			:link
name				:name
partial link text	:partial_link_text
tag name			:tag_name
xpath				:xpath/

require 'selenium-webdriver'
require 'test/unit'

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

	def click_go_then_click_add
		@driver.find_element(css: 'input[value=Go]').click
		@driver.find_element(css: 'a[href="/clinical/clients/create"]').click
	end

	def navigate_to_clients_page
		@driver.find_element(link_text: 'Clients').click
	end

	def fill_in_personal_information
		puts 'Filling in personal information'

		@driver.find_element(id: "PersonalInfo_NameFirst").send_keys CLIENT_FIRST_NAME #First name
		@driver.find_element(id: "PersonalInfo_NameMiddle").send_keys "W" #Middle name
		@driver.find_element(id: "PersonalInfo_NameLast").send_keys CLIENT_LAST_NAME #Last name
		@driver.find_element(id: "PersonalInfo_NameSuffix").send_keys "Auto" #Suffix
		@driver.find_element(id: "PersonalInfo_PreviousName").send_keys "Automationpreviousname Lastname"
		@driver.find_element(id: "PersonalInfo_NamePreferred").send_keys "Automationpreferredname Lastname"
		@driver.find_element(id: "PersonalInfo_SSN").click
		@driver.find_element(id: "PersonalInfo_SSN").click

		@driver.find_element(id: "PersonalInfo_SSN").send_keys "111111111"
		@driver.find_element(id: "PersonalInfo_Birthdate").click

		@driver.find_element(id: "PersonalInfo_Birthdate").send_keys "03/30/1990"
		@driver.find_element(id: "PersonalInfo_EclipseId").send_keys "1"

		gender_drop_down = @driver.find_element(id: "PersonalInfo_Gender").find_element(xpath: "..").find_element(css: "input")
		gender_drop_down.click
		gender_drop_down.send_keys 'Female'
		gender_drop_down.send_keys :return

		race_drop_down_1 = @driver.find_element(id: "PersonalInfo_Race_1_SelectedValue").find_element(xpath: "..").find_element(css: "input")
		race_drop_down_1.click
		race_drop_down_1.send_keys 'Automation Race1'
		race_drop_down_1.send_keys :return

		race_drop_down_2 = @driver.find_element(id: "PersonalInfo_Race_2_SelectedValue").find_element(xpath: "..").find_element(css: "input")
		race_drop_down_2.click
		race_drop_down_2.send_keys 'Automation Race1'
		race_drop_down_2.send_keys :return

		ethnic_origin_drop_down = @driver.find_element(id: "PersonalInfo_EthnicOrigin_SelectedValue").find_element(xpath: "..").find_element(css: "input")
		ethnic_origin_drop_down.click
		ethnic_origin_drop_down.send_keys 'Automation Ethnic Origin1'
		ethnic_origin_drop_down.send_keys :return

		county_of_origin_drop_down = @driver.find_element(id: "PersonalInfo_CountyOfOrigin_SelectedValue").find_element(xpath: "..").find_element(css: "input")
		county_of_origin_drop_down.click
		county_of_origin_drop_down.send_keys 'Alamance'
		county_of_origin_drop_down.send_keys :return

		primary_language_drop_down = @driver.find_element(id: "PersonalInfo_PrimaryLanguage_SelectedValue").find_element(xpath: "..").find_element(css: "input")
		primary_language_drop_down.click
		primary_language_drop_down.send_keys 'Automation Language1'
		primary_language_drop_down.send_keys :return

		secondary_language_drop_down = @driver.find_element(id: "PersonalInfo_SecondaryLanguage_SelectedValue").find_element(xpath: "..").find_element(css: "input")
		secondary_language_drop_down.click
		secondary_language_drop_down.send_keys 'Automation Language1'
		secondary_language_drop_down.send_keys :return

		tertiary_language_drop_down = @driver.find_element(id: "PersonalInfo_ThirdLanguage_SelectedValue").find_element(xpath: "..").find_element(css: "input")
		tertiary_language_drop_down.click
		tertiary_language_drop_down.send_keys 'Automation Language1'
		tertiary_language_drop_down.send_keys :return

		@driver.find_element(id: "PersonalInfo_EthnicInfoNotes").send_keys 'This client info was added by automaton.'
	end

	def fill_in_contact_information
		puts 'Filling in contact information'

		# TODO: There is currently a bug in firefox that prevents you from editing the county when this is switched on and off.
		# uncomment these lines once the bug is resolved.
		# is_homeless_toggle = @driver.find_element(id: "simpleCheckbox-ContactInfo_Address_IsHomeless").find_element(xpath: "..").find_element(css: "span")
		# is_homeless_toggle.click #Is Homeless switch
		# is_homeless_toggle.click #Sets "Is Homeless" back to NO

		#Address block
		@driver.find_element(id: "ContactInfo_Address_Street1").send_keys "306 Tidal Rice Court" #Enters address line 1
		@driver.find_element(id: "ContactInfo_Address_Street2").send_keys "1234 West Main Ave" #Enters address line 2
		@driver.find_element(id: "ContactInfo_Address_City").send_keys "Charleston" #Enters city
		@driver.find_element(id: "ContactInfo_Address_State").send_keys "SC" #Enters state
		@driver.find_element(id: "ContactInfo_Address_ZipCode").click #Zipcode focus
		@driver.find_element(id: "ContactInfo_Address_ZipCode").send_keys "123451234" #Enters 9-digit zip code

		county_of_residence_dropdown = @driver.find_element(id: "ContactInfo_AddressCounty_SelectedValue").find_element(xpath: "..").find_element(css: "input")
		county_of_residence_dropdown.click #Select County of residence drop down
		county_of_residence_dropdown.send_keys "alamance" #Enters a selection
		county_of_residence_dropdown.send_keys :return #Selects the selection

		@driver.find_element(id: "ContactInfo_CellPhone").click #Cell number focus
		@driver.find_element(id: "ContactInfo_CellPhone").send_keys "9997778888" #Enters Cell number
		@driver.find_element(id: "ContactInfo_HomePhone").click #Home number focus
		@driver.find_element(id: "ContactInfo_HomePhone").send_keys "1112223333" #Enters Home number
		@driver.find_element(id: "ContactInfo_WorkPhone").click #Work number focus
		@driver.find_element(id: "ContactInfo_WorkPhone").send_keys "4445556677" #Enters Work number
		@driver.find_element(id: "ContactInfo_EmailAddress").send_keys "automated1@email.com" #Email address

		preferred_communication_dropdown = @driver.find_element(id: "ContactInfo_PreferredCommunication").find_element(xpath: "..").find_element(css: "input")
		preferred_communication_dropdown.click #Select Preferred Communication drop down
		preferred_communication_dropdown.send_keys "Cell" #Enters a selection
		preferred_communication_dropdown.send_keys :return #Selects the selection

		# These are only accessible when "is homeless" is true
		#@driver.find_element(id: "ContactInfo_PrimaryShelter").send_keys "Home" #Primary shelter
		#@driver.find_element(id: "ContactInfo_SecondaryShelter").send_keys "Gun range" #Secondary shelter

		@driver.find_element(id: "ContactInfo_ContactInfoComments").send_keys "This contact info was added by automation."
	end

	def fill_in_emergency_contact_information
		puts 'Filling in emergency contact information'

		@driver.find_element(id: "EmergencyContact_NameFirst").send_keys "Autoemergencyname1" #First name
		@driver.find_element(id: "EmergencyContact_NameMiddle").send_keys "Autoemergencymiddlename1" #Middle name
		@driver.find_element(id: "EmergencyContact_NameLast").send_keys "Autoemergencylastname1" #Last name
		@driver.find_element(id: "EmergencyContact_NameSuffix").send_keys "Auto" #Suffix

		relationship_dropdown = @driver.find_element(id: "EmergencyContact_Relationship_SelectedValue").find_element(xpath: "..").find_element(css: "input")
		relationship_dropdown.click #Relationship drop down
		relationship_dropdown.send_keys "Automation Relationship1" #enters a selection
		relationship_dropdown.send_keys :return #selects the selection

		@driver.find_element(id: "EmergencyContact_EmailAddress").send_keys "automatedemergency@email.com" #Email address for emergency contact
		@driver.find_element(id: "EmergencyContact_HomePhone").click #Home number focus
		@driver.find_element(id: "EmergencyContact_HomePhone").send_keys "1111111111" #Enters Emergency Contact Home number
		@driver.find_element(id: "EmergencyContact_CellPhone").click #Work number focus
		@driver.find_element(id: "EmergencyContact_CellPhone").send_keys "2222222222" #Enters Emergency Contact Cell number
	end

	def save_client_and_validate_address
		@driver.find_element(css: 'button[type="submit"].btn.btn-primary').click
		@driver.find_element(name: "confirm-address").click
	end

	def assert_successful_client_creation
		client_name = "#{CLIENT_FIRST_NAME} #{CLIENT_LAST_NAME}"
		navigate_to_clients_page
		@driver.find_element(name: "search").click
		@driver.find_element(name: "search").send_keys client_name
		@driver.find_element(css: 'input[value=Go]').click
		assert(@driver.find_element(link_text: client_name), "The Client name was not found in search.")
	end

	def logout
		puts 'Logging out'
		@driver.find_element(css: 'a.dropdown-toggle i.caret').click
		@driver.find_element(css: 'a[href="/account/signout"]').click
	end

	run do
		# 1. Login
		login USERNAME, PASSWORD

		# 2. Navigate to Clients Page
		navigate_to_clients_page

		# 3. Add a client.
		click_go_then_click_add
		fill_in_personal_information
		fill_in_contact_information
		fill_in_emergency_contact_information
		save_client_and_validate_address

		assert_successful_client_creation

		# 4. Logout
		logout
	end
