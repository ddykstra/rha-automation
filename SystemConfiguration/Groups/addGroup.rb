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
		browser.find_element(id: "cred_password_inputtext").send_keys "RHAdev987"
		browser.find_element(id: "cred_sign_in_button").click
		sleep(2)

	#Navigate to the System Configuration page and click create Group button
		browser.find_element(xpath: "/html/body/header/ul[1]/li[5]/a").click
		browser.find_element(xpath: "/html/body/div[2]/div[1]/div/ul/li[2]/a").click
		browser.find_element(xpath: "/html/body/div[2]/div[2]/div/div/div/div/form/a").click
		sleep(2)


	#Sparcet details
			browser.find_element(id: "give-input-selectize").click
			browser.find_element(id: "give-input-selectize").send_keys "josh.garwood"
			sleep(5)
			browser.find_element(id: "give-input-selectize").send_keys :tab

			browser.find_element(name: "impactId").click
			sleep(2)
			browser.find_element(css: "#fullscreen-views > div > div > form > fieldset.send-message > ol > li:nth-child(1) > select > option:nth-child(2)").click
			 browser.find_element(css: "#fullscreen-views > div > div > form > fieldset.send-message > ol > li:nth-child(1) > select > option:nth-child(2)").send_keys :arrow_down
			  browser.find_element(css: "#fullscreen-views > div > div > form > fieldset.send-message > ol > li:nth-child(1) > select > option:nth-child(2)").send_keys :arrow_down
			   browser.find_element(css: "#fullscreen-views > div > div > form > fieldset.send-message > ol > li:nth-child(1) > select > option:nth-child(2)").send_keys :tab

			browser.find_element(name: "coreValueId").click
			sleep(2)
			browser.find_element(css: "#fullscreen-views > div > div > form > fieldset.send-message > ol > li:nth-child(2) > select > option:nth-child(4)").click
			 browser.find_element(css: "#fullscreen-views > div > div > form > fieldset.send-message > ol > li:nth-child(2) > select > option:nth-child(4)").send_keys :arrow_down
			  browser.find_element(css: "#fullscreen-views > div > div > form > fieldset.send-message > ol > li:nth-child(2) > select > option:nth-child(4)").send_keys :arrow_down
			   browser.find_element(css: "#fullscreen-views > div > div > form > fieldset.send-message > ol > li:nth-child(2) > select > option:nth-child(4)").send_keys :arrow_down
			    browser.find_element(css: "#fullscreen-views > div > div > form > fieldset.send-message > ol > li:nth-child(2) > select > option:nth-child(4)").send_keys :arrow_down
			     browser.find_element(css: "#fullscreen-views > div > div > form > fieldset.send-message > ol > li:nth-child(2) > select > option:nth-child(4)").send_keys :tab

		#Badge select
			browser.find_element(xpath: "//*[@id='fullscreen-views']/div/div/form/fieldset[1]/div[2]").click 

		#Sparcet Reason and Thanks message; send click
			browser.find_element(id: "reason").send_keys "FIREFOX: This sparcet was sent through automation"
			 browser.find_element(name: "thanksMessage").send_keys "FIREFOX: Automated sparcet"
			  browser.find_element(class_name: "action-submit").click

	#wait.until(ExpectedConditions.elementToBeClickable(By.class "selectize-control"));
	#/WebDriverWait wait = new WebDriverWait(webDriver, timeoutInSeconds);
	#wait.until(ExpectedConditions.visibilityOfElementLocated(By.class "selectize-control"));/
	#browser.find_element(link_text: "Images").click
	#browser.find_elements(tag_name: "img").size

		#Logout
			browser.find_element(id: "signout-icon").click
browser.close


