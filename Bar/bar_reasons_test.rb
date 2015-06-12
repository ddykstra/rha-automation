require 'selenium-webdriver'
require 'json'

BAR_DATA_FILE = "Bar/Data/bar_data.json"

USERNAME = 'rhadevadmin@rhadev.onmicrosoft.com'
PASSWORD = 'RHAdev9891'
ENVIRONMENT_UNDER_TEST = 'https://rha.azurewebsites.net/'

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

def load_bar_data(filename)
    Hash[*JSON.parse( IO.read( filename ) ).collect { |h| h.to_a }.flatten]
end

def click_reimbursement
    @driver.find_element(link_text: "Reimbursement").click
end

def build_name_reason_hash
    # TODO: paging?

    first_names = @driver.find_elements(css: "table tbody tr td:nth-of-type(3)").map {
        |name| name.text
    }

    last_names = @driver.find_elements(css: "table tbody tr td:nth-of-type(4)").map {
        |name| name.text
    }

    reasons = @driver.find_elements(css: "table tbody tr td:nth-of-type(13)").map {
        |reason| reason.text
    }

    Hash[first_names.zip(last_names).map { |name| name.map {|n| "#{n}"}.join(" ")}.zip(reasons)]
end

def diff_data
    @name_reason_hash.select{|k,_| @data.has_key? k}
end

def write_diff_to_file
    File.open("Bar/Data/output.json", "w") do |f|
        f.write(JSON.pretty_generate(@diff))
    end
end

run do
    login USERNAME, PASSWORD

    click_reimbursement

    @name_reason_hash = build_name_reason_hash

    @data = load_bar_data BAR_DATA_FILE

    @diff = diff_data

    write_diff_to_file
end
