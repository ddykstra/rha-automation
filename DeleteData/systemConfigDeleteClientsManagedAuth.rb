/class name			:class_name			:class
css selector		:css	 
id					:id	 
link text			:link_text			:link
name				:name	 
partial link text	:partial_link_text	 
tag name			:tag_name	 
xpath				:xpath/

#Add a group

#BROWSER: FIREFOX
require "selenium-webdriver"
 browser = Selenium::WebDriver.for :firefox
  browser.get "https://login.microsoftonline.com/login.srf?wa=wsignin1.0&wtrealm=https%3a%2f%2flogin.windows.net%2f&wreply=https%3a%2f%2flogin.windows.net%2frhadev.onmicrosoft.com%2fwsfederation&wctx=3wEBDFdzRmVkZXJhdGlvbgENVXNlck9ubHlUb2tlbgEWcmhhZGV2Lm9ubWljcm9zb2Z0LmNvbQEBAQZzYW1sMjAAAAEBJWh0dHBzOi8vcmhhZGV2Lm9ubWljcm9zb2Z0LmNvbS9yaGF3ZWIAAAEBAQxyZXBseWFkZHJlc3MBHWh0dHBzOi8vcmhhLmF6dXJld2Vic2l0ZXMubmV0AQUBAnJjARZybT0wJmlkPXBhc3NpdmUmcnU9JTJmAQ9saW1pdF90b2tlbnNpemUBBUZhbHNlAQtpbnRlcmFjdGl2ZQEEVHJ1ZQEPRm9yY2VGcmVzaExvZ2luAQVGYWxzZQEJc2Vzc2lvbklkASRjODA0ZTkyYi04YTc5LTQ0N2QtYjYxZi00Y2ZjOWExYWVhZjTt0&wp=MBI_FED_SSL&id="
  #browser.window.resize_to(1680,1050)
   browser.current_url
	browser.title

#Login screen
		browser.find_element(id: "cred_userid_inputtext").send_keys "rhadevadmin@rhadev.onmicrosoft.com"
		browser.find_element(id: "cred_password_inputtext").send_keys "RHAdev989"
		browser.find_element(id: "cred_sign_in_button").click
		sleep(1)
		browser.find_element(id: "cred_sign_in_button").click

#Manage Authorization

		#Clicks Clients
			browser.find_element(link_text: "Clients").click
		#Searches and accesses a specific client
			browser.find_element(id: "search").send_keys "Automation"
				browser.find_element(xpath: "/html/body/div[1]/div/div/form/div[2]/div/div/span/input").click
					browser.find_element(link_text: "Automationfirstname1 Automationlastname1").click

				#Clicks Authorizations on the left nav
					browser.find_element(link_text: "Authorizations").click

				#Clicks Delete
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[3]/table/tbody/tr/td[5]/div[1]/a[2]/i").click
						browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[3]/table/tbody/tr/td[5]/div[3]/button[1]").click
sleep(1)
#Navigate to the Payers' page

				#Clicks Payers on the left nav
					browser.find_element(link_text: "Payers").click

					#Clicks Delete
						browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[3]/table/tbody/tr/td[6]/div[1]/a[2]/i").click
							browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[3]/table/tbody/tr/td[6]/div[3]/button[1]").click
sleep(1)				
#Navigate to the Assignments' Page

				#Clicks Assignments on the left nav
					browser.find_element(link_text: "Assignments").click

				#Clicks Delete
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[3]/table/tbody/tr/td[6]/div[1]/a[2]/i").click
						browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[3]/table/tbody/tr/td[6]/div[3]/button[1]").click
sleep(1)
#Navigate to the Add Referral page

				#Clicks Referrals on the left nav
					browser.find_element(link_text: "Referrals").click

				#Clicks Delete
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[3]/table/tbody/tr/td[5]/div[1]/a[2]/i").click
						browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[3]/table/tbody/tr/td[5]/div[3]/button[1]").click
