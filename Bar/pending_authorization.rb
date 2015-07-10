require 'selenium-webdriver'
require 'colorize'

USERNAME = ENV["USERNAME"] || 'rhadevadmin@rhadev.onmicrosoft.com'
PASSWORD = ENV["PASSWORD"] || 'RHAdev9892'
ENVIRONMENT_UNDER_TEST = ENV["ENVIRONMENT_UNDER_TEST"] || 'https://rha.azurewebsites.net/'

CLIENT_FIRST_NAME = ENV["CLIENT_FIRST_NAME"] || "Lars"
CLIENT_LAST_NAME = ENV["CLIENT_LAST_NAME"] || "Ulrich"
REASON_UNDER_TEST = ENV["REASON_UNDER_TEST"] || "Pending Authorization"

def setup
	@driver = Selenium::WebDriver.for :firefox
	@driver.navigate.to ENVIRONMENT_UNDER_TEST
	@driver.manage.timeouts.implicit_wait = 10
end

def teardown
	puts "Pending Authorization Bar Reason Test Completed.".green
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

def navigate_to_clients_page
    @driver.find_element(link_text: 'Clients').click
end

def navigate_to_client(name)
    @driver.find_element(id: "Search").send_keys(name)
    @driver.find_element(css: "input[value=\"Go\"]").click
    @driver.find_element(link_text: name).click
end

def navigate_to_authorizations
    @driver.find_element(link_text: "Authorizations").click
end

def verify_authorization_in_pending_status
    raise "Authorization not in Pending status." unless @driver.find_element(xpath: "//td[contains(., \"Pending\")]").displayed?
end

def navigate_to_reimbursements
    @driver.find_element(link_text: "Reimbursement").click
end

def click_create_query
    @driver.find_element(xpath: "//button[contains(., \"Create Query\")]").click
end

def create_query
    @driver.find_element(id: "First").send_keys(CLIENT_FIRST_NAME)
    @driver.find_element(id: "Last").send_keys(CLIENT_LAST_NAME)
    @driver.find_element(xpath: "//*[@id=\"Reason\"]/..//input").send_keys(REASON_UNDER_TEST)
    @driver.find_element(xpath: "//*[@id=\"Reason\"]/..//input").send_keys(:return)
    @driver.find_element(xpath: "//button[contains(., \"Submit Query\")]").click
end

def verify_at_least_one_row
    raise "Pending Authorization Bar Reason Test Failed".red unless @driver.find_elements(css: "td").length > 1
end

run do
	# 1. Login
	login USERNAME, PASSWORD

    # 2. Navigate to client and verify that the autorization is in pending state
    navigate_to_clients_page
    navigate_to_client "#{CLIENT_FIRST_NAME} #{CLIENT_LAST_NAME}"
    navigate_to_authorizations
    verify_authorization_in_pending_status

    # 3. Navigate to reimbursements and verify row with correct name and bar reason
    navigate_to_reimbursements
    click_create_query
    create_query
    verify_at_least_one_row

	# 4. logout
	logout
end
