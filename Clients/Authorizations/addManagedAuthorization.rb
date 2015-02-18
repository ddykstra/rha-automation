/class name			:class_name			:class
css selector		:css	 
id					:id	 
link text			:link_text			:link
name				:name	 
partial link text	:partial_link_text	 
tag name			:tag_name	 
xpath				:xpath/

#BROWSER: FIREFOX
require "rubygems"
require "selenium-webdriver"
 browser = Selenium::WebDriver.for :firefox
  browser.get "https://login.microsoftonline.com/login.srf?wa=wsignin1.0&wtrealm=https%3a%2f%2flogin.windows.net%2f&wreply=https%3a%2f%2flogin.windows.net%2frhadev.onmicrosoft.com%2fwsfederation&wctx=3wEBDFdzRmVkZXJhdGlvbgENVXNlck9ubHlUb2tlbgEWcmhhZGV2Lm9ubWljcm9zb2Z0LmNvbQEBAQZzYW1sMjAAAAEBJWh0dHBzOi8vcmhhZGV2Lm9ubWljcm9zb2Z0LmNvbS9yaGF3ZWIAAAEBAQxyZXBseWFkZHJlc3MBHWh0dHBzOi8vcmhhLmF6dXJld2Vic2l0ZXMubmV0AQUBAnJjARZybT0wJmlkPXBhc3NpdmUmcnU9JTJmAQ9saW1pdF90b2tlbnNpemUBBUZhbHNlAQtpbnRlcmFjdGl2ZQEEVHJ1ZQEPRm9yY2VGcmVzaExvZ2luAQVGYWxzZQEJc2Vzc2lvbklkASRjODA0ZTkyYi04YTc5LTQ0N2QtYjYxZi00Y2ZjOWExYWVhZjTt0&wp=MBI_FED_SSL&id="
  #browser.window.resize_to(1680,1050)
  #driver.manage.timeouts.implicit_wait = 10
   browser.current_url
	browser.title

	#Login screen
		browser.find_element(id: "cred_userid_inputtext").send_keys "rhadevadmin@rhadev.onmicrosoft.com"
		browser.find_element(id: "cred_password_inputtext").send_keys "RHAdev989"
		browser.find_element(id: "cred_sign_in_button").click
		sleep(1)
		browser.find_element(id: "cred_sign_in_button").click

	#Navigate to the Clients' page, clicks Authorizations on left nav, and then click Add Authorization button
		#Clicks Clients
			browser.find_element(link_text: "Clients").click
		#Searches and accesses a specific client
			browser.find_element(id: "search").send_keys "Automation"
				browser.find_element(xpath: "/html/body/div[1]/div/div/form/div[2]/div/div/span/input").click
					browser.find_element(link_text: "Automationfirstname1 Automationlastname1").click

				#Clicks Authorizations on the left nav
					browser.find_element(link_text: "Authorizations").click

				#Clicks Add Authorizations
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[3]/div/div[3]/a").click

				#Authorization type
					browser.find_element(xpath: "//*[@id='authorization-form']/div[1]/div/div/div[1]/label/span").click #managed
						#browser.find_element(xpath: "//*[@id='authorization-request-form']/div[1]/div/div/div[2]/label/span").click

			#Insurance
				browser.find_element(xpath: "//*[@id='request-info']/div/div[1]/div/div/div[1]/input").click #Insurance drop down
				browser.find_element(xpath: "//*[@id='request-info']/div/div[1]/div/div/div[1]/input").send_keys "Automationpayer Lastname" #enters a selection
					browser.find_element(xpath: "//*[@id='request-info']/div/div[1]/div/div/div[1]/input").send_keys :return #selects the selection

			#Request Date
				browser.find_element(id: "ManagedAuthorizationInputs_DateRequested").click
					browser.find_element(id: "ManagedAuthorizationInputs_DateRequested").send_keys "02/13/2015"

			#Effective To
				browser.find_element(id: "Effective_To").click
					browser.find_element(id: "Effective_To").send_keys "12/25/2015"

			#Effective From
				browser.find_element(id: "Effective_From").click
					browser.find_element(id: "Effective_From").send_keys "02/13/2015"

			#Units Requested
				browser.find_element(id: "ManagedAuthorizationInputs_UnitsRequested").click #Field focus units requested
				browser.find_element(id: "ManagedAuthorizationInputs_UnitsRequested").click #Field focus units requested
					browser.find_element(id: "ManagedAuthorizationInputs_UnitsRequested").send_keys "50" #enters units requested amount

			#Request Date
				browser.find_element(id: "ManagedAuthorizationInputs_DateRequested").click
					browser.find_element(id: "ManagedAuthorizationInputs_DateRequested").send_keys "02/13/2015"

			#Service
				browser.find_element(xpath: "//*[@id='unbundled-services']/div/div/div/div[1]/input").click #Insurance drop down
				browser.find_element(xpath: "//*[@id='unbundled-services']/div/div/div/div[1]/input").send_keys "HCPCS - AddedByAutomationService1" #enters a selection
					browser.find_element(xpath: "//*[@id='unbundled-services']/div/div/div/div[1]/input").send_keys :return #selects the selection
