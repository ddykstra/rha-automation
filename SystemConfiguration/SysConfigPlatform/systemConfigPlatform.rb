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

#UDO LIST - Companies - Navigate to the System Configuration page, clicks UDO List on left nav, and then clicks Companies link
		#Clicks System Config
			browser.find_element(link_text: "System Configuration").click
		#Clicks Services on left Nav
			browser.find_element(link_text: "UDO List").click
		#Clicks Add Service
			browser.find_element(link_text: "Companies").click

			#Add company
				browser.find_element(id: "ItemInput_Name").send_keys "Automation Company"

				#Saves
					browser.find_element(xpath: "//*[@id='udl-form']/div[2]/div/button").click

#GROUPS - Navigate to the System Configuration page, clicks Group on left nav, and then click Add Group button
		browser.find_element(xpath: "/html/body/header/ul[1]/li[5]/a").click
		browser.find_element(xpath: "/html/body/div[1]/div[1]/div/ul/li[2]/a").click
		browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/div/div[3]/a").click
		sleep(2)

			#Group details
				browser.find_element(id: "Name").send_keys "AutomationGroup"
					browser.find_element(id: "Description").send_keys "This was added by automation"

			#Saves Group
				browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div/ul/li[3]/button").click

#SERVICES - Navigate to the System Configuration page, clicks Services on left nav, and then click Add Service button
		#Clicks System Config
			browser.find_element(link_text: "System Configuration").click
		#Clicks Services on left Nav
			browser.find_element(link_text: "Services").click
		#Clicks Add Service
			browser.find_element(xpath: "/html/body/div/div[2]/div/div[2]/div/div[3]/a").click

	#Fill in Service data to add and save.
		#Entering in data
			browser.find_element(id: "ServiceModel_Name").send_keys "AddedByAutomationService1" #name
			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[1]/div[2]/div/div/div[1]").click #service category drop down
				browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(1) > div.form-container.col-sm-4 > div > div > div.selectize-input.items.not-full.has-options > input").send_keys "eye" #enters a selection
					browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(1) > div.form-container.col-sm-4 > div > div > div.selectize-input.items.not-full.has-options > input").send_keys :return #selects the selection
			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[1]/div[2]/div/div/div[1]").send_keys :tab
			browser.find_element(id: "ServiceModel_UsualCharge").click #usual charge field
				browser.find_element(id: "ServiceModel_UsualCharge").send_keys "500" #enters usual charge amount
			browser.find_element(id: "ServiceModel_HCPCS").send_keys "HCPCSauto" #HCPCS field
			browser.find_element(id: "ServiceModel_Modifier").send_keys "ModifierAuto" #Modifier field
			browser.find_element(id: "ServiceModel_Effective_From").click #Effective from calendar
				browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click #Chooses today
			browser.find_element(id: "ServiceModel_Effective_To").click
				browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click #Chooses today
			
			#Uncomment below line if changing BILL TYPE to "Inpatient"; otherwise, it will default to "Outpatient"
				#browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[3]/div[1]/div/div[1]/label/span").click

			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[3]/div[2]/div/div[1]/label/span").click #Revenue type revenue selections
				browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[3]/div[2]/div/div[2]/label/span").click #Shadow option
					browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[3]/div[2]/div/div[3]/label/span").click #NonBillable option
			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[3]/div[2]/div/div[1]/label/span").click #Clicks "FFS" again
			
	#P & L and Balance Sheet Mapping
			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[4]/div[1]/div/div/div[1]/input").click #P&L - Department drop down
				browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(5) > div:nth-child(1) > div > div > div.selectize-input.items.not-full.has-options > input").send_keys "234" #enters a selection
					browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(5) > div:nth-child(1) > div > div > div.selectize-input.items.not-full.has-options > input").send_keys :return #selects the selection

			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[4]/div[2]/div/div/div[1]").click #P&L - Root Account drop down
				browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(5) > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options.focus.input-active.dropdown-active > input[type='text']").send_keys "4323" #enters a selection
					browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(5) > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options.focus.input-active.dropdown-active > input[type='text']").send_keys :return #selects the selection

			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[4]/div[3]/div/div/div[1]/input").click #P&L - Product line drop down
				browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(5) > div:nth-child(3) > div > div > div.selectize-input.items.not-full.has-options > input").send_keys "432" #enters a selection
					browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(5) > div:nth-child(3) > div > div > div.selectize-input.items.not-full.has-options > input").send_keys :return #selects the selection

			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[4]/div[4]/div/div/div[1]/input").click #P&L - Service line drop down
				browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(5) > div:nth-child(4) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "3442" #enters a selection
					browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(5) > div:nth-child(4) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection

			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[5]/div[1]/div/div/div[1]/input").click #Balance Sheet - Department line drop down
				browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(7) > div:nth-child(1) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "11" #enters a selection
					browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(7) > div:nth-child(1) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection

			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[5]/div[2]/div/div/div[1]/input").click #Balance Sheet - Root account drop down
				browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(7) > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "1212" #enters a selection
					browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(7) > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection

			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[5]/div[3]/div/div/div[1]/input").click #Balance Sheet - Product line drop down
				browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(7) > div:nth-child(3) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "13" #enters a selection
					browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(7) > div:nth-child(3) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection

			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[5]/div[4]/div/div/div[1]/input").click #Balance Sheet - Service line drop down
				browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(7) > div:nth-child(4) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "14" #enters a selection
					browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(7) > div:nth-child(4) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection

	#Billing Rules
			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[2]/div[1]/div/div/div[1]/label/span").click #Rule type selections
				browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[2]/div[1]/div/div/div[2]/label/span").click #Event option
					browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[2]/div[1]/div/div/div[3]/label/span").click #PerDiem option
			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[2]/div[1]/div/div/div[1]/label/span").click #Clicks "Time" again

	#Billing Frequency Limits - THIS WAS REMOVED FROM THE ADD SERVICE SCREEN
			#browser.find_element(id: "min-units").click #Min units field focus 
				#browser.find_element(id: "min-units").send_keys "25" #Enters Min units
			#browser.find_element(id: "max-units").click #Max units field focus
				#browser.find_element(id: "max-units").send_keys "95" #Enters Max units
			browser.find_element(id: "billing-limits").click #Puts focus a field
				browser.find_element(id: "billing-limits").send_keys "14" #enters a selection
					browser.find_element(id: "billing-limits").send_keys :return #selects the selection
			#browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[2]/div[2]/div[3]/div/div/div[1]").click #Per drop down
			browser.find_element(id: "add-frequency").click #Clicks "Apply Frequency Limits button"
			
	#Define Measure
			browser.find_element(id: "ServiceModel_NumberOfUnits").click #Number of units field focus 
				browser.find_element(id: "ServiceModel_NumberOfUnits").send_keys "1000" #Enters Min units
			browser.find_element(id: "ServiceModel_Duration").click #Duration (minutes) field focus
				browser.find_element(id: "ServiceModel_Duration").send_keys "5" #Enters duration minutes units
			browser.find_element(id: "ServiceModel_DurationFloor").click #Duration Floor (minutes) field focus
				browser.find_element(id: "ServiceModel_DurationFloor").send_keys "15" #Enters duraction floor units
			browser.find_element(id: "ServiceModel_DurationCeiling").click #Duration Ceiling (minutes) field focus
				browser.find_element(id: "ServiceModel_DurationCeiling").send_keys "25" #Enters duration ceiling units

	#Request Start and End Time (By default, switch is NO - Comment the below line out if you want this to be true)
			browser.find_element(xpath: "//*[@id='model_time']/div/div/label[2]/span").click #Switches to YES

	#Authorization Rules (By default, switch is NO - Comment any of the below lines out if you want this to be true)
			browser.find_element(xpath: "//*[@id='bundling_vue']/div[1]/div[1]/div/label[2]/span").click #Required authorization; switches to YES
				browser.find_element(xpath: "//*[@id='bundling_vue']/div[2]/div/div/label[2]/span").click #Requiree Referral for authorization; switches to YES
					browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[3]/div[2]/div/div/label[2]/span").click #Requires Diagnosis; switches to YES
	#Authorization Type
			browser.find_element(xpath: "//*[@id='bundling_vue']/div[1]/div[2]/div[2]/label/span").click #Sets to "Unmanaged" which lights up "Allow Bundle Authorizations"
				#Allow Bundled Authorization switch - By default, it's NO - Comment the below line out if wanting to keep NO selected
				browser.find_element(xpath: "//*[@id='bundling_vue']/div[2]/div[2]/div/div/label[2]/span").click #Switches "Allow Bundled Authorization" to YES

	#Enforce (under Authorization Rules)
			browser.find_element(id: "enforcement-limit").click #Limit field focus 
				browser.find_element(id: "enforcement-limit").send_keys "35" #Enters limit amount
			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[3]/div[3]/div[2]/div/div/div[1]/div").click #Per drop down
				#browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(3) > div:nth-child(4) > div:nth-child(3) > div > div > div.selectize-input.items.has-options.full.has-items").send_keys "14" #enters a selection
					#browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(3) > div:nth-child(4) > div:nth-child(3) > div > div > div.selectize-input.items.has-options.full.has-items").send_keys :return #selects the selection
			browser.find_element(id: "add-limit").click #Clicks "Apply Frequency Limits button"

	#Clinical Rules (By default, all switches are set to NO)
			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[4]/div[1]/div[1]/div/label[2]/span").click #QA Review Required; switches to YES
				browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[4]/div[2]/div[1]/div/label[2]/span").click #Entry for Multiple Staff; switches to YES
					browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[4]/div[3]/div[1]/div/label[2]/span").click #Entry for Multiple Clients; switches to YES
						browser.find_element(xpath: "//*[@id='services_vue']/div[1]/div[1]/div/label[2]/span").click #Attending Provider Required; switches to YES
						browser.find_element(xpath: "//*[@id='services_vue']/div[2]/div[1]/div/div/div/label[2]/span").click #Provisionally Licensed OK; switches to YES
							browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[4]/div[2]/div[2]/div/label[2]/span").click #Calocus / Locus Required; switches to YES
								browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[4]/div[3]/div[2]/div/label[2]/span").click #Link to PCP or SP; switches to YES
									browser.find_element(xpath: "//*[@id='services_vue']/div[1]/div[2]/div/label[2]/span").click #Note Required; switches to YES
								#If above line is YES, Note Type field appears
									browser.find_element(xpath: "//*[@id='services_vue']/div[2]/div[2]/div/div/div/div[1]/label/span").click #PIE note type
									browser.find_element(xpath: "//*[@id='services_vue']/div[2]/div[2]/div/div/div/div[2]/label/span").click #NB note type
									browser.find_element(xpath: "//*[@id='services_vue']/div[2]/div[2]/div/div/div/div[3]/label/span").click #EM note type
				#Encounter Type (By default, set to "FTF")
					#browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[4]/div[1]/div[2]/div[2]/label/span").click
						#browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[4]/div[1]/div[2]/div[1]/label/span").click

	#Rounding Rules
		#Service Type
			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[5]/div/div[1]/div/div[1]/label/span").click #Unit option
				browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[5]/div/div[1]/div/div[2]/label/span").click #Time option
		#Always Round
			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[5]/div/div[2]/div/div[1]/label/span").click #Up option
				browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[5]/div/div[2]/div/div[2]/label/span").click #Down option

