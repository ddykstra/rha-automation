/class name			:class_name			:class
css selector		:css
id					:id
link text			:link_text			:link
name				:name
partial link text	:partial_link_text
tag name			:tag_name
xpath				:xpath/

require 'selenium-webdriver'
require 'colorize'

USERNAME = ENV["USERNAME"]
PASSWORD = ENV["PASSWORD"]
ENVIRONMENT_UNDER_TEST = ENV["ENVIRONMENT_UNDER_TEST"]

CLIENT_FIRST_NAME = ENV["CLIENT_FIRST_NAME"] || "Lars"
CLIENT_LAST_NAME = ENV["CLIENT_LAST_NAME"] || "Ulrich"
REASON_UNDER_TEST = ENV["REASON_UNDER_TEST"] || "Invalid Treatment Plan"

def setup
	@driver = Selenium::WebDriver.for :firefox
	@driver.navigate.to ENVIRONMENT_UNDER_TEST
	@driver.manage.timeouts.implicit_wait = 10
end

def teardown
	puts "Add Clinical Progress Note Test Completed.".green
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

    @driver.find_element(xpath: "//label[contains(., \"Service start time\")]/..//input").send_keys Time.now.strftime("%I:%M%p")
    @driver.find_element(xpath: "//label[contains(., \"Service start time\")]/..//input").send_keys :return

    @driver.find_element(xpath: "//label[contains(., \"Service end time\")]/..//input").send_keys (Time.now + (60)).strftime("%I:%M%p")
    @driver.find_element(xpath: "//label[contains(., \"Service end time\")]/..//input").send_keys :return
end

def add_other_goal
    puts("adding other goal")
    @driver.find_element(xpath: "//label[contains(., \"If other, please specify:\")]/..//input").send_keys("a goal.")
    @driver.find_element(xpath: "//button[contains(., \"Add\")]").click
end

def input_e_pin
    @driver.find_element(css: "input[placeholder=\"E-Pin\"]").send_keys "1234"
end

def click_submit_for_approval
    @driver.find_element(xpath: "//button[contains(., \"Submit For Approval\")]").click
end

def access_newly_created_note
    @driver.find_element(css: "i.fa.fa-pencil").click
end

def check_qa_boxes
    @driver.find_element(css: "input[name=\"purpose-of-contact-qa\"]").click
    # @driver.find_element(css: "input[name=\"valid-target-date-qa\"]").click
    # @driver.find_element(css: "input[name=\"intervention-qa\"]").click
    # @driver.find_element(css: "input[name=\"no-passive-interventions-qa\"]").click
    # @driver.find_element(css: "input[name=\"effectiveness-qa\"]").click
    # @driver.find_element(css: "input[name=\"documentation-qa\"]").click
    # @driver.find_element(css: "input[name=\"service-notes-qa\"]").click
    # @driver.find_element(css: "input[name=\"risk-qa\"]").click
end

def click_approve
    @driver.find_element(xpath: "//button[contains(., \"Approve\")]").click
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

    # 2. Navigate to a client
    navigate_to_a_client "#{CLIENT_FIRST_NAME} #{CLIENT_LAST_NAME}"
    expand_clinical_charts
    click_progress_note
    click_add_progress_note

    # 3. Fill in data
    select_is_billable
    fill_in_note_data
    add_other_goal

    # 4. save
    input_e_pin
    click_submit_for_approval

    # 5. QA Approval
    access_newly_created_note
    check_qa_boxes
    input_e_pin
    click_approve

    # 6. Go to bar and verify invalid treatment plan
    navigate_to_bar
    click_create_query
    create_query
    verify_at_least_one_row

    # 7. Logout
	logout
end
