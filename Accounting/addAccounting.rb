/class name			:class_name			:class
css selector		:css	 
id					:id	 
link text			:link_text			:link
name				:name	 
partial link text	:partial_link_text	 
tag name			:tag_name	 
xpath				:xpath/

#Give a single Sparcet automation

#BROWSER: FIREFOX
require "selenium-webdriver"
 browser = Selenium::WebDriver.for :firefox
  browser.get "http://teamphoria-web-dev.elasticbeanstalk.com/"
  #browser.window.resize_to(1680,1050)
   browser.current_url
	browser.title

	#Login screen
		browser.find_element(name: "email").send_keys "sparcet4@gmail.com"
		browser.find_element(name: "password").send_keys "P@55word1"
		browser.find_element(css: "#login-container > form > fieldset > button").click

	#This for tenant selection post login
		#browser.find_element(css: "#login-container > div > ul > li:nth-child(7) > a > h3").click 

	#Give Sparcet button
		browser.find_element(css: "#vm-options > a.nav-link.nav-link-primary > span").click
		sleep(8)


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


#BROWSER: Safari
 browser = Selenium::WebDriver.for :safari
  browser.get "http://teamphoria-web-dev.elasticbeanstalk.com/"
  #browser.window.resize_to(1680,1050)
   browser.current_url
	browser.title

	#Login screen
		browser.find_element(name: "email").send_keys "sparcet4@gmail.com"
		browser.find_element(name: "password").send_keys "P@55word1"
		browser.find_element(css: "#login-container > form > fieldset > button").click

	#This for tenant selection post login
		#browser.find_element(css: "#login-container > div > ul > li:nth-child(7) > a > h3").click 

	#Give Sparcet button
	sleep(5)
		browser.find_element(css: "a.nav-link.nav-link-primary").click
		sleep(8)


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
			browser.find_element(id: "reason").send_keys "SAFARI: This sparcet was sent through automation"
			 browser.find_element(name: "thanksMessage").send_keys "SAFARI: Automated sparcet"
			  browser.find_element(class_name: "action-submit").click

		#Logout
			#browser.find_element(id: "signout-icon").click
browser.close


#BROWSER: Chrome
#NOTE: Current bug with chromedriver where sometimes it cannot interact with elements via .sendkeys - https://code.google.com/p/chromedriver/issues/detail?id=35
 browser = Selenium::WebDriver.for :chrome
  browser.get "http://teamphoria-web-dev.elasticbeanstalk.com/"
  #browser.window.resize_to(1680,1050)
   browser.current_url
	browser.title

	#Login screen
		browser.find_element(name: "email").send_keys "sparcet4@gmail.com"
		browser.find_element(name: "password").send_keys "P@55word1"
		browser.find_element(css: "#login-container > form > fieldset > button").click

	#This for tenant selection post login
		#browser.find_element(css: "#login-container > div > ul > li:nth-child(7) > a > h3").click 

	#Give Sparcet button
	sleep(5)
		browser.find_element(css: "a.nav-link.nav-link-primary").click
		sleep(8)


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
			browser.find_element(id: "reason").send_keys "CHROME: This sparcet was sent through automation"
			 browser.find_element(name: "thanksMessage").send_keys "CHROME: Automated sparcet"
			  browser.find_element(class_name: "action-submit").click

		#Logout
			browser.find_element(id: "signout-icon").click

	browser.close

