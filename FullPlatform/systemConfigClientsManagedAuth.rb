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

#SYSTEM CONFIGURATION

#UDO LIST - Clinical Goals - Navigate to the System Configuration page, clicks UDO List on left nav, and then clicks Clinical Goals link

		#Clicks System Config
			browser.find_element(link_text: "System Configuration").click
		#Clicks Services on left Nav
			browser.find_element(link_text: "UDO List").click
		#Clicks Add Service
			browser.find_element(link_text: "Clinical Goals").click

			#Add company
				browser.find_element(id: "ItemInput_Name").send_keys "Automation Goals"

				#Saves
					browser.find_element(xpath: "//*[@id='udl-form']/div[2]/div/button").click 

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

#UDO LIST - Service Category - Navigate to the System Configuration page, clicks UDO List on left nav, and then clicks Service Categories' link
		#Clicks System Config
			browser.find_element(link_text: "System Configuration").click
		#Clicks Services on left Nav
			browser.find_element(link_text: "UDO List").click
		#Clicks Add Service
			browser.find_element(link_text: "Service Categories").click

			#Add company
				browser.find_element(id: "ItemInput_Name").send_keys "Automation Service"

				#Saves
					browser.find_element(xpath: "//*[@id='udl-form']/div[2]/div/button").click

#UDO LIST - Service Category - Navigate to the System Configuration page, clicks UDO List on left nav, and then clicks Ethnic Origins link
		#Clicks System Config
			browser.find_element(link_text: "System Configuration").click
		#Clicks Services on left Nav
			browser.find_element(link_text: "UDO List").click
		#Clicks Add Service
			browser.find_element(link_text: "Ethnic Origins").click

			#Add company
				browser.find_element(id: "ItemInput_Name").send_keys "Automation Ethnic Origin1"

				#Saves
					browser.find_element(xpath: "//*[@id='udl-form']/div[2]/div/button").click 

#UDO LIST - Service Category - Navigate to the System Configuration page, clicks UDO List on left nav, and then clicks Languages link
		#Clicks System Config
			browser.find_element(link_text: "System Configuration").click
		#Clicks Services on left Nav
			browser.find_element(link_text: "UDO List").click
		#Clicks Add Service
			browser.find_element(link_text: "Languages").click

			#Add company
				browser.find_element(id: "ItemInput_Name").send_keys "Automation Language1"

				#Saves
					browser.find_element(xpath: "//*[@id='udl-form']/div[2]/div/button").click 

#UDO LIST - Service Category - Navigate to the System Configuration page, clicks UDO List on left nav, and then clicks Race link
		#Clicks System Config
			browser.find_element(link_text: "System Configuration").click
		#Clicks Services on left Nav
			browser.find_element(link_text: "UDO List").click
		#Clicks Add Service
			browser.find_element(link_text: "Places of Service").click

			#Add company
				browser.find_element(id: "ItemInput_Name").send_keys "Automation Place1"

				#Saves
					browser.find_element(xpath: "//*[@id='udl-form']/div[2]/div/button").click

#UDO LIST - Service Category - Navigate to the System Configuration page, clicks UDO List on left nav, and then clicks Race link
		#Clicks System Config
			browser.find_element(link_text: "System Configuration").click
		#Clicks Services on left Nav
			browser.find_element(link_text: "UDO List").click
		#Clicks Add Service
			browser.find_element(link_text: "Races").click

			#Add company
				browser.find_element(id: "ItemInput_Name").send_keys "Automation Race1"

				#Saves
					browser.find_element(xpath: "//*[@id='udl-form']/div[2]/div/button").click 

