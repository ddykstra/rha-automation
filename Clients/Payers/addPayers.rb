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

#Navigate to the Payers' page
		#Clicks Clients
			browser.find_element(link_text: "Clients").click
		#Searches and accesses a specific client
			browser.find_element(id: "search").send_keys "Automation"
				browser.find_element(xpath: "/html/body/div[1]/div/div/form/div[2]/div/div/span/input").click
					browser.find_element(link_text: "Automationfirstname1 Automationlastname1").click

				#Clicks Payers on the left nav
					browser.find_element(link_text: "Payers").click

				#Clicks Add Payers
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[3]/div/div[3]/a/i").click

			#Payer Name
				browser.find_element(xpath: "//*[@id='insurance-form']/div[1]/div[1]/div/div/div[1]/input").click #Payer drop down
				browser.find_element(xpath: "//*[@id='insurance-form']/div[1]/div[1]/div/div/div[1]/input").send_keys "Automationpayer Lastname" #enters a selection
					browser.find_element(xpath: "//*[@id='insurance-form']/div[1]/div[1]/div/div/div[1]/input").send_keys :return #selects the selection

			#Policy Number
				browser.find_element(id: "PolicyNumber").send_keys "0000001"

			#Priority
				browser.find_element(xpath: "//*[@id='insurance-form']/div[1]/div[3]/div/div[1]/label/span").click #Primary
					browser.find_element(xpath: "//*[@id='insurance-form']/div[1]/div[3]/div/div[2]/label/span").click #Secondary					 
						browser.find_element(xpath: "//*[@id='insurance-form']/div[1]/div[3]/div/div[3]/label/span").click #Tertiary
				browser.find_element(xpath: "//*[@id='insurance-form']/div[1]/div[3]/div/div[1]/label/span").click

			#Relationship to Insured
				browser.find_element(xpath: "//*[@id='insurance-form']/div[2]/div[2]/div/div/div[1]/input").click #Relationship to insured drop down
				browser.find_element(xpath: "//*[@id='insurance-form']/div[2]/div[2]/div/div/div[1]/input").send_keys "Self" #enters a selection
					browser.find_element(xpath: "//*[@id='insurance-form']/div[2]/div[2]/div/div/div[1]/input").send_keys :return #selects the selection

			#Termination Date
				browser.find_element(id: "TerminationDate").click
					browser.find_element(id: "TerminationDate").send_keys "12/25/2015"

			#Effective Date
				browser.find_element(id: "EffectiveFrom").click
					browser.find_element(id: "EffectiveFrom").send_keys "02/11/2015"

			#MCO Funded
				#browser.find_element(xpath: "//*[@id="insurance-form"]/div[3]/rha-mco-funding/div[1]/div/div[1]/label/span").click #Sets it to NO
				browser.find_element(xpath: "//*[@id='insurance-form']/div[3]/rha-mco-funding/div[1]/div/div[2]/label/span").click #Sets it to YES

					#If MCO Funded = YES
						browser.find_element(xpath: "//*[@id='insurance-form']/div[3]/rha-mco-funding/div[2]/div[1]/div/div[1]/label/span").click #Type of MCO Funding = Medicaid
						#browser.find_element(xpath: "//*[@id='insurance-form']/div[3]/rha-mco-funding/div[2]/div[1]/div/div[1]/label/span").click #Type of MCO Funding = State

						#If MCO = YES
							browser.find_element(id: "McoFunding_MedicaidNumber").send_keys "0000001"

					#Saves Payer
						browser.find_element(xpath: "//*[@id='insurance-form']/div[4]/ul/li[2]/button").click

=begin

	#wait.until(ExpectedConditions.elementToBeClickable(By.class "selectize-control"));
	#/WebDriverWait wait = new WebDriverWait(webDriver, timeoutInSeconds);
	#wait.until(ExpectedConditions.visibilityOfElementLocated(By.class "selectize-control"));/
	#browser.find_element(link_text: "Images").click
	#browser.find_elements(tag_name: "img").size

		#Logout
			browser.find_element(id: "signout-icon").click

=end

browser.close