sleep(1)
#Navigate to the Client's page - Changes client's information

			#Clicks Demographics
				browser.find_element(link_text: "Demographics").click

	#Changes Personal information data.
		browser.find_element(id: "PersonalInfo_NameFirst").click
			browser.find_element(id: "PersonalInfo_NameFirst").send_keys "Blah100" #First name
		browser.find_element(id: "PersonalInfo_NameMiddle").click
			browser.find_element(id: "PersonalInfo_NameMiddle").send_keys "Blah100" #Middle name
		browser.find_element(id: "PersonalInfo_NameLast").click
			browser.find_element(id: "PersonalInfo_NameLast").send_keys "Blah100" #Last name
		browser.find_element(id: "PersonalInfo_NameSuffix").click
			browser.find_element(id: "PersonalInfo_NameSuffix").send_keys "Auto" #Suffix
		browser.find_element(id: "PersonalInfo_PreviousName").click
			browser.find_element(id: "PersonalInfo_PreviousName").send_keys "Blah100 Lastname"
		browser.find_element(id: "PersonalInfo_NamePreferred").click
			browser.find_element(id: "PersonalInfo_NamePreferred").send_keys "Blah100 Lastname"
			
			browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[1]/div[3]/div[2]/div/div/div[1]/input").click #Race1 drop down
			browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[1]/div[3]/div[2]/div/div/div[1]/input").send_keys :backspace
				browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(4) > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "udo races" #enters a selection
					browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(4) > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
			
			browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[1]/div[3]/div[3]/div/div/div[1]/input").click #Race2 drop down
			browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[1]/div[3]/div[3]/div/div/div[1]/input").send_keys :backspace
				browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(4) > div:nth-child(3) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "udo races" #enters a selection
					browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(4) > div:nth-child(3) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
			
			browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/section[1]/div[4]/div[1]/div/div/div[1]/input").click #Ethnic Origin drop down
			browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/section[1]/div[4]/div[1]/div/div/div[1]/input").send_keys :backspace
				browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/section[1]/div[4]/div[1]/div/div/div[1]/input").send_keys "udo ethnic origin" #enters a selection
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/section[1]/div[4]/div[1]/div/div/div[1]/input").send_keys :return #selects the selection

			browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[1]/div[5]/div[1]/div/div/div[1]/input").click #Primary Language drop down
			browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[1]/div[5]/div[1]/div/div/div[1]/input").send_keys :backspace
				browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(6) > div:nth-child(1) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "udo language" #enters a selection
					browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(6) > div:nth-child(1) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
			
			browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[1]/div[5]/div[2]/div/div/div[1]/input").click #Secondary Language drop down
			browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[1]/div[5]/div[2]/div/div/div[1]/input").send_keys :backspace
				browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(6) > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "udo language" #enters a selection
					browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(6) > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
			
			browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[1]/div[5]/div[3]/div/div/div[1]/input").click #Third Language drop down
			browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[1]/div[5]/div[3]/div/div/div[1]/input").send_keys :backspace
				browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(6) > div:nth-child(3) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "udo language" #enters a selection
					browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(6) > div:nth-child(3) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
							
		#Emergency Contact Information
			browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[3]/div[2]/div[1]/div/div/div[1]/input").click #Relationship drop down
			browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[3]/div[2]/div[1]/div/div/div[1]/input").send_keys :backspace
				browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[3]/div[2]/div[1]/div/div/div[1]/input").send_keys "Relationship 1" #enters a selection
					browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[3]/div[2]/div[1]/div/div/div[1]/input").send_keys :return #selects the selection
						
		#Saves the Client
			browser.find_element(xpath: "/html/body/div[1]/div/div/form/div/ul/li[2]/button").click

		#Address validation popup 
			browser.find_element(xpath: "//*[@id='address-selection-vue']/div/div/div/div[3]/button[2]/span").click
sleep(1)
#Contracts
		#Clicks System Config
			browser.find_element(link_text: "System Configuration").click

			#Clicks Contracts
				browser.find_element(link_text: "Contracts").click

				#Clicks Delete
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/table/tbody/tr[2]/td[8]/div[1]/a[2]/i").click
						browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/table/tbody/tr[2]/td[8]/div[3]/button[1]").click
sleep(1)
#NPI PROVIDER 

		#Clicks NPI Management on left Nav
			browser.find_element(link_text: "NPI Management").click
					
				#Clicks Delete
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/table/tbody/tr[3]/td[7]/div[1]/a[2]/i").click
						browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/table/tbody/tr[3]/td[7]/div[3]/button[1]").click
sleep(1)
#NPI REFERRAL 
				
				#Clicks Delete
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/table/tbody/tr[4]/td[7]/div[1]/a[2]/i").click
						browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/table/tbody/tr[4]/td[7]/div[3]/button[1]").click
sleep(1)
#NPI FACILITY 
		
				#Clicks Delete
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/table/tbody/tr[6]/td[7]/div[1]/a[2]/i").click
						browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/table/tbody/tr[6]/td[7]/div[3]/button[1]").click
sleep(1)
#COST CENTERS 

		#Clicks Cost Centers on left Nav
			browser.find_element(link_text: "Cost Centers").click

				#Clicks Delete
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/table/tbody/tr[1]/td[5]/div[1]/a[2]/i").click
						browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/table/tbody/tr[1]/td[5]/div[3]/button[1]").click
sleep(1)
#PAYERS 

		#Clicks Payers on left Nav
			browser.find_element(link_text: "Payers").click
		
				#Clicks Delete
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/table/tbody/tr[4]/td[7]/div[1]/a[2]/i").click
						browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/table/tbody/tr[4]/td[7]/div[3]/button[1]").click
