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

	#Navigate to the Client's page
		#Clicks Clients
			browser.find_element(link_text: "Clients").click
		#Clicks Add Client
			browser.find_element(xpath: "/html/body/div[1]/div/div/form/div[1]/a").click

	#Fill in Personal information data.
			browser.find_element(id: "PersonalInfo_NameFirst").send_keys "Automationfirstname1" #First name
			browser.find_element(id: "PersonalInfo_NameMiddle").send_keys "Automationmiddlename1" #Middle name
			browser.find_element(id: "PersonalInfo_NameLast").send_keys "Automationlastname1" #Last name
			browser.find_element(id: "PersonalInfo_NameSuffix").send_keys "Auto" #Suffix
			browser.find_element(id: "PersonalInfo_PreviousName").send_keys "Automationpreviousname Lastname"
			browser.find_element(id: "PersonalInfo_NamePreferred").send_keys "Automationpreferredname Lastname"
			browser.find_element(id: "PersonalInfo_SSN").click
				browser.find_element(id: "PersonalInfo_SSN").click
					browser.find_element(id: "PersonalInfo_SSN").send_keys "111111111"
			browser.find_element(id: "PersonalInfo_Birthdate").click
				browser.find_element(id: "PersonalInfo_Birthdate").send_keys "03/30/1990"
			browser.find_element(id: "PersonalInfo_EclipseId").send_keys "1"
			browser.find_element(xpath: "/html/body/div/div/div/form/section[1]/div[3]/div[1]/div/div/div[1]/input").click #Gender drop down
				browser.find_element(xpath: "/html/body/div/div/div/form/section[1]/div[3]/div[1]/div/div/div[1]/input").send_keys "Female" #enters a selection
					browser.find_element(xpath: "/html/body/div/div/div/form/section[1]/div[3]/div[1]/div/div/div[1]/input").send_keys :return #selects the selection
			
			browser.find_element(xpath: "/html/body/div/div/div/form/section[1]/div[3]/div[2]/div/div/div[1]/input").click #Race1 drop down
				browser.find_element(xpath: "/html/body/div/div/div/form/section[1]/div[3]/div[2]/div/div/div[1]/input").send_keys "Automation Race1" #enters a selection
					browser.find_element(xpath: "/html/body/div/div/div/form/section[1]/div[3]/div[2]/div/div/div[1]/input").send_keys :return #selects the selection
			
			browser.find_element(xpath: "/html/body/div/div/div/form/section[1]/div[3]/div[3]/div/div/div[1]/input").click #Race2 drop down
				browser.find_element(xpath: "/html/body/div/div/div/form/section[1]/div[3]/div[3]/div/div/div[1]/input").send_keys "Automation Race1" #enters a selection
					browser.find_element(xpath: "/html/body/div/div/div/form/section[1]/div[3]/div[3]/div/div/div[1]/input").send_keys :return #selects the selection
			
			browser.find_element(xpath: "/html/body/div/div/div/form/section[1]/div[4]/div[1]/div/div/div[1]/input").click #Ethnic Origin drop down
				browser.find_element(xpath: "/html/body/div/div/div/form/section[1]/div[4]/div[1]/div/div/div[1]/input").send_keys "Automation Ethnic Origin1" #enters a selection
					browser.find_element(xpath: "/html/body/div/div/div/form/section[1]/div[4]/div[1]/div/div/div[1]/input").send_keys :return #selects the selection
			
			browser.find_element(xpath: "/html/body/div/div/div/form/section[1]/div[4]/div[2]/div/div/div[1]/input").click #County of Origin drop down
				browser.find_element(xpath: "/html/body/div/div/div/form/section[1]/div[4]/div[2]/div/div/div[1]/input").send_keys "Alamance" #enters a selection
					browser.find_element(xpath: "/html/body/div/div/div/form/section[1]/div[4]/div[2]/div/div/div[1]/input").send_keys :return #selects the selection
			
			browser.find_element(xpath: "/html/body/div/div/div/form/section[1]/div[5]/div[1]/div/div/div[1]/input").click #Primary Language drop down
				browser.find_element(xpath: "/html/body/div/div/div/form/section[1]/div[5]/div[1]/div/div/div[1]/input").send_keys "Automation Language1" #enters a selection
					browser.find_element(xpath: "/html/body/div/div/div/form/section[1]/div[5]/div[1]/div/div/div[1]/input").send_keys :return #selects the selection
			
			browser.find_element(xpath: "/html/body/div/div/div/form/section[1]/div[5]/div[2]/div/div/div[1]/input").click #Secondary Language drop down
				browser.find_element(xpath: "/html/body/div/div/div/form/section[1]/div[5]/div[2]/div/div/div[1]/input").send_keys "Automation Language1" #enters a selection
					browser.find_element(xpath: "/html/body/div/div/div/form/section[1]/div[5]/div[2]/div/div/div[1]/input").send_keys :return #selects the selection
			
			browser.find_element(xpath: "/html/body/div/div/div/form/section[1]/div[5]/div[3]/div/div/div[1]/input").click #Third Language drop down
				browser.find_element(xpath: "/html/body/div/div/div/form/section[1]/div[5]/div[3]/div/div/div[1]/input").send_keys "Automation Language1" #enters a selection
					browser.find_element(xpath: "/html/body/div/div/div/form/section[1]/div[5]/div[3]/div/div/div[1]/input").send_keys :return #selects the selection

					browser.find_element(id: "PersonalInfo_EthnicInfoNotes").send_keys "This client info was added by automaton."

	#Contact Information
			browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[2]/div[1]/div/div/label[2]/span").click #Is Homeless switch
				browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[2]/div[1]/div/div/label[2]/span").click #Sets "Is Homeless" back to NO

		#Address block
					browser.find_element(id: "ContactInfo_Address_Street1").send_keys "306 Tidal Rice Court" #Enters address line 1
					browser.find_element(id: "ContactInfo_Address_Street2").send_keys "1234 West Main Ave" #Enters address line 2
						browser.find_element(id: "ContactInfo_Address_City").send_keys "Charleston" #Enters city
						browser.find_element(id: "ContactInfo_Address_State").send_keys "SC" #Enters state
						browser.find_element(id: "ContactInfo_Address_ZipCode").click #Zipcode focus
						browser.find_element(id: "ContactInfo_Address_ZipCode").send_keys "123451234" #Enters 9-digit zip code

						browser.find_element(xpath: "/html/body/div/div/div/form/section[2]/div[3]/div[4]/div/div/div[1]/input").click #Select County of residence drop down
							browser.find_element(xpath: "/html/body/div/div/div/form/section[2]/div[3]/div[4]/div/div/div[1]/input").send_keys "alamance" #Enters a selection
								browser.find_element(xpath: "/html/body/div/div/div/form/section[2]/div[3]/div[4]/div/div/div[1]/input").send_keys :return #Selects the selection
						browser.find_element(id: "ContactInfo_CellPhone").click #Cell number focus
							browser.find_element(id: "ContactInfo_CellPhone").send_keys "9997778888" #Enters Cell number
						browser.find_element(id: "ContactInfo_HomePhone").click #Home number focus
							browser.find_element(id: "ContactInfo_HomePhone").send_keys "1112223333" #Enters Home number
						browser.find_element(id: "ContactInfo_WorkPhone").click #Work number focus
							browser.find_element(id: "ContactInfo_WorkPhone").send_keys "4445556677" #Enters Work number	
						browser.find_element(id: "ContactInfo_EmailAddress").send_keys "automated1@email.com" #Email address

						browser.find_element(xpath: "/html/body/div/div/div/form/section[2]/div[6]/div[2]/div/div/div[1]/input").click #Select Preferred Communication drop down
							browser.find_element(xpath: "/html/body/div/div/div/form/section[2]/div[6]/div[2]/div/div/div[1]/input").send_keys "Cell" #Enters a selection
								browser.find_element(xpath: "/html/body/div/div/div/form/section[2]/div[6]/div[2]/div/div/div[1]/input").send_keys :return #Selects the selection
						
						browser.find_element(id: "ContactInfo_PrimaryShelter").send_keys "Home" #Primary shelter
							browser.find_element(id: "ContactInfo_SecondaryShelter").send_keys "Gun range" #Secondary shelter

						browser.find_element(id: "ContactInfo_ContactInfoComments").send_keys "This contact info was added by automation."
							
		#Emergency Contact Information
			browser.find_element(id: "EmergencyContact_NameFirst").send_keys "Autoemergencyname1" #First name
			browser.find_element(id: "EmergencyContact_NameMiddle").send_keys "Autoemergencymiddlename1" #Middle name
			browser.find_element(id: "EmergencyContact_NameLast").send_keys "Autoemergencylastname1" #Last name
			browser.find_element(id: "EmergencyContact_NameSuffix").send_keys "Auto" #Suffix

			browser.find_element(xpath: "//*[@id='guardian-info-section']/div[5]/div[1]/div/div/div[1]/input").click #Relationship drop down
				browser.find_element(xpath: "//*[@id='guardian-info-section']/div[5]/div[1]/div/div/div[1]/input").send_keys "Automation Relationship1" #enters a selection
					browser.find_element(xpath: "//*[@id='guardian-info-section']/div[5]/div[1]/div/div/div[1]/input").send_keys :return #selects the selection
		
			browser.find_element(id: "EmergencyContact_EmailAddress").send_keys "automatedemergency@email.com" #Email address for emergency contact
			browser.find_element(id: "EmergencyContact_HomePhone").click #Home number focus
				browser.find_element(id: "EmergencyContact_HomePhone").send_keys "1111111111" #Enters Emergency Contact Home number
			browser.find_element(id: "EmergencyContact_CellPhone").click #Work number focus
				browser.find_element(id: "EmergencyContact_CellPhone").send_keys "2222222222" #Enters Emergency Contact Cell number	
						
		#Saves the Client
			browser.find_element(xpath: "/html/body/div[1]/div/div/form/div/ul/li[2]/button").click

		#Address validation popup 
			browser.find_element(xpath: "//*[@id='address-selection-vue']/div/div/div/div[3]/button[2]/span").click

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


