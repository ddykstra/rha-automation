/class name			:class_name			:class
css selector		:css
id					:id
link text			:link_text			:link
name				:name
partial link text	:partial_link_text
tag name			:tag_name
xpath				:xpath/

require 'selenium-webdriver'
require 'test/unit'
require 'colorize'

USERNAME = ENV["USERNAME"]
PASSWORD = ENV["PASSWORD"]
ENVIRONMENT_UNDER_TEST = ENV["ENVIRONMENT_UNDER_TEST"]

CLIENT_FIRST_NAME = ENV["CLIENT_FIRST_NAME"]
CLIENT_LAST_NAME = ENV["CLIENT_LAST_NAME"]

def setup
	@driver = Selenium::WebDriver.for :firefox
	@driver.navigate.to ENVIRONMENT_UNDER_TEST
	@driver.manage.timeouts.implicit_wait = 10
end

def teardown
	puts "Add Referral to Client Test Completed.".green
	@driver.quit
end

def run
	setup
	yield
	teardown
end

def login(username,password)
	puts 'Logging in'

	@driver.find_element(id: 'cred_userid_inputtext').send_keys username # 'rhadevadmin@rhadev.onmicrosoft.com'
	@driver.find_element(id: 'cred_password_inputtext').send_keys password # 'RHAdev9891'
	@driver.find_element(id: 'cred_sign_in_button').click
	sleep(1)
	@driver.find_element(id: 'cred_sign_in_button').click
end

def logout
	puts 'Logging out'
	@driver.find_element(css: 'a.dropdown-toggle i.caret').click
	@driver.find_element(css: 'a[href="/account/signout"]').click
end

def navigate_to_a_client(name)
    @driver.find_element(css: "a[href=\"/clinical/clients\"]").click
    @driver.find_element(id: "Search").send_keys name
    @driver.find_element(css: "input[value=\"Go\"]").click
    raise "Client not found in list" unless @driver.find_element(link_text: name).displayed?
    @driver.find_element(link_text: name).click
end

def navigate_to_add_referral_page
    @driver.find_element(link_text: "Referrals").click
end

def click_add_referral
    @driver.find_element(css: "a[href*=\"/referrals/create\"]").click
end

def fill_in_referral_info
    @driver.find_element(id: "Date").click
    @driver.find_element(id: "Date").send_keys "01/10/2015"

    referral_type_dropdown = @driver.find_element(id: "Type").find_element(xpath: "..").find_element(css: "input")
    referral_type_dropdown.click
    referral_type_dropdown.send_keys "Routine"
    referral_type_dropdown.send_keys :return

    referral_source_dropdown = @driver.find_element(id: "Source").find_element(xpath: "..").find_element(css: "input")
    referral_source_dropdown.click
    referral_source_dropdown.send_keys "Community / Agency"
    referral_source_dropdown.send_keys :return

    referraL_reason_dropdown = @driver.find_element(id: "Reasons_SelectedValue").find_element(xpath: "..").find_element(css: "input")
    referraL_reason_dropdown.click
    referraL_reason_dropdown.send_keys "CCA"
    referraL_reason_dropdown.send_keys :return

    @driver.find_element(id: "Comments").click
    @driver.find_element(id: "Comments").send_keys "Automation comment"
end

def fill_in_referring_npi_info
    provider_name_dropdown = @driver.find_element(id: "Referrer_Provider_SelectedValue").find_element(xpath: "..").find_element(css: "input")
    provider_name_dropdown.click
    provider_name_dropdown.send_keys "2000000000 - Referralautomation Lastname"
    provider_name_dropdown.send_keys :return
end

def click_save
    @driver.find_element(css: "button[type=\"submit\"].btn.btn-primary").click
end

run do
	# 1. Login
	login USERNAME, PASSWORD

    # 2. Add a referral
    navigate_to_a_client "#{CLIENT_FIRST_NAME} #{CLIENT_LAST_NAME}"
    navigate_to_add_referral_page
    click_add_referral
    fill_in_referral_info
    fill_in_referring_npi_info
    click_save

	# 3. Logout
	logout
end
