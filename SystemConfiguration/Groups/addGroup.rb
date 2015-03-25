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
  browser.get "https://rha.azurewebsites.net/"
  #browser.window.resize_to(1680,1050)
   browser.current_url
	browser.title

	#Login screen
		browser.find_element(id: "cred_userid_inputtext").send_keys "rhadevadmin@rhadev.onmicrosoft.com"
		browser.find_element(id: "cred_password_inputtext").send_keys "RHAdev989"
		browser.find_element(id: "cred_sign_in_button").click
		sleep(1)
		browser.find_element(id: "cred_sign_in_button").click

	#Navigate to the System Configuration page, clicks Group on left nav, and then click Add Group button
		browser.find_element(xpath: "/html/body/header/ul[1]/li[5]/a").click
		browser.find_element(xpath: "/html/body/div[1]/div[1]/div/ul/li[2]/a").click
		browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[2]/div/div[3]/a").click
		sleep(2)

			#Group details
				browser.find_element(id: "Name").send_keys "AutomationGroup"
					browser.find_element(id: "Description").send_keys "This was added by automation"

			#Saves Group
				browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div/ul/li[3]/button").click
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