sleep(1)
			#Referring NPI Info (Optional)
				browser.find_element(xpath: "//*[@id='referring-provider']/section/div/div[1]/div/div/div[1]/input").click #Referring Provider drop down
				browser.find_element(xpath: "//*[@id='referring-provider']/section/div/div[1]/div/div/div[1]/input").send_keys "Referralautomation" #enters a selection
					browser.find_element(xpath: "//*[@id='referring-provider']/section/div/div[1]/div/div/div[1]/input").send_keys :return #selects the selection
sleep(1)
				#Saves Authorization
					browser.find_element(xpath: "//*[@id='authorization-form']/div[3]/ul/li[2]/button").click
sleep(1)
#Opens Authorization again to fill out Received information
		
		#Clicks Authorizations on the left nav
			browser.find_element(link_text: "Authorizations").click

		#Accesses the added authorization
			browser.find_element(link_text: "Automationpayer Lastname1").click

			#Enters info for received authorization
				browser.find_element(id: "Number").send_keys "00001"

			#Status
				browser.find_element(xpath: "//*[@id='authorization-form']/section[2]/div[1]/div[3]/div/div/div[1]/input").click #Insurance drop down
				browser.find_element(xpath: "//*[@id='authorization-form']/section[2]/div[1]/div[3]/div/div/div[1]/input").send_keys "Active" #enters a selection
					browser.find_element(xpath: "//*[@id='authorization-form']/section[2]/div[1]/div[3]/div/div/div[1]/input").send_keys :return #selects the selection	

				#Units Authorized
					browser.find_element(id: "UnitsAuthorized").click #Field focus units requested
						browser.find_element(id: "UnitsAuthorized").click #Field focus units requested
							browser.find_element(id: "UnitsAuthorized").send_keys "20" #enters units authorized amount

				#Date Recieved
					browser.find_element(id: "DateReceived").click
						browser.find_element(id: "DateReceived").send_keys "02/15/2015"
							
				#Limits
					browser.find_element(id: "VueLimit_Value").click #Field focus units requested
						browser.find_element(id: "VueLimit_Value").click #Field focus units requested
							browser.find_element(id: "VueLimit_Value").send_keys "30" #enters limits amount

				#Status
					browser.find_element(xpath: "//*[@id='authorization-form']/section[2]/div[2]/rha-limits/div/div[1]/div[2]/div/div/div[1]/input").click #Insurance drop down
						browser.find_element(xpath: "//*[@id='authorization-form']/section[2]/div[2]/rha-limits/div/div[1]/div[2]/div/div/div[1]/input").send_keys "Day" #enters a selection
							browser.find_element(xpath: "//*[@id='authorization-form']/section[2]/div[2]/rha-limits/div/div[1]/div[2]/div/div/div[1]/input").send_keys :return #selects the selection	

					#Adds Limit
						browser.find_element(xpath: "//*[@id='authorization-form']/section[2]/div[2]/rha-limits/div/div[2]/div/a").click

						#Saves
							browser.find_element(xpath: "//*[@id='authorization-form']/div/ul/li[2]/button").click

browser.close


