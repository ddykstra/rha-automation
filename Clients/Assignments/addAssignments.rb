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
  browser.get "https://rha.azurewebsites.net/"
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

	#Navigate to the Assignments' Page
		#Clicks Clients
			browser.find_element(link_text: "Clients").click
		#Searches and accesses a specific client
			browser.find_element(id: "search").send_keys "Automation"
				browser.find_element(xpath: "/html/body/div[1]/div/div/form/div[2]/div/div/span/input").click
					browser.find_element(link_text: "Automationfirstname1 Automationlastname1").click

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


