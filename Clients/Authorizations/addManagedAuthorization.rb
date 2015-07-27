/class name			:class_name			:class
css selector		:css
id					:id
link text			:link_text			:link
name				:name
partial link text	:partial_link_text
tag name			:tag_name
xpath				:xpath/

require "selenium-webdriver"

	USERNAME = ENV["USERNAME"]
	PASSWORD = ENV["PASSWORD"]
	ENVIRONMENT_UNDER_TEST = ENV["ENVIRONMENT_UNDER_TEST"]

    INSURANCE_PAYER = "Automationpayer Lastname1"

	CLIENT_FIRST_NAME = ENV["CLIENT_FIRST_NAME"]
	CLIENT_LAST_NAME = ENV["CLIENT_LAST_NAME"]

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
		@driver.find_element(css: 'li.user.dropdown').click
		@driver.find_element(css: 'a[href="/account/signout"]').click
	end

    def navigate_to_clients_page
		puts 'Navigating to Clients page'
		@driver.find_element(link_text: 'Clients').click
	end

    def navigate_to_a_client(name)
		puts "Navigating to a Client: #{name}"
		@driver.find_element(id: 'Search').send_keys name
		@driver.find_element(css: 'input[value=Go]').click
		@driver.find_element(link_text:  name).click
	end

    def navigate_to_authorizations
        puts 'Navigating to Authorizations'
        @driver.find_element(link_text: "Authorizations").click
    end

    def click_add_authorization
        puts 'Clicking Add Authorization'
        @driver.find_element(css: "a[href*=\"authorizations/create\"]").click
    end

    def set_authorization_type(type)
        puts "Setting authorization type to #{type}"
        @driver.find_element(css: "input[value=\"#{type}\"]").click
    end

    def fill_in_insurance
		selector = xpath: "//*[@id='Authorization_Insurance_SelectedValue']/..//input"
		@driver.find_element(selector).click
		@driver.find_element(selector).send_keys INSURANCE_PAYER
		@dirver.find_element(selector).send_keys :return
    end

    def fill_in_request_date
        @driver.find_element(id: "ManagedAuthorizationInputs_DateRequested").click
        @driver.find_element(id: "ManagedAuthorizationInputs_DateRequested").send_keys "02/13/2015"
    end

    def fill_in_effective_to
        @driver.find_element(id: "Effective_To").click
        @driver.find_element(id: "Effective_To").send_keys "12/25/2015"
    end

    def fill_in_effective_from
        @driver.find_element(id: "Effective_From").click
        @driver.find_element(id: "Effective_From").send_keys "02/13/2015"
    end

    def fill_in_units_requested
        @driver.find_element(id: "ManagedAuthorizationInputs_UnitsRequested").click #Field focus units requested
        @driver.find_element(id: "ManagedAuthorizationInputs_UnitsRequested").click #Field focus units requested
        @driver.find_element(id: "ManagedAuthorizationInputs_UnitsRequested").send_keys "50" #enters units requested amount
    end

    def fill_in_service
		selector = xpath: "//*[@id='Authorization_UnbundledService_Service_SelectedValue']/..//input"
		@driver.find_element(selector).click
		@driver.find_element(selector).send_keys "HCPCS - AddedByAutomationService1"
		@driver.find_element(selector).send_keys :return
        sleep(1)
    end

    def fill_in_referring_npi_info
		selector = xpath: "//*[@id='Authorization_Referrer_Provider_SelectedValue']/..//input"
		@driver.find_element(selector).click
		@driver.find_element(selector).send_keys "Referralautomation"
		@driver.find_element(selector).send_keys :return
        sleep(1)
    end

    def save_authorization
		@driver.find_element(xpath: "//button[contains(., \"Save\")]").click
        sleep(1)
    end

	def access_the_added_authorization
		@driver.find_element(link_text: INSURANCE_PAYER).click
	end

    def enter_info_for_received_authorization
        #Enters info for received authorization
        @driver.find_element(id: "ReceiveAuthorization_Number").send_keys "00001"
        #Status
        insurance_dropdown = @driver.find_element(xpath: "//select[@id=\"ReceiveAuthorization_Status_SelectedValue\"]/..//input")
        insurance_dropdown.click
        insurance_dropdown.send_keys "Active"
        insurance_dropdown.send_keys :return
        #Units Authorized
        units_authorized_field = @driver.find_element(id: "ReceiveAuthorization_UnitsAuthorized")
        units_authorized_field.click
        units_authorized_field.send_keys "10000"
        #Date Recieved
        @driver.find_element(id: "ReceiveAuthorization_DateReceived").click
        @driver.find_element(id: "ReceiveAuthorization_DateReceived").send_keys(DateTime.now.strftime('%m/%d/%Y'))
    end

    def enter_limit
        #Limits
        @driver.find_element(id: "VueLimit_Value").click #Field focus units requested
        @driver.find_element(id: "VueLimit_Value").send_keys "1000" #enters limits amount
        #Status
		limits_per = @driver.find_element(xpath: "//select[@id=\"VueLimit_Period\"]/..//input")
		limits_per.click
		limits_per.send_keys "Day"
		limits_per.send_keys :return
        #Adds Limit
        @driver.find_element(xpath: "//a[contains(., \"Add Limit\")]").click
    end

    run do
        # 1. Login
		login USERNAME, PASSWORD

        # 2. Navigate to Authorizations
        navigate_to_clients_page
        navigate_to_a_client "#{CLIENT_FIRST_NAME} #{CLIENT_LAST_NAME}"
        navigate_to_authorizations

        # 3. Add an Authorization
        click_add_authorization
        set_authorization_type 'Managed'
        fill_in_insurance
        fill_in_request_date
        fill_in_effective_to
        fill_in_effective_from
        fill_in_units_requested
        fill_in_request_date # again?
        fill_in_service
        fill_in_referring_npi_info
        save_authorization

        # 4. Receive Authorization
        navigate_to_authorizations
        access_the_added_authorization
        enter_info_for_received_authorization
        enter_limit
        save_authorization

        # 5. Logout
        logout
    end