#UDO LIST - Service Category - Navigate to the System Configuration page, clicks UDO List on left nav, and then clicks Relationships link
		#Clicks System Config
			browser.find_element(link_text: "System Configuration").click
		#Clicks Services on left Nav
			browser.find_element(link_text: "UDO List").click
		#Clicks Add Service
			browser.find_element(link_text: "Relationships").click

			#Add company
				browser.find_element(id: "ItemInput_Name").send_keys "Automation Relationship1"

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
				browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(1) > div.form-container.col-sm-4 > div > div > div.selectize-input.items.not-full.has-options > input").send_keys "Automation Service" #enters a selection
					browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(1) > div.form-container.col-sm-4 > div > div > div.selectize-input.items.not-full.has-options > input").send_keys :return #selects the selection
		
			#Need to double click for field focus on this field.
			browser.find_element(id: "ServiceModel_UsualCharge").click #Field focus usual charge amount
			browser.find_element(id: "ServiceModel_UsualCharge").click #Field focus usual charge amount
				browser.find_element(id: "ServiceModel_UsualCharge").send_keys "500" #enters usual charge amount
			browser.find_element(id: "ServiceModel_HCPCS").send_keys "HCPCSauto" #HCPCS field
			browser.find_element(id: "ServiceModel_Modifier").send_keys "Modauto" #Modifier field
			browser.find_element(id: "ServiceModel_Effective_To").click
				browser.find_element(id: "ServiceModel_Effective_To").send_keys "12/30/2020"
				#browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click #Chooses today
			browser.find_element(id: "ServiceModel_Effective_From").click #Effective from calendar
				browser.find_element(id: "ServiceModel_Effective_From").send_keys "01/01/2015"
				#browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click #Chooses today
			
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
			#browser.find_element(id: "billing-limits").click #Puts focus a field
			
			browser.find_element(id: "billing-limits").click #Field focus for billing frequencies
			browser.find_element(id: "billing-limits").click #Field focus for billing frequencies
				browser.find_element(id: "billing-limits").send_keys "14" #enters a selection
					#browser.find_element(id: "billing-limits").send_keys :return #selects the selection
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
			#browser.find_element(xpath: "//*[@id='bundling_vue']/div[1]/div[2]/div[2]/label/span").click #Sets to "Unmanaged" which lights up "Allow Bundle Authorizations"
				#Allow Bundled Authorization switch - By default, it's NO - Comment the below line out if wanting to keep NO selected
					#browser.find_element(xpath: "//*[@id='bundling_vue']/div[2]/div[2]/div/div/label[2]/span").click #Switches "Allow Bundled Authorization" to YES

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

			#Saves the Service
				browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div/ul/li[2]/button").click

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
				#browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[2]/div[2]/div/div/div[1]/div").click #Status drop down
					#NEED TO FIX -----> browser.find_element(css: "/html/body/div/div[2]/div/form/section[1]/div[2]/div[2]/div/div/div[1]/div").click #Selects "Inactive"
						
					browser.find_element(id: "EffectiveTo").click #Effective To date
					browser.find_element(id: "EffectiveTo").send_keys "03/30/2020"
					#browser.find_element(xpath: "//html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click
						browser.find_element(id: "EffectiveFrom").click #Effective From date
						browser.find_element(id: "EffectiveFrom").send_keys "01/01/2015"
						#browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click


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
			browser.find_element(xpath: "//*[@id='address-selection-vue']/div/div/div/div[3]/button[2]/span").click


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

					#Effective To
						browser.find_element(id: "EffectiveTo").click
							browser.find_element(id: "EffectiveTo").send_keys "12/25/2015"

					#Effective From
						browser.find_element(id: "EffectiveFrom").click
							browser.find_element(id: "EffectiveFrom").send_keys "02/13/2015"

					#Payer Type
						browser.find_element(xpath: "//*[@id='form']/section[2]/div[1]/div[4]/div/div").click #Select Form Type drop down
						#browser.find_element(css: "#form > section:nth-child(7) > div:nth-child(2) > div:nth-child(4) > div > div > div.selectize-input.items.full.has-options.has-items").send_keys "alamance" #Enters a selection
						#browser.find_element(css: "#form > section:nth-child(7) > div:nth-child(2) > div:nth-child(4) > div > div > div.selectize-input.items.full.has-options.has-items").send_keys :return #Selects the selection


		#Saves Payer
			browser.find_element(xpath: "//*[@id='form']/div[2]/ul/li[3]/button").click	
			#Uncomment for "Save and Add another" button click
				#browser.find_element(xpath: "//*[@id='form'']/div[2]/ul/li[3]/button").click

		#Address validation popup 
			browser.find_element(xpath: "//*[@id='address-selection-vue']/div[1]/div/div/div[3]/button[2]/span").click


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

							browser.find_element(id: "Effective_To").click
								browser.find_element(id: "Effective_To").send_keys "03/30/2020"
								#browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click #Chooses today
							browser.find_element(id: "Effective_From").click #Effective from calendar
								browser.find_element(id: "Effective_From").send_keys "01/01/2015"
								#browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click #Chooses today

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
						
					browser.find_element(id: "EffectiveDates_To").click #Effective To date
					browser.find_element(id: "EffectiveDates_To").send_keys "03/30/2020"
					#browser.find_element(xpath: "//html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click
						browser.find_element(id: "EffectiveDates_From").click #Effective From date
						browser.find_element(id: "EffectiveDates_From").send_keys "01/01/2015"
						#browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click


		#Add Taxonomies
			browser.find_element(id: "VueTaxonomy_Number").click #9 digit + letter NPI number
			browser.find_element(id: "VueTaxonomy_Number").send_keys "1000000000a" #Enter NPI number
						
					browser.find_element(id: "VueTaxonomy_EffectiveDates_To").click #Effective To date
					browser.find_element(id: "VueTaxonomy_EffectiveDates_To").send_keys "03/30/2020"	
					#browser.find_element(xpath: "//html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click
						browser.find_element(id: "VueTaxonomy_EffectiveDates_From").click #Effective From date
						browser.find_element(id: "VueTaxonomy_EffectiveDates_From").send_keys "01/01/2015"
						#browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click
								
								browser.find_element(xpath: "//*[@id='npi-form']/section[1]/section/rha-taxonomies/section/div/div/div[2]/div/a").click  #Apply Taxonomy button

		#Provider Information
			browser.find_element(xpath: "//*[@id='provider-section']/div[1]/div[1]/div/div/div[1]/input").click #Name drop down
				browser.find_element(css: "#provider-section > div:nth-child(2) > div.form-container.col-md-4.col-sm-6 > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "Admin" #enters a selection
					browser.find_element(css: "#provider-section > div:nth-child(2) > div.form-container.col-md-4.col-sm-6 > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
				
				browser.find_element(id: "ProviderInputs_DeaNumber").send_keys "0001" #DEA number
					
					browser.find_element(id: "ProviderInputs_TaxId").click #Tax ID field
						browser.find_element(id: "ProviderInputs_TaxId").send_keys "100000000" #Enters 9 digit Tax ID number
						
					browser.find_element(id: "ProviderInputs_EmploymentDates_To").click #Effective To date
					browser.find_element(id: "ProviderInputs_EmploymentDates_To").send_keys "03/30/2020"
					#browser.find_element(xpath: "//html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click
						browser.find_element(id: "ProviderInputs_EmploymentDates_From").click #Effective From date
						browser.find_element(id: "ProviderInputs_EmploymentDates_From").send_keys "01/01/2015"
						#browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click


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
						
					browser.find_element(id: "VueLicense_EffectiveDates_To").click #Effective To date
					browser.find_element(id: "VueLicense_EffectiveDates_To").send_keys "03/30/2020"
					#browser.find_element(xpath: "//html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click
						browser.find_element(id: "VueLicense_EffectiveDates_From").click #Effective From date
						browser.find_element(id: "VueLicense_EffectiveDates_From").send_keys "01/01/2015"
						#browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click


								browser.find_element(xpath: "//*[@id='provider-section']/rha-licenses/section/div/div/div[2]/div/a").click

		#Add Confirmed Payers
			browser.find_element(xpath: "//*[@id='provider-section']/rha-payers/section/div/div/div[1]/div[1]/div/div/div[1]").click #Confirmed payers type drop down
				browser.find_element(css: "#provider-section > rha-payers > section > div > div > div:nth-child(2) > div.form-container.col-sm-6 > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "Automationpayer Lastname" #enters a selection
					browser.find_element(css: "#provider-section > rha-payers > section > div > div > div:nth-child(2) > div.form-container.col-sm-6 > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
											
					browser.find_element(id: "VuePayer_EffectiveDates_To").click #Effective To date
					browser.find_element(id: "VuePayer_EffectiveDates_To").send_keys "03/30/2020"
					#browser.find_element(xpath: "//html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click
						browser.find_element(id: "VuePayer_EffectiveDates_From").click #Effective From date
						browser.find_element(id: "VuePayer_EffectiveDates_From").send_keys "01/01/2015"
						#browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click


								browser.find_element(xpath: "//*[@id='provider-section']/rha-payers/section/div/div/div[2]/div/a").click #Add Payer button
				#Saves
					browser.find_element(xpath: "//*[@id='npi-form']/div/ul/li[2]/button").click
						browser.find_element(xpath: "//*[@id='address-selection-vue']/div/div/div/div[3]/button[2]/span").click #Address validation


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
						
					browser.find_element(id: "EffectiveDates_To").click #Effective To date
					browser.find_element(id: "EffectiveDates_To").send_keys "03/30/2020"
					#browser.find_element(xpath: "//html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click
						browser.find_element(id: "EffectiveDates_From").click #Effective From date
						browser.find_element(id: "EffectiveDates_From").send_keys "01/01/2015"
						#browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click


		#Add Taxonomies
			browser.find_element(id: "VueTaxonomy_Number").click #9 digit + letter NPI number
			browser.find_element(id: "VueTaxonomy_Number").send_keys "2000000000a" #Enter NPI number
						
					browser.find_element(id: "VueTaxonomy_EffectiveDates_To").click #Effective To date
					browser.find_element(id: "VueTaxonomy_EffectiveDates_To").send_keys "03/30/2020"
					#browser.find_element(xpath: "//html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click
						browser.find_element(id: "VueTaxonomy_EffectiveDates_From").click #Effective From date
						browser.find_element(id: "VueTaxonomy_EffectiveDates_From").send_keys "01/01/2015"
						#browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click

								
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
						browser.find_element(xpath: "//*[@id='address-selection-vue']/div/div/div/div[3]/button[2]/span").click #Address validation


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
			browser.find_element(id: "Number").send_keys "3000000000" #Enters 10 digit NPI number
		#Selects NPI number type
			browser.find_element(xpath: "//*[@id='npi-form']/section/section/div/div[2]/div/div/div[1]/input").click #NPI type drop down
				browser.find_element(css: "#npi-form > section > section > div > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "Facility" #enters a selection
					browser.find_element(css: "#npi-form > section > section > div > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
						
					browser.find_element(id: "EffectiveDates_To").click #Effective To date
					browser.find_element(id: "EffectiveDates_To").send_keys "03/30/2020"
					#browser.find_element(xpath: "//html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click
						browser.find_element(id: "EffectiveDates_From").click #Effective From date
						browser.find_element(id: "EffectiveDates_From").send_keys "01/01/2015"
						#browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click


		#Add Taxonomies
			browser.find_element(id: "VueTaxonomy_Number").click #9 digit + letter NPI number
			browser.find_element(id: "VueTaxonomy_Number").send_keys "2000000000a" #Enter NPI number
						
					browser.find_element(id: "VueTaxonomy_EffectiveDates_To").click #Effective To date
					browser.find_element(id: "VueTaxonomy_EffectiveDates_To").send_keys "03/30/2020"
					#browser.find_element(xpath: "//html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click
						browser.find_element(id: "VueTaxonomy_EffectiveDates_From").click #Effective From date
						browser.find_element(id: "VueTaxonomy_EffectiveDates_From").send_keys "01/01/2015"
						#browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click

								
								browser.find_element(xpath: "//*[@id='npi-form']/section[1]/section/rha-taxonomies/section/div/div/div[2]/div/a").click  #Apply Taxonomy button

		#Facility Information
			browser.find_element(xpath: "//*[@id='facility-section']/div[1]/div/div/div/div[1]/input").click #Locations type drop down
				browser.find_element(css: "#facility-section > div:nth-child(2) > div > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "AddedByAutomationLocation1" #enters a selection
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
								
								browser.find_element(id: "EffectiveDates_To").click #Effective To date
									browser.find_element(id: "EffectiveDates_To").send_keys "03/30/2020"
									#browser.find_element(xpath: "//html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click
								browser.find_element(id: "EffectiveDates_From").click #Effective From date
									browser.find_element(id: "EffectiveDates_From").send_keys "01/01/2015"
									#browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click

			#Company
				browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/section[1]/div[3]/div[1]/div/div/div[1]/input").click #Company drop down
					browser.find_element(css: "body > div.page-container > div.page-content > div > form > section:nth-child(2) > div:nth-child(3) > div.form-container.col-sm-6.col-md-4 > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "Automation Company" #enters a selection
						browser.find_element(css: "body > div.page-container > div.page-content > div > form > section:nth-child(2) > div:nth-child(3) > div.form-container.col-sm-6.col-md-4 > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
			
			#Payer
				browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/section[1]/div[3]/div[2]/div/div/div[1]/input").click #Payer drop down
					browser.find_element(css: "body > div.page-container > div.page-content > div > form > section:nth-child(2) > div:nth-child(3) > div.form-container.col-sm-6.col-md-3 > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "Automationpayer Lastname1" #enters a selection
						browser.find_element(css: "body > div.page-container > div.page-content > div > form > section:nth-child(2) > div:nth-child(3) > div.form-container.col-sm-6.col-md-3 > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection

			#MCO Funded option buttons
				browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/section[1]/div[3]/rha-mco-funding/div[1]/div/div[2]/label/span").click
				#Type of MCO funding
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/section[1]/div[3]/rha-mco-funding/div[2]/div/div/div[1]/label/span").click

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
				sleep(1)
					browser.find_element(xpath: "//*[@id='rate-group-tabs-content']/div/section[2]/div[1]/div[1]/div/div/div[1]/input").click #Available services drop down
					browser.find_element(xpath: "//*[@id='rate-group-tabs-content']/div/section[2]/div[1]/div[1]/div/div/div[1]/input").send_keys "hcpcsauto" #enters a selection
					browser.find_element(xpath: "//*[@id='rate-group-tabs-content']/div/section[2]/div[1]/div[1]/div/div/div[1]/input").send_keys :return #selects the selection
						browser.find_element(xpath: "//*/section[2]/div[1]/div[2]/button").click
					
				sleep(1)
				#Expected amount
					#browser.find_element(xpath: "//*/section[2]/div[2]/div/div/table/tbody/tr/td[3]/input").click
						browser.find_element(xpath: "//*/section[2]/div[2]/div/div/table/tbody/tr/td[3]/input").send_keys "500"

					#Saves Contract
						browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div[2]/ul/li[3]/button").click

#CLIENTS AREA

#Navigate to the Client's page - Adds Client
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
			browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[1]/div[3]/div[1]/div/div/div[1]/input").click #Gender drop down
				browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(4) > div:nth-child(1) > div > div > div.selectize-input.items.not-full.has-options > input").send_keys "Female" #enters a selection
					browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(4) > div:nth-child(1) > div > div > div.selectize-input.items.not-full.has-options > input").send_keys :return #selects the selection
			
			browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[1]/div[3]/div[2]/div/div/div[1]/input").click #Race1 drop down
				browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(4) > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "Automation Race1" #enters a selection
					browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(4) > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
			
			browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[1]/div[3]/div[3]/div/div/div[1]/input").click #Race2 drop down
				browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(4) > div:nth-child(3) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "Automation1 Race1" #enters a selection
					browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(4) > div:nth-child(3) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
			
			browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[1]/div[4]/div[1]/div/div/div[1]/input").click #Ethnic Origin drop down
				browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(5) > div:nth-child(1) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "Automation Ethnic Origin1" #enters a selection
					browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(5) > div:nth-child(1) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
			
			browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[1]/div[4]/div[2]/div/div/div[1]/input").click #County of Origin drop down
				browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(5) > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "Alamance" #enters a selection
					browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(5) > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
			
			browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[1]/div[5]/div[1]/div/div/div[1]/input").click #Primary Language drop down
				browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(6) > div:nth-child(1) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "Automation Language1" #enters a selection
					browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(6) > div:nth-child(1) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
			
			browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[1]/div[5]/div[2]/div/div/div[1]/input").click #Secondary Language drop down
				browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(6) > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "Automation Language1" #enters a selection
					browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(6) > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
			
			browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[1]/div[5]/div[3]/div/div/div[1]/input").click #Third Language drop down
				browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(6) > div:nth-child(3) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "Automation Language1" #enters a selection
					browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(2) > div:nth-child(6) > div:nth-child(3) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection

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

						browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[2]/div[3]/div[4]/div/div/div[1]/input").click #Select County of residence drop down
							browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(3) > div:nth-child(4) > div:nth-child(4) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "alamance" #Enters a selection
								browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(3) > div:nth-child(4) > div:nth-child(4) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #Selects the selection
						browser.find_element(id: "ContactInfo_CellPhone").click #Cell number focus
							browser.find_element(id: "ContactInfo_CellPhone").send_keys "9997778888" #Enters Cell number
						browser.find_element(id: "ContactInfo_HomePhone").click #Home number focus
							browser.find_element(id: "ContactInfo_HomePhone").send_keys "1112223333" #Enters Home number
						browser.find_element(id: "ContactInfo_WorkPhone").click #Work number focus
							browser.find_element(id: "ContactInfo_WorkPhone").send_keys "4445556677" #Enters Work number	
						browser.find_element(id: "ContactInfo_EmailAddress").send_keys "automated1@email.com" #Email address

						browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[2]/div[5]/div[2]/div/div/div[1]/input").click #Select Preferred Communication drop down
							browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(3) > div:nth-child(6) > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "Cell" #Enters a selection
								browser.find_element(css: "body > div.page-container > div > div > form > section:nth-child(3) > div:nth-child(6) > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #Selects the selection
						
						browser.find_element(id: "ContactInfo_PrimaryShelter").send_keys "Home" #Primary shelter
							browser.find_element(id: "ContactInfo_SecondaryShelter").send_keys "Gun range" #Secondary shelter

						browser.find_element(id: "ContactInfo_ContactInfoComments").send_keys "This contact info was added by automation."
							
		#Emergency Contact Information
			browser.find_element(id: "EmergencyContact_NameFirst").send_keys "Autoemergencyname1" #First name
			browser.find_element(id: "EmergencyContact_NameMiddle").send_keys "Autoemergencymiddlename1" #Middle name
			browser.find_element(id: "EmergencyContact_NameLast").send_keys "Autoemergencylastname1" #Last name
			browser.find_element(id: "EmergencyContact_NameSuffix").send_keys "Auto" #Suffix

			browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[3]/div[2]/div[1]/div/div/div[1]/input").click #Relationship drop down
				browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[3]/div[2]/div[1]/div/div/div[1]/input").send_keys "Automation Relationship1" #enters a selection
					browser.find_element(xpath: "/html/body/div[1]/div/div/form/section[3]/div[2]/div[1]/div/div/div[1]/input").send_keys :return #selects the selection
		
			browser.find_element(id: "EmergencyContact_EmailAddress").send_keys "automatedemergency@email.com" #Email address for emergency contact
			browser.find_element(id: "EmergencyContact_HomePhone").click #Home number focus
				browser.find_element(id: "EmergencyContact_HomePhone").send_keys "1111111111" #Enters Emergency Contact Home number
			browser.find_element(id: "EmergencyContact_CellPhone").click #Work number focus
				browser.find_element(id: "EmergencyContact_CellPhone").send_keys "2222222222" #Enters Emergency Contact Cell number	
						
		#Saves the Client
			browser.find_element(xpath: "/html/body/div[1]/div/div/form/div/ul/li[2]/button").click

		#Address validation popup 
			browser.find_element(xpath: "//*[@id='address-selection-vue']/div/div/div/div[3]/button[2]/span").click

#Navigate to the Add Referral page

				#Clicks Referrals on the left nav
					browser.find_element(link_text: "Referrals").click

				#Clicks Add Referral
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[3]/div/div[3]/a").click

			browser.find_element(id: "Date").click
				browser.find_element(id: "Date").send_keys "01/10/2015"

			#Referral Type
				browser.find_element(xpath: "//*[@id='referral-form']/div[1]/div[2]/div/div/div[1]/input").click #Gender drop down
				browser.find_element(xpath: "//*[@id='referral-form']/div[1]/div[2]/div/div/div[1]/input").send_keys "Urgent" #enters a selection
					browser.find_element(xpath: "//*[@id='referral-form']/div[1]/div[2]/div/div/div[1]/input").send_keys :return #selects the selection

			#Referral Source
				browser.find_element(xpath: "//*[@id='referral-form']/div[1]/div[3]/div/div/div[1]/input").click #Gender drop down
				browser.find_element(xpath: "//*[@id='referral-form']/div[1]/div[3]/div/div/div[1]/input").send_keys "Community / Agency" #enters a selection
					browser.find_element(xpath: "//*[@id='referral-form']/div[1]/div[3]/div/div/div[1]/input").send_keys :return #selects the selection
			
			#Reasons for Referral
				browser.find_element(xpath: "//*[@id='referral-form']/div[1]/div[4]/div/div/div[1]/input").click #Gender drop down
				browser.find_element(xpath: "//*[@id='referral-form']/div[1]/div[4]/div/div/div[1]/input").send_keys "CCA" #enters a selection
					browser.find_element(xpath: "//*[@id='referral-form']/div[1]/div[4]/div/div/div[1]/input").send_keys :return #selects the selection
			
			#Enters a Comment
				browser.find_element(id: "Comments").send_keys "This referral was added through automation"
			
			#Referring Provider Name
				browser.find_element(xpath: "//*[@id='referral-form']/rha-referring-provider/section/div/div[1]/div/div/div[1]/input").click #Provider drop down
				browser.find_element(xpath: "//*[@id='referral-form']/rha-referring-provider/section/div/div[1]/div/div/div[1]/input").send_keys "Referralautomation Lastname" #enters a selection
					browser.find_element(xpath: "//*[@id='referral-form']/rha-referring-provider/section/div/div[1]/div/div/div[1]/input").send_keys :return #selects the selection

				#Saves Referral
					browser.find_element(xpath: "//*[@id='referral-form']/div[3]/ul/li[2]/button").click

#Navigate to the Assignments' Page

			#Clicks Assignments on the left nav
					browser.find_element(link_text: "Assignments").click

			#Clicks Add Assignment
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[3]/div/div[3]/a").click

			#Associated Referral
				browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div[1]/section[1]/div[1]/div[1]/div/div/div[1]/input").click #Associated Referral drop down
				browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div[1]/section[1]/div[1]/div[1]/div/div/div[1]/input").send_keys "Referralautomation" #enters a selection
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div[1]/section[1]/div[1]/div[1]/div/div/div[1]/input").send_keys :return #selects the selection

			#Location
				browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div[1]/section[1]/div[1]/div[2]/div/div/div[1]/input").click #Location drop down
				browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div[1]/section[1]/div[1]/div[2]/div/div/div[1]/input").send_keys "AddedByAutomationLocation1" #enters a selection
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div[1]/section[1]/div[1]/div[2]/div/div/div[1]/input").send_keys :return #selects the selection

			#Program
				browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div[1]/section[1]/div[2]/div[1]/div/div/div[1]/input").click #Location drop down
				browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div[1]/section[1]/div[2]/div[1]/div/div/div[1]/input").send_keys "AddedByAutomationProgram1" #enters a selection
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div[1]/section[1]/div[2]/div[1]/div/div/div[1]/input").send_keys :return #selects the selection

			#Admit Time
				browser.find_element(id: "AdmitTime").click
					browser.find_element(id: "AdmitTime").send_keys "12:00pm"

			#Admit Date
				browser.find_element(id: "AdmitDate").click
					browser.find_element(id: "AdmitDate").send_keys "01/10/2015"

			#Staff Type
				browser.find_element(xpath: "//*[@id='staff-members']/div/div[1]/div/div/div[1]/input").click #Location drop down
				browser.find_element(xpath: "//*[@id='staff-members']/div/div[1]/div/div/div[1]/input").send_keys "Admin" #enters a selection
					browser.find_element(xpath: "//*[@id='staff-members']/div/div[1]/div/div/div[1]/input").send_keys :return #selects the selection
sleep(1)
			#Staff Member
				browser.find_element(xpath: "//*[@id='staff-members']/div/div[2]/div/div/div[1]/input").click #Location drop down
				browser.find_element(xpath: "//*[@id='staff-members']/div/div[2]/div/div/div[1]/input").send_keys "Admin" #enters a selection
					browser.find_element(xpath: "//*[@id='staff-members']/div/div[2]/div/div/div[1]/input").send_keys :return #selects the selection

			#Staff Assignment Date
				browser.find_element(id: "StaffAssignmentDate").click
					browser.find_element(id: "StaffAssignmentDate").send_keys "01/10/2015"
					browser.find_element(id: "StaffAssignmentDate").send_keys "01/10/2015"

				#Saves Assignment
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div[2]/ul/li[2]/button").click

#Navigate to the Payers' page

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

#Manage Authorization

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



#Navigate to the Clients' page, clicks Clinical Chart on left nav, and then click Goals

#Clinical Charts

#Goals
		#Clicks Clients
			browser.find_element(link_text: "Clients").click
		#Searches and accesses a specific client
			browser.find_element(id: "search").send_keys "Automation"
				browser.find_element(xpath: "/html/body/div[1]/div/div/form/div[2]/div/div/span/input").click
					browser.find_element(link_text: "Automationfirstname1 Automationlastname1").click

				#Clicks Clinical Chart on the left nav
					browser.find_element(link_text: "Clinical Chart").click
sleep(1)
					#Clicks Goals in form builder
						browser.find_element(link_text: "Goals").click

				#Clicks Add Goals
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[3]/div/div/a").click
			
				#Goal UDO selection
					browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/stack-repeater-base/div/div/div/div[1]/div[1]/div/div/div[1]").click #Insurance drop down
					browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/stack-repeater-base/div/div/div/div[1]/div[1]/div/div/div[1]/input").send_keys "Automation Goals" #enters a selection
						browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/stack-repeater-base/div/div/div/div[1]/div[1]/div/div/div[1]/input").send_keys :return #selects the selection

				#Other Goal, please specify - Uncomment if goal type is Other
					#browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/stack-repeater-base/div/div/div/div[1]/div[2]/div/input").send_keys "Other Goal Type"

				#Goal Review Date
					browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/stack-repeater-base/div/div/div/div[2]/div[2]/div/div/input").click
						browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/stack-repeater-base/div/div/div/div[2]/div[2]/div/div/input").send_keys "02/13/2015"

				#Target Date
					browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/stack-repeater-base/div/div/div/div[2]/div[1]/div/div/input").click
						browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/stack-repeater-base/div/div/div/div[2]/div[1]/div/div/input").send_keys "12/13/2015"

				#Status Code selection
					browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/stack-repeater-base/div/div/div/div[2]/div[3]/div/div/div[1]").click #Insurance drop down
					browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/stack-repeater-base/div/div/div/div[2]/div[3]/div/div/div[1]/input").send_keys "Revised" #enters a selection
						browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/stack-repeater-base/div/div/div/div[2]/div[3]/div/div/div[1]/input").send_keys :return #selects the selection

				#Goal progeress open text area
					browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/stack-repeater-base/div/div/div/div[3]/div/div/textarea").send_keys "This goals needs more work"

					#Saves Goal
						browser.find_element(xpath: "//*[@id='fb-form-builder']/footer/button").click

#Progress Note
			#Clicks Progress Note in form builder
				browser.find_element(link_text: "Progress Note").click

				#Clicks Add Progress Note
					browser.find_element(xpath: "/html/body/div/div[2]/div/div[3]/div/div/a").click

				#Is Progress Note billable switch - Uncomment if wanting to set it to NO
					#browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[1]/label[2]/span").click

					#Service Date
						browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[2]/div[1]/div/div/input").click
							browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[2]/div[1]/div/div/input").send_keys "02/13/2015"

					#Location selection
						browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[2]/div[2]/div/select").click #Location drop down
						browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[2]/div[2]/div/select").send_keys "AddedByAutomationLocation1" #enters a selection
							browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[2]/div[2]/div/select").send_keys :return #selects the selection
					
					#Program selection
						browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[2]/div[3]/div/select").click #Program drop down
						browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[2]/div[3]/div/select").send_keys "AddedByAutomationProgram1" #enters a selection
							browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[2]/div[3]/div/select").send_keys :return #selects the selection
					
					#Place of Service selection
						browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[2]/div[4]/div/select").click #Place of Service drop down
						browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[2]/div[4]/div/select").send_keys "Automation Place" #enters a selection
							browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[2]/div[4]/div/select").send_keys :return #selects the selection

					#Contact Type radio buttons - Uncomment if needing to change to "Not to face to face"
						#browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[2]/div[5]/div/label[2]/span").click #Face to face
							#browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[2]/div[5]/div/label[3]/span").click #Not face to face	

					#Service Item selection
						browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[3]/div[1]/div/select").click #Place of Service drop down
						#browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[3]/div[1]/div/select").send_keys "addedbyautomation" #enters a selection
						browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[3]/div[1]/div/select").send_keys :arrow_down #enters a selection
							browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[3]/div[1]/div/select").send_keys :return #selects the selection

					#Does the Service have an Authorization
						browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[3]/div[2]/div/label[2]/span").click #YES
						#browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[3]/div[2]/div/label[3]/span").click #NO

					#Service Start Time
						browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[3]/div[3]/div/input").click #Place of Service drop down
						browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[3]/div[3]/div/input").send_keys "12:30pm" #enters a selection
							browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[3]/div[3]/div/input").send_keys :return #selects the selection

					#Service End Time
						browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[3]/div[4]/div/input").click #Place of Service drop down
						browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[3]/div[4]/div/input").send_keys "6:30pm" #enters a selection
							browser.find_element(xpath: "//*[@id='fb-form-builder']/div/fb-disp-form/form/div/fb-disp-page/div/fb-children/div/div/div[3]/div[4]/div/input").send_keys :return #selects the selection

				#Goals Tab
					#Select and add Goals
						#browser.find_element(xpath: "//*[@id='goals-tab']/div/div[1]/div/select").click #Place of Service drop down
						#browser.find_element(xpath: "//*[@id='goals-tab']/div/div[1]/div/select").send_keys "" #enters a selection
							#browser.find_element(xpath: "//*[@id='goals-tab']/div/div[1]/div/select").send_keys :return #selects the selection
					#Clicks Add
						#browser.find_element(xpath: "//*[@id='goals-tab']/div/div[2]/button").click

				#Interventions Tab


				#Outcomes Tab


				#Plan Tab


				#Comments Tab


				#E-Pin
					#Enters epin
						browser.find_element(xpath: "//*[@id='fb-form-builder']/footer/input").send_keys "1234"

#SAVES PROGRESS NOTE DRAFT
						#Saves Draft
							browser.find_element(xpath: "//*[@id='fb-form-builder']/footer/button[2]").click
sleep(1)

		#Accesses the new drafted Progress Note
				#Clicks Progress Note in form builder
					browser.find_element(link_text: "Progress Note").click

				#Edits the Progress Note
					browser.find_element(xpath: "/html/body/div/div[2]/div/div[3]/table/tbody/tr/td[7]/div[1]/a/i").click
sleep(2)
				#E-Pin
					#Enters epin
						browser.find_element(xpath: "//*[@id='fb-form-builder']/footer/input").send_keys "1234"

#SUBMITS PROGRESS NOTE FOR APPROVAL
						#Submits for Approval
							browser.find_element(xpath: "//*[@id='fb-form-builder']/footer/button[3]").click
sleep(1)
		
		#Accesses the new submitted Progress Note
				#Clicks Progress Note in form builder
					browser.find_element(link_text: "Progress Note").click

				#Edits the Progress Note
					browser.find_element(xpath: "/html/body/div/div[2]/div/div[3]/table/tbody/tr[1]/td[7]/div[1]/a/i").click
sleep(2)
				#E-Pin
					#Enters epin
						browser.find_element(xpath: "//*[@id='fb-form-builder']/footer/input").send_keys "1234"
sleep(1)
#APPROVES PROGRESS NOTE
					#Approves Progress Note
						browser.find_element(xpath: "//*[@id='fb-form-builder']/footer/button[3]").click
sleep(1)

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


