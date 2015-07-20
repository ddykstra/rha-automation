require 'selenium-webdriver'

USERNAME = 'rhadevadmin@rhadev.onmicrosoft.com'
PASSWORD = 'RHAdev9891'
ENVIRONMENT_UNDER_TEST = 'https://rha.azurewebsites.net/'

CLIENT_FIRST_NAME = ENV["CLIENT_FIRST_NAME"] || "Lars"
CLIENT_LAST_NAME = ENV["CLIENT_LAST_NAME"] || "Ulrich"
REASON_UNDER_TEST = ENV["REASON_UNDER_TEST"] || "Provider Enrollment Issue"

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

def navigate_to_npi_management
    @driver.find_element(link_text: "NPI Management").click
end

def navigate_to_edit_npi_provider
    @driver.find_element(xpath: "//td[contains(., \"Admin\")]/..//a").click
end

def remove_confirmed_payer_if_present
    payer = @driver.find_element(xpath: "//li[contains(., \"Automationpayer\")]")
    if payer.displayed?
        payer.find_element(css: "i.fa.fa-trash-o.pull-right").click
end

def save_npi_payer
    @driver.find_element(xpath: "//button[contains(., \"Save\")]").click
    @driver.find_element(xpath: "//button[contains(., \"Save anyway\")]").click
    raise "Test Failed - Cost center not saved".red unless @driver.find_element(xpath: "//h1[contains(., \"NPI Management\")]").displayed?
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
    navigate_to_npi_management
    navigate_to_edit_npi_provider
    remove_confirmed_payer_if_present
    save_npi_payer

    # 3. Go to bar and verify Provider Enrollment Issue
    navigate_to_bar
    click_create_query
    create_query
    verify_at_least_one_row

    # 4. Logout
	logout
end