sleep(1)
#LOCATIONS 

		#Clicks Locations on left Nav
			browser.find_element(link_text: "Locations").click
		
				#Clicks Delete
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/table/tbody/tr[1]/td[6]/div[1]/a[2]/i").click
						browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/table/tbody/tr[1]/td[6]/div[3]/button[1]").click
sleep(1)
#PROGRAMS 

		#Clicks Programs on left Nav
			browser.find_element(link_text: "Programs").click
		
				#Clicks Delete
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/table/tbody/tr[2]/td[4]/div[1]/a[2]/i").click
						browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/table/tbody/tr[2]/td[4]/div[3]/button[1]").click
sleep(1)
#SERVICES 

		#Clicks Services on left Nav
			browser.find_element(link_text: "Services").click

				#Clicks Delete
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/table/tbody/tr[1]/td[8]/div[1]/a[2]/i").click
						browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/table/tbody/tr[1]/td[8]/div[3]/button[1]").click
sleep(1)
#GROUPS 
		
		#Clicks Services on left Nav
			browser.find_element(link_text: "Groups").click

				#Clicks Delete
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/table/tbody/tr[1]/td[3]/div[1]/a[2]/i").click
						browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/table/tbody/tr[1]/td[3]/div[3]/button[1]").click

sleep(1)
#UDO LIST - Clinical Goals 

		#Clicks Services on left Nav
			browser.find_element(link_text: "UDO List").click
		
		#clicks Clinical Goals
			browser.find_element(link_text: "Clinical Goals").click
				
			#Clicks Delete
				browser.find_element(xpath: "//*[@id='udl-list']/div/div/ul/li[1]/div/span[2]/a[1]/i").click
						
sleep(1)
#UDO LIST - Companies 
		#Clicks "Back to UDL List"
			browser.find_element(link_text: "Back to UDL List").click

		#Clicks Companies
			browser.find_element(link_text: "Companies").click

			#Deletes company
				browser.find_element(xpath: "//*[@id='udl-list']/div/div/ul/li[3]/div/span[2]/a[1]/i").click
sleep(1)
#UDO LIST - Service Categories 
		#Clicks "Back to UDL List"
			browser.find_element(link_text: "Back to UDL List").click

		#Clicks Service categories
			browser.find_element(link_text: "Service Categories").click

			#Deletes Service category
				browser.find_element(xpath: "//*[@id='udl-list']/div/div/ul/li[2]/div/span[2]/a[1]/i").click
sleep(1)
#UDO LIST - Ethnic Origins 
		#Clicks "Back to UDL List"
			browser.find_element(link_text: "Back to UDL List").click

		#Clicks Ethnic Origins
			browser.find_element(link_text: "Ethnic Origins").click

			#Deletes Ethnic Origin
				browser.find_element(xpath: "//*[@id='udl-list']/div/div/ul/li[1]/div/span[2]/a[1]/i").click
sleep(1)
#UDO LIST - Languages 
		#Clicks "Back to UDL List"
			browser.find_element(link_text: "Back to UDL List").click

		#Clicks Language
			browser.find_element(link_text: "Languages").click

			#Deletes Language
				browser.find_element(xpath: "//*[@id='udl-list']/div/div/ul/li[1]/div/span[2]/a[1]/i").click
sleep(1)
#UDO LIST - Places of Service 
		#Clicks "Back to UDL List"
			browser.find_element(link_text: "Back to UDL List").click

		#Clicks Places of Service
			browser.find_element(link_text: "Places of Service").click

			#Deletes Places of Service
				browser.find_element(xpath: "//*[@id='udl-list']/div/div/ul/li[1]/div/span[2]/a[1]/i").click
sleep(1)
#UDO LIST - Races 
		#Clicks "Back to UDL List"
			browser.find_element(link_text: "Back to UDL List").click

		#Clicks Races
			browser.find_element(link_text: "Races").click

			#Deletes Races
				browser.find_element(xpath: "//*[@id='udl-list']/div/div/ul/li[1]/div/span[2]/a[1]/i").click
sleep(1)
#UDO LIST - Relationships 
		#Clicks "Back to UDL List"
			browser.find_element(link_text: "Back to UDL List").click

		#Clicks Relationships
			browser.find_element(link_text: "Relationships").click

			#Deletes Relationships
				browser.find_element(xpath: "//*[@id='udl-list']/div/div/ul/li[1]/div/span[2]/a[1]/i").click

=begin

	#wait.until(ExpectedConditions.elementToBeClickable(By.class "selectize-control"));
	#/WebDriverWait wait = new WebDriverWait(webDriver, timeoutInSeconds);
	#wait.until(ExpectedConditions.visibilityOfElementLocated(By.class "selectize-control"));/
	#browser.find_element(link_text: "Images").click
	#browser.find_elements(tag_name: "img").size

		#Logout
			browser.find_element(id: "signout-icon").click

=end
sleep(1)
browser.close


