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

#Navigate to the Client' page, clicks Clinical Chart on left nav, and then clicks Progress Note
		#Clicks Clients
			browser.find_element(link_text: "Clients").click
		#Searches and accesses a specific client
			browser.find_element(id: "search").send_keys "Automation"
				browser.find_element(xpath: "/html/body/div[1]/div/div/form/div[2]/div/div/span/input").click
					browser.find_element(link_text: "Automationfirstname1 Automationlastname1").click

				#Clicks Clinical Chart on the left nav
					browser.find_element(link_text: "Clinical Chart").click
sleep(1)
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

browser.close


