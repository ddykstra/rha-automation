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

	#Navigate to the Add Referral page
		#Clicks Client
			browser.find_element(link_text: "Clients").click
		#Searches and accesses a specific client
			browser.find_element(id: "search").send_keys "Automation"
				browser.find_element(xpath: "/html/body/div[1]/div/div/form/div[2]/div/div/span/input").click
					browser.find_element(link_text: "Automationfirstname1 Automationlastname1").click

				#Clicks Referrals on the left nav
					browser.find_element(link_text: "Referrals").click

				#Clicks Add Referral
					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/div[3]/div/div[3]/a").click

			browser.find_element(id: "Date").click
				browser.find_element(id: "Date").send_keys "01/10/2015"

			#Referral Type
				browser.find_element(xpath: "//*[@id='referral-form']/div[1]/div[2]/div/div/div[1]/input").click #Type drop down
				browser.find_element(xpath: "//*[@id='referral-form']/div[1]/div[2]/div/div/div[1]/input").send_keys "Urgent" #enters a selection
					browser.find_element(xpath: "//*[@id='referral-form']/div[1]/div[2]/div/div/div[1]/input").send_keys :return #selects the selection


			#Referral Source
				browser.find_element(xpath: "//*[@id='referral-form']/div[1]/div[3]/div/div/div[1]/input").click #Referral Source drop down
				browser.find_element(xpath: "//*[@id='referral-form']/div[1]/div[3]/div/div/div[1]/input").send_keys "Community / Agency" #enters a selection
					browser.find_element(xpath: "//*[@id='referral-form']/div[1]/div[3]/div/div/div[1]/input").send_keys :return #selects the selection
			
			#Reasons for Referral
				browser.find_element(xpath: "//*[@id='referral-form']/div[1]/div[4]/div/div/div[1]/input").click #Reason drop down
				browser.find_element(xpath: "//*[@id='referral-form']/div[1]/div[4]/div/div/div[1]/input").send_keys "CCA" #enters a selection
					browser.find_element(xpath: "//*[@id='referral-form']/div[1]/div[4]/div/div/div[1]/input").send_keys :return #selects the selection
			
			#Enters a Comment
				browser.find_element(id: "Comments").send_keys "This referral was added through automation"
			
			#Referring Provider Name
				browser.find_element(xpath: "//*[@id='referral-form']/rha-referring-provider/section/div/div[1]/div/div/div[1]/input").click #Provider drop down
				browser.find_element(xpath: "//*[@id='referral-form']/rha-referring-provider/section/div/div[1]/div/div/div[1]/input").send_keys "Referralautomation Lastname" #enters a selection
					browser.find_element(xpath: "//*[@id='referral-form']/rha-referring-provider/section/div/div[1]/div/div/div[1]/input").send_keys :return #selects the selection
sleep(10)
				#Saves Referral
					browser.find_element(xpath: "//*[@id='referral-form']/div[3]/ul/li[2]/button").click
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


