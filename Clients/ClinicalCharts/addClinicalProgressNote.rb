/class name			:class_name			:class
css selector		:css
id					:id
link text			:link_text			:link
name				:name
partial link text	:partial_link_text
tag name			:tag_name
xpath				:xpath/

require 'selenium-webdriver'

USERNAME = 'rhadevadmin@rhadev.onmicrosoft.com'
PASSWORD = 'RHAdev9892'
ENVIRONMENT_UNDER_TEST = 'https://rha.azurewebsites.net/'

CLIENT_FIRST_NAME = "Clement"
CLIENT_LAST_NAME = "Clarkson"

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
	# teardown
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

def expand_clinical_charts
    @driver.find_element(link_text: "Clinical Chart").click
end

def click_progress_note
    @driver.find_element(partial_link_text: "Progress Note").click
end

def click_add_progress_note
    @driver.find_element(partial_link_text: "Add Progress Note").click
end

def select_is_billable
    # toggle off then on
    @driver.find_element(css: "input.checkbox-toggle[type=\"checkbox\"]")
           .find_element(xpath: "..")
           .find_element(css: "span").click
    @driver.find_element(css: "input.checkbox-toggle[type=\"checkbox\"]")
           .find_element(xpath: "..")
           .find_element(css: "span").click
end

def fill_in_note_data
    puts("starting fill in data")
    @driver.find_element(xpath: "//label[contains(., \"Service date\")]/..//input").send_keys DateTime.now.strftime('%m/%d/%Y')

    @driver.find_element(xpath: "//label[contains(., \"Location\")]/..//input").click
    @driver.find_element(xpath: "//label[contains(., \"Location\")]/..//div[@data-selectable]").click

    @driver.find_element(xpath: "//label[contains(., \"Program\")]/..//input").click
    @driver.find_element(xpath: "//label[contains(., \"Program\")]/..//div[@data-selectable]").click

    @driver.find_element(xpath: "//label[contains(., \"Place of service\")]/..//input").click
    @driver.find_element(xpath: "//label[contains(., \"Place of service\")]/..//div[@data-selectable]").click

    @driver.find_element(xpath: "//label[contains(., \"Contact type\")]/..//span").click # face to face

    @driver.find_element(xpath: "//label[contains(., \"Service item\")]/..//input").click
    @driver.find_element(xpath: "//label[contains(., \"Service item\")]/..//div[@data-selectable]").click

    @driver.find_element(xpath: "//label[contains(., \"Does service have authorization\")]/..//span").click

    @driver.find_element(xpath: "//label[contains(., \"Service start time\")]/..//input").send_keys "12:01am"
    @driver.find_element(xpath: "//label[contains(., \"Service start time\")]/..//input").send_keys :return

    @driver.find_element(xpath: "//label[contains(., \"Service end time\")]/..//input").send_keys "1:01am"
    @driver.find_element(xpath: "//label[contains(., \"Service end time\")]/..//input").send_keys :return
end

def input_e_pin
    @driver.find_element(css: "input[placeholder=\"E-Pin\"]").send_keys "1234"
end

def click_submit_for_approval
    @driver.find_element(xpath: "//button[contains(., \"Submit For Approval\")]").click
end

run do
	# 1. Login
	login USERNAME, PASSWORD

    # 2. Navigate to a client
    navigate_to_a_client "#{CLIENT_FIRST_NAME} #{CLIENT_LAST_NAME}"
    expand_clinical_charts
    click_progress_note
    click_add_progress_note

    # 3. Fill in data
    select_is_billable
    fill_in_note_data

    # 4. save
    input_e_pin
    click_submit_for_approval

    # 5. Logout

	# logout
end
