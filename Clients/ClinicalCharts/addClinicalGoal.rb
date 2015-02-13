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

	#Navigate to the Clients' page, clicks Clinical Chart on left nav, and then clicks Goals
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

browser.close