#PROGRAMS - Navigate to the System Configuration page, clicks Programs on left nav, and then click Add Program button
		#Clicks System Config
			browser.find_element(link_text: "System Configuration").click
		#Clicks Programs on left Nav
			browser.find_element(link_text: "Programs").click
		#Clicks Add Program
			browser.find_element(xpath: "/html/body/div/div[2]/div/div[2]/div/div[3]/a").click

	#Fill in Program data to add and save.
		#Entering in data
			browser.find_element(id: "Name").send_keys "AddedByAutomationProgram1" #name
			browser.find_element(id: "Code").send_keys "ZZZ" #Code
				browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[2]/div[2]/div/div/div[1]/div").click #Status drop down
					#NEED TO FIX -----> browser.find_element(css: "/html/body/div/div[2]/div/form/section[1]/div[2]/div[2]/div/div/div[1]/div").click #Selects "Inactive"
						browser.find_element(id: "EffectiveFrom").click #Effective From date
						browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click
							browser.find_element(id: "EffectiveTo").click #Effective To date
							browser.find_element(xpath: "//html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click

		#Program Services
			browser.find_element(link_text: "Select All").click

		#Saves Program
			browser.find_element(xpath: "/html/body/div/div[2]/div/form/div/ul/li[2]/button").click	


#LOCATIONS - Navigate to the System Configuration page, clicks Programs on left nav, and then click Add Program button
		#Clicks System Config
			browser.find_element(link_text: "System Configuration").click
		#Clicks Locations on left Nav
			browser.find_element(link_text: "Locations").click
		#Clicks Add Location
			browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/div/div[3]/a").click

	#Fill in Location data to add and save.
		#Entering in data
			browser.find_element(id: "Name").send_keys "AddedByAutomationLocation1" #name
				browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[1]/div[2]/div/div/div[1]/input").click #Company drop down
					browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(2) > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options.focus.input-active.dropdown-active > input[type='text']").send_keys "Automation Company" #Enters a selection
					browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(2) > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options.focus.input-active.dropdown-active > input[type='text']").send_keys :return #Selects the selection
				
				#Address block

					browser.find_element(id: "Address_Street1").send_keys "306 Tidal Rice Court" #Enters address line 1
					browser.find_element(id: "Address_Street2").send_keys "1234 West Main Ave" #Enters address line 2
						browser.find_element(id: "Address_City").send_keys "Charleston" #Enters city
						browser.find_element(id: "Address_State").send_keys "SC" #Enters state
						browser.find_element(id: "Address_ZipCode").click #Zipcode focus
						browser.find_element(id: "Address_ZipCode").send_keys "123451234" #Enters 9-digit zip code
							
							browser.find_element(id: "PhoneNumber").click #Phone number focus
							browser.find_element(id: "PhoneNumber").send_keys "9997778888" #Enters phone number
							browser.find_element(id: "FaxNumber").click #Fax number focus
							browser.find_element(id: "FaxNumber").send_keys "1112223333" #Enters fax number

								browser.find_element(id: "TinNumber").click #TIN number focus
								browser.find_element(id: "TinNumber").send_keys "000000001" #Enters TIN number

				#Select Location

					browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[2]/div/div/div/div/div[1]/input").click #Add program drop down
						browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(3) > div > div > div > div > div.selectize-input.items.not-full.has-options > input").send_keys "AddedBy" #Enters a selection
							browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(3) > div > div > div > div > div.selectize-input.items.not-full.has-options > input").send_keys :return #Selects the selection

		#Saves Location
			browser.find_element(xpath: "/html/body/div/div[2]/div/form/div/ul/li[2]/button").click	

		#Address validation popup - REMOVED / CHANGED THIS
			#browser.find_element(xpath: "//*[@id='address-selection-vue']/div/div/div/div[3]/button[2]/span").click


#PAYERS - Navigate to the System Configuration page, clicks Programs on left nav, and then click Add Program button
		#Clicks System Config
			browser.find_element(link_text: "System Configuration").click
		#Clicks Payers on left Nav
			browser.find_element(link_text: "Payers").click
		#Clicks Add Payer
			browser.find_element(xpath: "/html/body/div/div[2]/div/div[2]/div/div[3]/a").click

	#Fill in Payer data to add and save.
		#Entering in data
			browser.find_element(id: "Name").send_keys "Automationpayer Lastname1" #name
				browser.find_element(id: "Code").send_keys "0001" #Payer code
					browser.find_element(id: "SenderId").send_keys "001" #Sender ID
						browser.find_element(id: "ReceiverId").send_keys "100" #Receiver ID

				#Address block

					browser.find_element(id: "Address_Street1").send_keys "306 Tidal Rice Court" #Enters address line 1
					browser.find_element(id: "Address_Street2").send_keys "1234 West Main Ave" #Enters address line 2
						browser.find_element(id: "Address_City").send_keys "Charleston" #Enters city
						browser.find_element(id: "Address_State").send_keys "SC" #Enters state
						browser.find_element(id: "Address_ZipCode").click #Zipcode focus
						browser.find_element(id: "Address_ZipCode").send_keys "123451234" #Enters 9-digit zip code

							browser.find_element(id: "Email").send_keys "automated1@email.com"
							browser.find_element(id: "Phone").click #Phone number focus
							browser.find_element(id: "Phone").send_keys "9997778888" #Enters phone number
							browser.find_element(id: "Fax").click #Fax number focus
							browser.find_element(id: "Fax").send_keys "1112223333" #Enters fax number

					browser.find_element(xpath: "//*[@id='form']/section[2]/div[2]/div/div/div/div[1]/input").click #Select Counties drop down
						browser.find_element(css: "#form > section:nth-child(3) > div:nth-child(4) > div > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "alamance" #Enters a selection
						browser.find_element(css: "#form > section:nth-child(3) > div:nth-child(4) > div > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #Selects the selection
				
				#Payer Details
					#Effective From
					#Effective To
					#Payer Type
						browser.find_element(xpath: "//*[@id='form']/section[2]/div[1]/div[4]/div/div").click #Select Form Type drop down
						#browser.find_element(css: "#form > section:nth-child(7) > div:nth-child(2) > div:nth-child(4) > div > div > div.selectize-input.items.full.has-options.has-items").send_keys "alamance" #Enters a selection
						#browser.find_element(css: "#form > section:nth-child(7) > div:nth-child(2) > div:nth-child(4) > div > div > div.selectize-input.items.full.has-options.has-items").send_keys :return #Selects the selection


		#Saves Payer
			browser.find_element(xpath: "//*[@id='form']/div[2]/ul/li[3]/button").click	
			#Uncomment for "Save and Add another" button click
				#browser.find_element(xpath: "//*[@id='form'']/div[2]/ul/li[3]/button").click

		#Address validation popup - REMOVED / CHANGED THIS
			#browser.find_element(xpath: "//*[@id='address-selection-vue']/div[1]/div/div/div[3]/button[2]/span").click


#COST CENTERS - Navigate to the System Configuration page, clicks Cost Centers on left nav, and then click Add Program button
		#Clicks System Config
			browser.find_element(link_text: "System Configuration").click
		#Clicks Cost Centers on left Nav
			browser.find_element(link_text: "Cost Centers").click
		#Clicks Add Cost Center
			browser.find_element(xpath: "/html/body/div/div[2]/div/div[2]/div/div[3]/a").click

	#Fill in Cost Center data to add and save.
		#Entering in data
			browser.find_element(id: "Code").send_keys "0001" #Cost center ID code
				browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[1]/div[2]/div/div/div[1]/input").click #Company drop down
						browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(2) > div.form-container.col-sm-5 > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "Automation Company" #Enters a selection
						browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(2) > div.form-container.col-sm-5 > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #Selects the selection
				browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[1]/div[3]/div/div/div[1]/input").click #Region drop down
						browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(2) > div.form-container.col-sm-4 > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "region 1" #Enters a selection
						browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(2) > div.form-container.col-sm-4 > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #Selects the selection
							
							#browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/section[1]/div[2]/div[1]/div/div/div[1]/div").click


							browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[2]/div[1]/div/div/div[1]").click #Status drop down
								browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(3) > div:nth-child(1) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "Active" #Enters a selection
								browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(3) > div:nth-child(1) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #Selects the selection
							
							#browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/section[1]/div[2]/div[1]/div/div/div[1]/input").send_keys :arrow_down #status drop down
								#browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/section[1]/div[2]/div[1]/div/div/div[1]/input").send_keys :return

							browser.find_element(id: "Effective_From").click #Effective from calendar
								browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click #Chooses today
							browser.find_element(id: "Effective_To").click
								browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click #Chooses today

							browser.find_element(id: "Director").send_keys "Automationdirector"

							browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/section[2]/div/div/div/div/div[1]/input").click #Location drop down
								browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/section[2]/div/div/div/div/div[1]/input").send_keys "AddedBy" #enters a selection
								browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/section[2]/div/div/div/div/div[1]/input").send_keys :return #selects the selection
							
							browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/section[3]/div[1]/div/div/div/div[1]/input").click #Programs drop down
								browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/section[3]/div[1]/div/div/div/div[1]/input").send_keys "AddedBy" #enters a selection
								browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/section[3]/div[1]/div/div/div/div[1]/input").send_keys :return #selects the selection	

								#Saves
									browser.find_element(xpath: "//*[@id='location-data']/div/ul/li[2]/button").click	


#NPI PROVIDER - Navigate to the System Configuration page, clicks NPI on left nav, and then click Add NPI button
		#Clicks System Config
			browser.find_element(link_text: "System Configuration").click
		#Clicks NPI Management on left Nav
			browser.find_element(link_text: "NPI Management").click
		#Clicks Add NPI
			browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/div/div[3]/a").click

	#Fill in provider NPI number data to add and save.
		#Entering in data

			browser.find_element(id: "Number").click #NPI number field
			browser.find_element(id: "Number").send_keys "1000000000" #Enters 10 digit NPI number
		#Selects NPI number type
			browser.find_element(xpath: "//*[@id='npi-form']/section/section/div/div[2]/div/div/div[1]/input").click #NPI type drop down
				browser.find_element(css: "#npi-form > section > section > div > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "Provider" #enters a selection
					browser.find_element(css: "#npi-form > section > section > div > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
						
						browser.find_element(id: "EffectiveDates_From").click #Effective From date
						browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click
							browser.find_element(id: "EffectiveDates_To").click #Effective To date
							browser.find_element(xpath: "//html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click

		#Add Taxonomies
			browser.find_element(id: "VueTaxonomy_Number").click #9 digit + letter NPI number
			browser.find_element(id: "VueTaxonomy_Number").send_keys "1000000000a" #Enter NPI number
						browser.find_element(id: "VueTaxonomy_EffectiveDates_From").click #Effective From date
						browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click
							browser.find_element(id: "VueTaxonomy_EffectiveDates_To").click #Effective To date
								browser.find_element(xpath: "//html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click
								
								browser.find_element(xpath: "//*[@id='npi-form']/section[1]/section/rha-taxonomies/section/div/div/div[2]/div/a").click  #Apply Taxonomy button

		#Provider Information
			browser.find_element(xpath: "//*[@id='provider-section']/div[1]/div[1]/div/div/div[1]/input").click #Name drop down
				browser.find_element(css: "#provider-section > div:nth-child(2) > div.form-container.col-md-4.col-sm-6 > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "Basic" #enters a selection
					browser.find_element(css: "#provider-section > div:nth-child(2) > div.form-container.col-md-4.col-sm-6 > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
				
				browser.find_element(id: "ProviderInputs_DeaNumber").send_keys "0001" #DEA number
					
					browser.find_element(id: "ProviderInputs_TaxId").click #Tax ID field
						browser.find_element(id: "ProviderInputs_TaxId").send_keys "100000000" #Enters 9 digit Tax ID number
						
						browser.find_element(id: "ProviderInputs_EmploymentDates_From").click #Effective From date
						browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click
							browser.find_element(id: "ProviderInputs_EmploymentDates_To").click #Effective To date
								browser.find_element(xpath: "//html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click

				#Address block

					browser.find_element(id: "ProviderInputs_ProviderAddress_Street1").send_keys "306 Tidal Rice Court" #Enters address line 1
					browser.find_element(id: "ProviderInputs_ProviderAddress_Street2").send_keys "1234 West Main Ave" #Enters address line 2
						browser.find_element(id: "ProviderInputs_ProviderAddress_City").send_keys "Charleston" #Enters city
						browser.find_element(id: "ProviderInputs_ProviderAddress_State").click #State field
							browser.find_element(id: "ProviderInputs_ProviderAddress_State").send_keys "SC" #Enters state
						browser.find_element(id: "ProviderInputs_ProviderAddress_ZipCode").click #Zipcode focus
						browser.find_element(id: "ProviderInputs_ProviderAddress_ZipCode").send_keys "123451234" #Enters 9-digit zip code
		#Add License
			browser.find_element(id: "VueLicense_Number").click #10 digit license number field
			browser.find_element(id: "VueLicense_Number").send_keys "1000000000" #10 digit license number field
			browser.find_element(xpath: "//*[@id='provider-section']/rha-licenses/section/div/div/div[1]/div[2]/div/div/div[1]/input").click #License type drop down
				browser.find_element(css: "#provider-section > rha-licenses > section > div > div > div:nth-child(2) > div.form-container.col-lg-4.col-md-5.col-sm-6 > div > div > div.selectize-input.items.not-full.has-options > input").send_keys "Family nurse practitioner" #enters a selection
					browser.find_element(css: "#provider-section > rha-licenses > section > div > div > div:nth-child(2) > div.form-container.col-lg-4.col-md-5.col-sm-6 > div > div > div.selectize-input.items.not-full.has-options > input").send_keys :return #selects the selection
						
						browser.find_element(id: "VueLicense_EffectiveDates_From").click #Effective From date
						browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click
							browser.find_element(id: "VueLicense_EffectiveDates_To").click #Effective To date
								browser.find_element(xpath: "//html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click

								browser.find_element(xpath: "//*[@id='provider-section']/rha-licenses/section/div/div/div[2]/div/a").click

		#Add Confirmed Payers
			browser.find_element(xpath: "//*[@id='provider-section']/rha-payers/section/div/div/div[1]/div[1]/div/div/div[1]").click #Confirmed payers type drop down
				browser.find_element(css: "#provider-section > rha-payers > section > div > div > div:nth-child(2) > div.form-container.col-sm-6 > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "Automationpayer Lastname" #enters a selection
					browser.find_element(css: "#provider-section > rha-payers > section > div > div > div:nth-child(2) > div.form-container.col-sm-6 > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
				
						browser.find_element(id: "VuePayer_EffectiveDates_From").click #Effective From date
						browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click
							browser.find_element(id: "VuePayer_EffectiveDates_To").click #Effective To date
								browser.find_element(xpath: "//html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click

								browser.find_element(xpath: "//*[@id='provider-section']/rha-payers/section/div/div/div[2]/div/a").click #Add Payer button
				#Saves
					browser.find_element(xpath: "//*[@id='npi-form']/div/ul/li[2]/button").click
						#browser.find_element(xpath: "//*[@id='address-selection-vue']/div/div/div/div[3]/button[2]/span").click #Address validation


#NPI REFERRAL - Navigate to the System Configuration page, clicks NPI on left nav, and then click Add NPI button
		#Clicks System Config
			browser.find_element(link_text: "System Configuration").click
		#Clicks NPI Management on left Nav
			browser.find_element(link_text: "NPI Management").click
		#Clicks Add Program
			browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/div/div[3]/a").click

	#Fill in Referral NPI number data to add and save.
		
		#Entering in data
			browser.find_element(id: "Number").click #NPI number field
			browser.find_element(id: "Number").send_keys "2000000000" #Enters 10 digit NPI number
		#Selects NPI number type
			browser.find_element(xpath: "//*[@id='npi-form']/section/section/div/div[2]/div/div/div[1]/input").click #NPI type drop down
				browser.find_element(css: "#npi-form > section > section > div > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "Referral" #enters a selection
					browser.find_element(css: "#npi-form > section > section > div > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
						
						browser.find_element(id: "EffectiveDates_From").click #Effective From date
						browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click
							browser.find_element(id: "EffectiveDates_To").click #Effective To date
							browser.find_element(xpath: "//html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click

		#Add Taxonomies
			browser.find_element(id: "VueTaxonomy_Number").click #9 digit + letter NPI number
			browser.find_element(id: "VueTaxonomy_Number").send_keys "2000000000a" #Enter NPI number
						browser.find_element(id: "VueTaxonomy_EffectiveDates_From").click #Effective From date
						browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click
							browser.find_element(id: "VueTaxonomy_EffectiveDates_To").click #Effective To date
								browser.find_element(xpath: "//html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click
								
								browser.find_element(xpath: "//*[@id='npi-form']/section[1]/section/rha-taxonomies/section/div/div/div[2]/div/a").click  #Apply Taxonomy button

		#Referral Information
			browser.find_element(id: "ReferralInputs_Name").send_keys "Referralautomation Lastname"
				
				#Address block
					browser.find_element(id: "ReferralInputs_Address_Street1").send_keys "306 Tidal Rice Court" #Enters address line 1
					browser.find_element(id: "ReferralInputs_Address_Street2").send_keys "1234 West Main Ave" #Enters address line 2
						browser.find_element(id: "ReferralInputs_Address_City").send_keys "Charleston" #Enters city
						browser.find_element(id: "ReferralInputs_Address_State").click #State field
							browser.find_element(id: "ReferralInputs_Address_State").send_keys "SC" #Enters state
						browser.find_element(id: "ReferralInputs_Address_ZipCode").click #Zipcode focus
						browser.find_element(id: "ReferralInputs_Address_ZipCode").send_keys "123451234" #Enters 9-digit zip code

							browser.find_element(id: "ReferralInputs_PhoneNumber").click #Phone number focus
								browser.find_element(id: "ReferralInputs_PhoneNumber").send_keys "9997778888" #Enters phone number
							browser.find_element(id: "ReferralInputs_FaxNumber").click #Fax number focus
								browser.find_element(id: "ReferralInputs_FaxNumber").send_keys "1112223333" #Enters fax number

				#Saves
					browser.find_element(xpath: "//*[@id='npi-form']/div/ul/li[2]/button").click
						#browser.find_element(xpath: "//*[@id='address-selection-vue']/div/div/div/div[3]/button[2]/span").click #Address validation


#NPI FACILITY - Navigate to the System Configuration page, clicks NPI on left nav, and then click Add NPI button
		#Clicks System Config
			browser.find_element(link_text: "System Configuration").click
		#Clicks NPI Management on left Nav
			browser.find_element(link_text: "NPI Management").click
		#Clicks Add Program
			browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/div/div[3]/a").click

	#Fill in Referral NPI number data to add and save.
		
		#Entering in data
			browser.find_element(id: "Number").click #NPI number field
			browser.find_element(id: "Number").send_keys "2000000000" #Enters 10 digit NPI number
		#Selects NPI number type
			browser.find_element(xpath: "//*[@id='npi-form']/section/section/div/div[2]/div/div/div[1]/input").click #NPI type drop down
				browser.find_element(css: "#npi-form > section > section > div > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "Facility" #enters a selection
					browser.find_element(css: "#npi-form > section > section > div > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
						
						browser.find_element(id: "EffectiveDates_From").click #Effective From date
						browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click
							browser.find_element(id: "EffectiveDates_To").click #Effective To date
							browser.find_element(xpath: "//html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click

		#Add Taxonomies
			browser.find_element(id: "VueTaxonomy_Number").click #9 digit + letter NPI number
			browser.find_element(id: "VueTaxonomy_Number").send_keys "2000000000a" #Enter NPI number
						browser.find_element(id: "VueTaxonomy_EffectiveDates_From").click #Effective From date
						browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click
							browser.find_element(id: "VueTaxonomy_EffectiveDates_To").click #Effective To date
								browser.find_element(xpath: "//html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click
								
								browser.find_element(xpath: "//*[@id='npi-form']/section[1]/section/rha-taxonomies/section/div/div/div[2]/div/a").click  #Apply Taxonomy button

		#Facility Information
			browser.find_element(xpath: "//*[@id='facility-section']/div[1]/div/div/div/div[1]/input").click #Locations type drop down
				browser.find_element(css: "#facility-section > div:nth-child(2) > div > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "ARP" #enters a selection
					browser.find_element(css: "#facility-section > div:nth-child(2) > div > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
				#Select All for Services
					browser.find_element(link_text: "Select All").click		

				#Saves
					browser.find_element(xpath: "//*[@id='npi-form']/div/ul/li[2]/button").click

#CONTRACTS - Navigate to the System Configuration page, clicks Services on left nav, and then click Add Service button
		#Clicks System Config
			browser.find_element(link_text: "System Configuration").click
		#Clicks Services on left Nav
			browser.find_element(link_text: "Contracts").click
		#Clicks Add Service
			browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/div/div[3]/a").click

		#Fill in Contract data
			browser.find_element(id: "Name").send_keys "AddedByAutomationContract1" #name
				browser.find_element(id: "Code").send_keys "aaaab"
					browser.find_element(id: "OverrideSenderId").send_keys "1000"
					browser.find_element(id: "OverrideReceiverId").send_keys "2000"
						browser.find_element(id: "MaxAnnualLimit").click #Max annual limit 
							browser.find_element(id: "MaxAnnualLimit").send_keys "25000" #Enters Max annual limit 
						browser.find_element(id: "StateAnnualLimit").click #State annual limit
							browser.find_element(id: "StateAnnualLimit").send_keys "5000" #Enters State annual limit
								browser.find_element(id: "EffectiveDates_From").click #Effective From date
									browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click
								browser.find_element(id: "EffectiveDates_To").click #Effective To date
									browser.find_element(xpath: "//html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click
			#Payer
				browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/section[1]/div[3]/div[1]/div/div/div[1]/input").click #Payer drop down
					browser.find_element(css: "body > div.page-container > div.page-content > div > form > section:nth-child(2) > div:nth-child(3) > div:nth-child(1) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "Payerautomation Lastname" #enters a selection
						browser.find_element(css: "body > div.page-container > div.page-content > div > form > section:nth-child(2) > div:nth-child(3) > div:nth-child(1) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
			#Company
				browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/section[1]/div[3]/div[2]/div/div/div[1]/input").click #Company drop down
					browser.find_element(css: "body > div.page-container > div.page-content > div > form > section:nth-child(2) > div:nth-child(3) > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "Automation Company" #enters a selection
						browser.find_element(css: "body > div.page-container > div.page-content > div > form > section:nth-child(2) > div:nth-child(3) > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
			#Rate Group
				browser.find_element(id: "RateGroupName").send_keys "Automated Rate Group" #Enters rate group name
					browser.find_element(id: "add-rateGroup").click 
					sleep(2)

				#Available Locations
					browser.find_element(xpath: "//*/section[1]/div[1]/div[1]/div/div/div[1]/input").click #Available locations drop down
					browser.find_element(xpath: "//*/section[1]/div[1]/div[1]/div/div/div[1]/input").send_keys "AddedByAutomationLocation1" #enters a selection
					browser.find_element(xpath: "//*/section[1]/div[1]/div[1]/div/div/div[1]/input").send_keys :return #selects the selection
						browser.find_element(xpath: "//*/section[1]/div[1]/div[2]/span/button").click
=begin
							To get additonal Rate Groups, use this xpath and increment the div number (this one is set for a second rate group. //*[@id="rate-group-tabs-content"]/div[2]/section[1]/div[1]/div[1]/div/div/div[1]
							How to find this xpath: Delete the Rate Group GUID (locate the "id = <rate group-guid>", and then find the xpath of the field again.
=end
				#Available Services
				sleep(2)
					browser.find_element(xpath: "//*[@id='rate-group-tabs-content']/div/section[2]/div[1]/div[1]/div/div/div[1]/input").click #Available services drop down
					browser.find_element(xpath: "//*[@id='rate-group-tabs-content']/div/section[2]/div[1]/div[1]/div/div/div[1]/input").send_keys "hcpcsauto" #enters a selection
					browser.find_element(xpath: "//*[@id='rate-group-tabs-content']/div/section[2]/div[1]/div[1]/div/div/div[1]/input").send_keys :return #selects the selection
						browser.find_element(xpath: "//*/section[2]/div[1]/div[2]/button").click
					
				sleep(2)
				#Expected amount
					browser.find_element(xpath: "//*/section[2]/div[2]/div/div/table/tbody/tr/td[3]/input").click
						browser.find_element(xpath: "//*/section[2]/div[2]/div/div/table/tbody/tr/td[3]/input").send_keys "500"

					#Saves Contract
						browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div[2]/ul/li[3]/button").click

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


