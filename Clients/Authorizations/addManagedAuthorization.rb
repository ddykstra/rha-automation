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
		puts 'Navigating to Clients page'
		@driver.find_element(link_text: 'Clients').click
	end

    def navigate_to_a_client(name)
		puts "Navigating to a Client: #{name}"
		@driver.find_element(id: 'search').send_keys name
		@driver.find_element(css: 'input[value=Go]').click
		@driver.find_element(link_text:  name).click
	end

    def navigate_to_authorizations
        puts 'Navigating to Authorizations'
        @driver.find_element(link_text: "Authorizations").click
    end

    def click_add_authorization
        puts 'Clicking Add Authorization'
        @driver.find_element(css: "a[href=\"/clinical/clients/1/authorizations/create\"]").click
    end

    def set_authorization_type(type)
        puts "Setting authorization type to #{type}"
        @driver.find_element(css: "input[value=\"#{type}\"]")
    end

    run do
        # 1. Login
		login USERNAME, PASSWORD

        # 2. Navigate to Authorizations
        navigate_to_clients_page
        navigate_to_a_client 'Lloyd Christmas'
        navigate_to_authorizations

        # 3. Add an Authorization
        click_add_authorization
        set_authorization_type 'Managed'
    end


    				#Clicks Authorizations on the left nav
    					@driver.find_element(link_text: "Authorizations").click

    				#Clicks Add Authorizations
    					@driver.find_element(xpath: "/html/body/div[1]/div[2]/div/div[3]/div/div[3]/a").click

    				#Authorization type
    					@driver.find_element(xpath: "//*[@id='authorization-form']/div[1]/div/div/div[1]/label/span").click #managed
    						#@driver.find_element(xpath: "//*[@id='authorization-request-form']/div[1]/div/div/div[2]/label/span").click

    			#Insurance
    				@driver.find_element(xpath: "//*[@id='request-info']/div/div[1]/div/div/div[1]/input").click #Insurance drop down
    				@driver.find_element(xpath: "//*[@id='request-info']/div/div[1]/div/div/div[1]/input").send_keys "Automationpayer Lastname" #enters a selection
    					@driver.find_element(xpath: "//*[@id='request-info']/div/div[1]/div/div/div[1]/input").send_keys :return #selects the selection

    			#Request Date
    				@driver.find_element(id: "ManagedAuthorizationInputs_DateRequested").click
    					@driver.find_element(id: "ManagedAuthorizationInputs_DateRequested").send_keys "02/13/2015"

    			#Effective To
    				@driver.find_element(id: "Effective_To").click
    					@driver.find_element(id: "Effective_To").send_keys "12/25/2015"

    			#Effective From
    				@driver.find_element(id: "Effective_From").click
    					@driver.find_element(id: "Effective_From").send_keys "02/13/2015"

    			#Units Requested
    				@driver.find_element(id: "ManagedAuthorizationInputs_UnitsRequested").click #Field focus units requested
    				@driver.find_element(id: "ManagedAuthorizationInputs_UnitsRequested").click #Field focus units requested
    					@driver.find_element(id: "ManagedAuthorizationInputs_UnitsRequested").send_keys "50" #enters units requested amount

    			#Request Date
    				@driver.find_element(id: "ManagedAuthorizationInputs_DateRequested").click
    					@driver.find_element(id: "ManagedAuthorizationInputs_DateRequested").send_keys "02/13/2015"

    			#Service
    				@driver.find_element(xpath: "//*[@id='unbundled-services']/div/div/div/div[1]/input").click #Insurance drop down
    				@driver.find_element(xpath: "//*[@id='unbundled-services']/div/div/div/div[1]/input").send_keys "HCPCS - AddedByAutomationService1" #enters a selection
    					@driver.find_element(xpath: "//*[@id='unbundled-services']/div/div/div/div[1]/input").send_keys :return #selects the selection
    sleep(1)
    			#Referring NPI Info (Optional)
    				@driver.find_element(xpath: "//*[@id='referring-provider']/section/div/div[1]/div/div/div[1]/input").click #Referring Provider drop down
    				@driver.find_element(xpath: "//*[@id='referring-provider']/section/div/div[1]/div/div/div[1]/input").send_keys "Referralautomation" #enters a selection
    					@driver.find_element(xpath: "//*[@id='referring-provider']/section/div/div[1]/div/div/div[1]/input").send_keys :return #selects the selection
    sleep(1)
    				#Saves Authorization
    					@driver.find_element(xpath: "//*[@id='authorization-form']/div[3]/ul/li[2]/button").click
    sleep(1)
    #Opens Authorization again to fill out Received information

    		#Clicks Authorizations on the left nav
    			@driver.find_element(link_text: "Authorizations").click

    		#Accesses the added authorization
    			@driver.find_element(link_text: "Automationpayer Lastname1").click

    			#Enters info for received authorization
    				@driver.find_element(id: "Number").send_keys "00001"

    			#Status
    				@driver.find_element(xpath: "//*[@id='authorization-form']/section[2]/div[1]/div[3]/div/div/div[1]/input").click #Insurance drop down
    				@driver.find_element(xpath: "//*[@id='authorization-form']/section[2]/div[1]/div[3]/div/div/div[1]/input").send_keys "Active" #enters a selection
    					@driver.find_element(xpath: "//*[@id='authorization-form']/section[2]/div[1]/div[3]/div/div/div[1]/input").send_keys :return #selects the selection

    				#Units Authorized
    					@driver.find_element(id: "UnitsAuthorized").click #Field focus units requested
    						@driver.find_element(id: "UnitsAuthorized").click #Field focus units requested
    							@driver.find_element(id: "UnitsAuthorized").send_keys "20" #enters units authorized amount

    				#Date Recieved
    					@driver.find_element(id: "DateReceived").click
    						@driver.find_element(id: "DateReceived").send_keys "02/15/2015"

    				#Limits
    					@driver.find_element(id: "VueLimit_Value").click #Field focus units requested
    						@driver.find_element(id: "VueLimit_Value").click #Field focus units requested
    							@driver.find_element(id: "VueLimit_Value").send_keys "30" #enters limits amount

    				#Status
    					@driver.find_element(xpath: "//*[@id='authorization-form']/section[2]/div[2]/rha-limits/div/div[1]/div[2]/div/div/div[1]/input").click #Insurance drop down
    						@driver.find_element(xpath: "//*[@id='authorization-form']/section[2]/div[2]/rha-limits/div/div[1]/div[2]/div/div/div[1]/input").send_keys "Day" #enters a selection
    							@driver.find_element(xpath: "//*[@id='authorization-form']/section[2]/div[2]/rha-limits/div/div[1]/div[2]/div/div/div[1]/input").send_keys :return #selects the selection

    					#Adds Limit
    						@driver.find_element(xpath: "//*[@id='authorization-form']/section[2]/div[2]/rha-limits/div/div[2]/div/a").click

    						#Saves
    							@driver.find_element(xpath: "//*[@id='authorization-form']/div/ul/li[2]/button").click
