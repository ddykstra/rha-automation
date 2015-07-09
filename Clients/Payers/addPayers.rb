/class name			:class_name			:class
css selector		:css
id					:id
link text			:link_text			:link
name				:name
partial link text	:partial_link_text
tag name			:tag_name
xpath				:xpath/

require 'selenium-webdriver'

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

def navigate_to_a_client(name)
    @driver.find_element(css: "a[href=\"/clinical/clients\"]").click
    @driver.find_element(id: "Search").send_keys name
    @driver.find_element(css: "input[value=\"Go\"]").click
    raise "Client not found in list." unless @driver.find_element(link_text: name).displayed?
    @driver.find_element(link_text: name).click
end

def navigate_to_add_payer_page
    @driver.find_element(link_text: "Payers").click
end

def click_add_payer
    @driver.find_element(css: "a[href*=\"/insurance/create\"]").click
end

def fill_in_payer_info
    payer_name_dropdown = @driver.find_element(id: "Payer_SelectedValue").find_element(xpath: "..").find_element(css: "input")
    payer_name_dropdown.click
    payer_name_dropdown.send_keys "Automationpayer Lastname"
    payer_name_dropdown.send_keys :return

    @driver.find_element(id: "PolicyNumber").send_keys "0000001"

    @driver.find_element(css: "#Priority[value=\"Tertiary\"]").click
    @driver.find_element(css: "#Priority[value=\"Secondary\"]").click
    @driver.find_element(css: "#Priority[value=\"Primary\"]").click

    raise "Phone number should be disabled" if @driver.find_element(id: "PhoneNumber").enabled?

    relationship_dropdown = @driver.find_element(id: "RelationshipToInsured").find_element(xpath: "..").find_element(css: "input")
    relationship_dropdown.click
    relationship_dropdown.send_keys "Self"
    relationship_dropdown.send_keys :return

    @driver.find_element(id: "EffectiveFrom").clear
    @driver.find_element(id: "EffectiveFrom").send_keys "01/01/2015"
    @driver.find_element(id: "TerminationDate").clear
    @driver.find_element(id: "TerminationDate").send_keys "12/31/2015"

    @driver.find_element(css: "#McoFunding_Funded[value=\"No\"]").click
    @driver.find_element(css: "#McoFunding_Funded[value=\"Yes\"]").click

    raise "MCO Funding Type did not become visible." unless @driver.find_element(css: "label[for=\"McoFunding_FundingType\"]").displayed?

    @driver.find_element(css: "#McoFunding_FundingType[value=\"State\"]").click
    @driver.find_element(css: "#McoFunding_FundingType[value=\"Medicaid\"]").click

    @driver.find_element(id: "McoFunding_MedicaidNumber").send_keys '%06d' % rand(6 ** 6) # random 6 digit number
end

def click_save
    @driver.find_element(css: "button[type=\"submit\"].btn.btn-primary").click
	"Payer not saved." unless @driver.find_element(xpath: "//h1[contains(., \"Payer Management\")]").displayed?
end

run do
	# 1. Login
	login USERNAME, PASSWORD

    # 2. Add a payer
    navigate_to_a_client "#{CLIENT_FIRST_NAME} #{CLIENT_LAST_NAME}"
    navigate_to_add_payer_page
    click_add_payer
    fill_in_payer_info
    click_save

	# 3. Logout
	logout
end
