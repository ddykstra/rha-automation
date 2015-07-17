require 'selenium-webdriver'

USERNAME = 'rhadevadmin@rhadev.onmicrosoft.com'
PASSWORD = 'RHAdev9891'
ENVIRONMENT_UNDER_TEST = 'https://rha.azurewebsites.net/'

CLIENT_FIRST_NAME = ENV["CLIENT_FIRST_NAME"] || "Lars"
CLIENT_LAST_NAME = ENV["CLIENT_LAST_NAME"] || "Ulrich"
REASON_UNDER_TEST = ENV["REASON_UNDER_TEST"] || "No Cost Center"

def setup
	@driver = Selenium::WebDriver.for :firefox
	@driver.navigate.to ENVIRONMENT_UNDER_TEST
	@driver.manage.timeouts.implicit_wait = 10
end

def teardown
	puts "Test Completed."
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

def navigate_to_system_configuration
    @driver.find_element(link_text: "System Configuration").click
end

def navigate_to_cost_centers
    @driver.find_element(link_text: "Cost Centers").click
end

def navigate_to_edit_cost_center
    @driver.find_element(xpath: "//td[contains(., \"AddedByAutomationProgram1\")]/..//a").click
end

def change_effective_to_date_to_past_date
    @driver.find_element(id: "Effective_To").click
    @driver.find_element(id: "Effective_To").send_keys ""
    @driver.find_element(id: "Effective_To").send_keys (DateTime.now - (60*60*24)).strftime("%m/%d/%Y") # yesterday
end

def save_cost_center
    @driver.find_element(xpath: "//button[contains(., \"Save\")]").click
    raise "Test Failed - Cost center not saved".red unless @driver.find_element(xpath: "//h1[contains(., \"Cost Centers\")]").displayed?
end

def navigate_to_bar
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

    # 2. Navigate to the correct cost center and change its effective to date
    #    to a past date (yesterday).
    navigate_to_system_configuration
    navigate_to_cost_centers
    navigate_to_edit_cost_center
    change_effective_to_date_to_past_date
    save_cost_center

    # 3. Go to bar and verify no cost center
    navigate_to_bar
    click_create_query
    create_query
    verify_at_least_one_row

    # 4. Logout
	logout
end
