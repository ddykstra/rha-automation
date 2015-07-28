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

USERNAME = ENV["USERNAME"] || 'rhadevadmin@rhadev.onmicrosoft.com'
PASSWORD = ENV["PASSWORD"] || 'RHAdev9892'
ENVIRONMENT_UNDER_TEST = ENV["ENVIRONMENT_UNDER_TEST"] || 'https://rha.azurewebsites.net/'
CLIENT_FIRST_NAME = ENV["CLIENT_FIRST_NAME"] || "Leona"
CLIENT_LAST_NAME = ENV["CLIENT_LAST_NAME"] || "Mason"

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

def navigate_to_clients_page
    @driver.find_element(link_text: 'Clients').click
end

def navigate_to_a_client(name)
    puts "Navigating to a Client: #{name}"
    @driver.find_element(id: 'Search').send_keys name
    @driver.find_element(css: 'input[value=Go]').click
    @driver.find_element(link_text:  name).click
end

def click_clinical_chart
    @driver.find_element(link_text: 'Clinical Chart').click
end

def click_goals
    @driver.find_element(xpath: '//a[contains(., "Goals")]').click
end

def click_add_goal
    @driver.find_element(xpath: '//a[contains(., "Add")]').click
end

def add_long_term_goal
    @driver.find_element(id: 'new-long-term-goal-name').send_keys('Automation Long Term Goal')
    @driver.find_element(xpath: '//button[contains(., "Add Long Term Goal")]').click
end

def fill_in_long_term_goal_details
    @driver.find_element(xpath: '//label[contains(., "Long range outcome")]/..//textarea').send_keys("Automation Range Outcome")
    @driver.find_element(xpath: '//label[contains(., "Where am I now")]/..//textarea').send_keys("Automation where am I now?")
end

def add_short_term_goal
    goal_selector = {xpath: '//*[@id="short-term-goal-clinical-goal-0"]/..//input'}
    @driver.find_element(goal_selector).click
    @driver.find_element(goal_selector).send_keys('Adult Client Improve financial successes')
    @driver.find_element(goal_selector).send_keys(:return)

    #use a past date for testing 'service not in pcp bar reason'
    @driver.find_element(id: 'short-term-goal-target-date-0').click
    @driver.find_element(id: 'short-term-goal-target-date-0').send_keys((DateTime.now - (60*60*24)).strftime('%m/%d/%Y'))

    @driver.find_element(xpath: '//label[contains(., "Who is responsible")]/..//input').send_keys('Automation who is responsible')

    @driver.find_element(xpath: '//label[contains(., "Characteristics/Observation/Justification for this goal")]/..//textarea')
        .send_keys('Automation justifaication')

    @driver.find_element(xpath: '//a[contains(., "Add Short Term Goal")]').click
end

def client_signature
    @driver.find_element(xpath: '//button[contains(., "Sign")]').click

    signature_javascript = File.read(Dir.pwd + '/signature.js')
    @driver.execute_script(signature_javascript)

    @driver.find_element(xpath: '//button[contains(., "Done")]').click
end

def epin_and_sign
    @driver.find_element(xpath: '//input[@placeholder="E-Pin"]').send_keys('1234')
    @driver.find_element(xpath: '//button[contains(., "Submit For Approval")]').click
    raise "Goal did not save - Clinical Goal Test Failed".red unless @driver.find_element(xpath: '//h1[contains(., "Goals")]').displayed?
end

def qa_goal
    @driver.find_element(xpath: '//a[@class="edit-action-link"]').click
    client_signature
    @driver.find_element(xpath: '//input[@placeholder="E-Pin"]').send_keys('1234')
    @driver.find_element(xpath: '//button[contains(., "Approve")]').click
end

run do
	# 1. Login
	login USERNAME, PASSWORD

    # 2. Navigate to clients' page, click clinical chart and then click Goals
    navigate_to_clients_page
    navigate_to_a_client "#{CLIENT_FIRST_NAME} #{CLIENT_LAST_NAME}"
    click_clinical_chart
    click_goals

    #3. Add a goal
    click_add_goal
    add_long_term_goal
    fill_in_long_term_goal_details
    add_short_term_goal
    client_signature

    # 4. epin and sign
    epin_and_sign

    # 5. QA
    qa_goal

    # 6. logout
	logout
end
