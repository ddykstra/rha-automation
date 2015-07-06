/class name			:class_name			:class
css selector		:css
id					:id
link text			:link_text			:link
name				:name
partial link text	:partial_link_text
tag name			:tag_name
xpath				:xpath/

require 'selenium-webdriver'
require 'spreadsheet'

USERNAME = 'rhadevadmin@rhadev.onmicrosoft.com'
PASSWORD = 'RHAdev9891'
ENVIRONMENT_UNDER_TEST = 'https://rha.azurewebsites.net/'
DEFAULT_DATA_FILE_PATH = File.expand_path("../../../Data/Data.xls", __FILE__)

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

def read_path_to_data_file
    @data_file_path = ARGV[0]
	@data_file_path ||= DEFAULT_DATA_FILE_PATH # use the default if it is still null
end

def read_data_file
    puts 'Reading data'

    Spreadsheet.open(@data_file_path) do |book|
        book.worksheet('Services').each 1 do |row| # skip the header row
            break if row[0].nil?
            map_data_to_fields(row)
			fill_in_data
			# TODO: click save
			# TODO: repeat 
        end
    end
end

def map_data_to_fields(data)
	@name = data[0]
	@service_category = data[1]
	@usual_charge = data[2]
	@hcpcs = data[3]
	@modifier = data[4]
	@effective_from = data[5]
	@effective_to = data[6]
	@bill_type = data[7]
	@revenue_type = data[8]
	@p_and_l_dept = data[9]
	@p_and_l_root_account = data[10]
	@p_and_l_product_line = data[11]
	@p_and_l_service_line = data[12]
	@balance_sheet_dept = data[13]
	@balance_sheet_root_account = data[14]
	@balance_sheet_product_line = data[15]
	@balance_sheet_service_line = data[16]
	@billing_rules_rule_type = data[17]
	@billing_frequency_limits_limit = data[18]
	@billing_frequency_limits_per = data[19]
	@define_measure_number_of_units = data[20]
	@define_measure_duration = data[21]
	@define_measure_duration_floor = data[22]
	@define_measure_duration_ceiling = data[23]
	@requires_start_and_end_time = to_bool(data[24])
	@authorization_rules_requires_authorization = to_bool(data[25])
	@authorization_rules_requires_referral_for_authorization = to_bool(data[26])
	@authorization_rules_requires_diagnosis = to_bool(data[27])
	@authorization_rules_authorization_type = data[28]
	@enforce_limit = data[29]
	@enforce_per = data[30]
	@clinical_rules_qa_review_required = to_bool(data[31])
	@clinical_rules_attending_provider_required = to_bool(data[32])
	@clinical_rules_requires_face_to_face = to_bool(data[33])
	@clinical_rules_calocus_locus_required = to_bool(data[34])
	@clinical_rules_link_to_treatment_plan = to_bool(data[35])
	@clinical_rules_note_required = to_bool(data[36])
	@delivery_method = data[37]
	@rounding_rules_service_type = data[38]
	@rounding_rules_always_round = data[39]
end

def navigate_to_system_configuration
	@driver.find_element(link_text: "System Configuration").click
end

def navigate_to_services
	@driver.find_element(link_text: "Services").click
end

def click_add_service
	@driver.find_element(partial_link_text: "Add Service").click
end

def fill_in_data
	fill_in_service_details_and_mapping
	fill_in_p_and_l_mapping
	fill_in_balance_sheet_mapping
	fill_in_billing_rules
	fill_in_billing_frequency_limits
	fill_in_define_measure
	fill_in_requires_start_and_end_time
	fill_in_authorization_rules
	fill_in_enforce
	fill_in_clinical_rules
	fill_in_delivery_method
	fill_in_rounding_rules
end

def fill_in_service_details_and_mapping
	@driver.find_element(id: "ServiceModel_Name").send_keys(@name)
	@driver.find_element(id: "ServiceModel_ServiceCategories_SelectedValue")
		.find_element(xpath: "..").find_element(css: "input").send_keys(@service_category)
	@driver.find_element(id: "ServiceModel_ServiceCategories_SelectedValue")
		.find_element(xpath: "..").find_element(css: "input").send_keys(:return)
	@driver.find_element(id: "ServiceModel_UsualCharge").send_keys(@usual_charge)
	@driver.find_element(id: "ServiceModel_HCPCS").send_keys(@hcpcs)
	@driver.find_element(id: "ServiceModel_Modifier").send_keys(@modifier)
	@driver.find_element(id: "ServiceModel_Effective_From").send_keys(@effective_from)
	@driver.find_element(id: "ServiceModel_Effective_To").send_keys(@effective_to)
	if @bill_type.downcase == 'inpatient'
		@driver.find_element(css: "#ServiceModel_BillType[value=\"Inpatient\"]").find_element(xpath: "..").find_element(css: "span").click
	else
		@driver.find_element(css: "#ServiceModel_BillType[value=\"Outpatient\"]").find_element(xpath: "..").find_element(css: "span").click
	end
	if @revenue_type.downcase == 'ffs'
		@driver.find_element(css: "#ServiceModel_RevenueType[value=\"FFS\"]").find_element(xpath: "..").find_element(css: "span").click
	else
		@driver.find_element(css: "#ServiceModel_RevenueType[value=\"NonBillable\"]").find_element(xpath: "..").find_element(css: "span").click
	end
end

def fill_in_p_and_l_mapping
	@driver.find_element(id: "ServiceModel_PLMapping_RevenueDepartments_SelectedValue").find_element(xpath: "..").find_element(css: "input").send_keys(@p_and_l_dept)
	@driver.find_element(id: "ServiceModel_PLMapping_RevenueDepartments_SelectedValue").find_element(xpath: "..").find_element(css: "input").send_keys(:return)

	@driver.find_element(id: "ServiceModel_PLMapping_RootAccounts_SelectedValue").find_element(xpath: "..").find_element(css: "input").send_keys(@p_and_l_root_account)
	@driver.find_element(id: "ServiceModel_PLMapping_RootAccounts_SelectedValue").find_element(xpath: "..").find_element(css: "input").send_keys(:return)

	@driver.find_element(id: "ServiceModel_PLMapping_ProductLines_SelectedValue").find_element(xpath: "..").find_element(css: "input").send_keys(@p_and_l_product_line)
	@driver.find_element(id: "ServiceModel_PLMapping_ProductLines_SelectedValue").find_element(xpath: "..").find_element(css: "input").send_keys(:return)

	@driver.find_element(id: "ServiceModel_PLMapping_ServiceLines_SelectedValue").find_element(xpath: "..").find_element(css: "input").send_keys(@p_and_l_service_line)
	@driver.find_element(id: "ServiceModel_PLMapping_ServiceLines_SelectedValue").find_element(xpath: "..").find_element(css: "input").send_keys(:return)
end

def fill_in_balance_sheet_mapping
	@driver.find_element(id: "ServiceModel_BalanceSheetMapping_RevenueDepartments_SelectedValue").find_element(xpath: "..").find_element(css: "input").send_keys(@balance_sheet_dept)
	@driver.find_element(id: "ServiceModel_BalanceSheetMapping_RevenueDepartments_SelectedValue").find_element(xpath: "..").find_element(css: "input").send_keys(:return)

	@driver.find_element(id: "ServiceModel_BalanceSheetMapping_RootAccounts_SelectedValue").find_element(xpath: "..").find_element(css: "input").send_keys(@balance_sheet_root_account)
	@driver.find_element(id: "ServiceModel_BalanceSheetMapping_RootAccounts_SelectedValue").find_element(xpath: "..").find_element(css: "input").send_keys(:return)

	@driver.find_element(id: "ServiceModel_BalanceSheetMapping_ProductLines_SelectedValue").find_element(xpath: "..").find_element(css: "input").send_keys(@balance_sheet_product_line)
	@driver.find_element(id: "ServiceModel_BalanceSheetMapping_ProductLines_SelectedValue").find_element(xpath: "..").find_element(css: "input").send_keys(:return)

	@driver.find_element(id: "ServiceModel_BalanceSheetMapping_ServiceLines_SelectedValue").find_element(xpath: "..").find_element(css: "input").send_keys(@balance_sheet_service_line)
	@driver.find_element(id: "ServiceModel_BalanceSheetMapping_ServiceLines_SelectedValue").find_element(xpath: "..").find_element(css: "input").send_keys(:return)
end

def fill_in_billing_rules
	if @billing_rules_rule_type.downcase == 'time'
		@driver.find_element(css: "#ServiceModel_BillingRuleType[value=\"Time\"]").find_element(xpath: "..").find_element(css: "span").click
	elsif @billing_rules_rule_type.downcase == 'event'
		@driver.find_element(css: "#ServiceModel_BillingRuleType[value=\"Event\"]").find_element(xpath: "..").find_element(css: "span").click
	else
		@driver.find_element(css: "#ServiceModel_BillingRuleType[value=\"PerDiem\"]").find_element(xpath: "..").find_element(css: "span").click
	end
end

def fill_in_billing_frequency_limits
	@driver.find_element(id: "ServiceModel_BillingLimit").send_keys(@billing_frequency_limits_limit)

	@driver.find_element(id: "ServiceModel_BillingFrequency").find_element(xpath: "..").find_element(css: "input").send_keys(@billing_frequency_limits_per)
	@driver.find_element(id: "ServiceModel_BillingFrequency").find_element(xpath: "..").find_element(css: "input").send_keys(:return)

	@driver.find_element(xpath: "//button[contains(., \"Apply Frequency Limits\")]").click
end

def fill_in_define_measure
	@driver.find_element(id: "ServiceModel_NumberOfUnits").send_keys(@define_measure_number_of_units)
	@driver.find_element(id: "ServiceModel_Duration").send_keys(@define_measure_duration)
	@driver.find_element(id: "ServiceModel_DurationFloor").send_keys(@define_measure_duration_floor)
	@driver.find_element(id: "ServiceModel_DurationCeiling").send_keys(@define_measure_duration_ceiling)
end

def fill_in_requires_start_and_end_time
	@driver.find_element(id: "ServiceModel_RequiresStartEndTime")
			.find_element(xpath: "..")
			.find_element(css: "span").click if @requires_start_and_end_time
end

def fill_in_authorization_rules
	@driver.find_element(id: "ServiceModel_RequiresAuth")
			.find_element(xpath: "..")
			.find_element(css: "span").click unless @authorization_rules_requires_authorization
	@driver.find_element(id: "ServiceModel_RequiresAuthReferral")
			.find_element(xpath: "..")
			.find_element(css: "span").click if @authorization_rules_requires_referral_for_authorization
	@driver.find_element(id: "ServiceModel_RequiresDiagnosis")
			.find_element(xpath: "..")
			.find_element(css: "span").click unless @authorization_rules_requires_diagnosis
	if @authorization_rules_authorization_type.downcase == 'managed'
		@driver.find_element(css: "#ServiceModel_AuthType[value=\"Managed\"]").find_element(xpath: "..").find_element(css: "span").click
	else
		@driver.find_element(css: "#ServiceModel_AuthType[value=\"Unmanaged\"]").find_element(xpath: "..").find_element(css: "span").click
	end
end

def fill_in_enforce
	@driver.find_element(id: "ServiceModel_AuthorizationLimit").send_keys(@enforce_limit)

	@driver.find_element(id: "ServiceModel_AuthorizationFrequency").find_element(xpath: "..").find_element(css: "input").send_keys(@enforce_per)
	@driver.find_element(id: "ServiceModel_AuthorizationFrequency").find_element(xpath: "..").find_element(css: "input").send_keys(:return)

	@driver.find_element(xpath: "//button[contains(., \"Apply Authorization Limits\")]").click
end

def fill_in_clinical_rules
	@driver.find_element(id: "ServiceModel_QAReviewRequired")
			.find_element(xpath: "..")
			.find_element(css: "span").click if @clinical_rules_qa_review_required
	@driver.find_element(id: "ServiceModel_LinkToTreatmentPlan")
			.find_element(xpath: "..")
			.find_element(css: "span").click if @clinical_rules_link_to_treatment_plan
	@driver.find_element(id: "ServiceModel_ProviderRequired")
			.find_element(xpath: "..")
			.find_element(css: "span").click if @clinical_rules_attending_provider_required
	@driver.find_element(id: "ServiceModel_RequiresFaceToFace")
			.find_element(xpath: "..")
			.find_element(css: "span").click if @clinical_rules_requires_face_to_face
	@driver.find_element(id: "ServiceModel_CalocusRequired")
			.find_element(xpath: "..")
			.find_element(css: "span").click if @clinical_rules_calocus_locus_required
	@driver.find_element(id: "ServiceModel_NoteRequired")
			.find_element(xpath: "..")
			.find_element(css: "span").click if @clinical_rules_note_required
end

def fill_in_delivery_method
	if @delivery_method.downcase == 'single staff to client'
		@driver.find_element(css: "#ServiceModel_DeliveryMethod[value=\"SingleStaffSingleClient\"]")
				.find_element(xpath: "..").find_element(css: "span").click
	elsif @delivery_method.downcase == 'single staff to multiple clients'
		@driver.find_element(css: "#ServiceModel_DeliveryMethod[value=\"SingleStaffMultipleClient\"]")
				.find_element(xpath: "..").find_element(css: "span").click
	elsif @delivery_method.downcase == 'multiple staff to cient'
		@driver.find_element(css: "#ServiceModel_DeliveryMethod[value=\"MultipleStaffSingleClient\"]")
				.find_element(xpath: "..").find_element(css: "span").click
	else
		@driver.find_element(css: "#ServiceModel_DeliveryMethod[value=\"MultipleStaffMultipleClient\"]")
				.find_element(xpath: "..").find_element(css: "span").click
	end
end

def fill_in_rounding_rules
	if @rounding_rules_service_type.downcase == 'unit'
		@driver.find_element(css: "#ServiceModel_ServiceType[value=\"Unit\"]")
				.find_element(xpath: "..")
				.find_element(css: "span").click
	else
		@driver.find_element(css: "#ServiceModel_ServiceType[value=\"Time\"]")
				.find_element(xpath: "..")
				.find_element(css: "span").click
	end

	if @rounding_rules_always_round.downcase == 'up'
		@driver.find_element(css: "#ServiceModel_RoundingPreferenceType[value=\"Up\"]")
				.find_element(xpath: "..")
				.find_element(css: "span").click
	else
		@driver.find_element(css: "#ServiceModel_RoundingPreferenceType[value=\"Down\"]")
				.find_element(xpath: "..")
				.find_element(css: "span").click
	end
end

# helpers

def to_bool(str)
	str.downcase == 'true' || str == '1'
end

run do
	# 1. Login
	login USERNAME, PASSWORD

    # 2.
	navigate_to_system_configuration
	navigate_to_services
	click_add_service

	# 3.
    read_path_to_data_file
    read_data_file

	# 4. Logout
	logout
end









# #BROWSER: FIREFOX
# require "rubygems"
# require "selenium-webdriver"
#  browser = Selenium::WebDriver.for :firefox
#   browser.get "https://rha.azurewebsites.net/"
#   #browser.window.resize_to(1680,1050)
#   #driver.manage.timeouts.implicit_wait = 10
#    browser.current_url
# 	browser.title
#
# 	#Login screen
# 		browser.find_element(id: "cred_userid_inputtext").send_keys "rhadevadmin@rhadev.onmicrosoft.com"
# 		browser.find_element(id: "cred_password_inputtext").send_keys "RHAdev989"
# 		browser.find_element(id: "cred_sign_in_button").click
# 		sleep(1)
# 		browser.find_element(id: "cred_sign_in_button").click
# 		sleep(1)
# 	#Navigate to the System Configuration page, clicks Services on left nav, and then click Add Service button
# 		#Clicks System Config
# 			browser.find_element(link_text: "System Configuration").click
# 		#Clicks Services on left Nav
# 			browser.find_element(link_text: "Services").click
# 		#Clicks Add Service
# 			browser.find_element(xpath: "/html/body/div/div[2]/div/div[2]/div/div[3]/a").click
#
# 	#Fill in Service data to add and save.
# 		#Entering in data
# 			browser.find_element(id: "ServiceModel_Name").send_keys "AddedByAutomationService1" #name
# 			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[1]/div[2]/div/div/div[1]").click #service category drop down
# 				browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(1) > div.form-container.col-sm-4 > div > div > div.selectize-input.items.not-full.has-options > input").send_keys "Automation Service" #enters a selection
# 					browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(1) > div.form-container.col-sm-4 > div > div > div.selectize-input.items.not-full.has-options > input").send_keys :return #selects the selection
#
# 			#Need to double click for field focus on this field.
# 			browser.find_element(id: "ServiceModel_UsualCharge").click #Field focus usual charge amount
# 			browser.find_element(id: "ServiceModel_UsualCharge").click #Field focus usual charge amount
# 				browser.find_element(id: "ServiceModel_UsualCharge").send_keys "500" #enters usual charge amount
# 			browser.find_element(id: "ServiceModel_HCPCS").send_keys "HCPCSauto" #HCPCS field
# 			browser.find_element(id: "ServiceModel_Modifier").send_keys "Modauto" #Modifier field
#
# 			browser.find_element(id: "ServiceModel_Effective_To").click
# 				browser.find_element(id: "ServiceModel_Effective_To").send_keys "12/30/2020"
# 				#browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[6]").click #Chooses today
# 			browser.find_element(id: "ServiceModel_Effective_From").click #Effective from calendar
# 				browser.find_element(id: "ServiceModel_Effective_From").send_keys "01/01/2015"
# 				#browser.find_element(xpath: "/html/body/div[2]/div[1]/table/tbody/tr[4]/td[5]").click #Chooses today
#
#
# 			#Uncomment below line if changing BILL TYPE to "Inpatient"; otherwise, it will default to "Outpatient"
# 				#browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[3]/div[1]/div/div[1]/label/span").click
#
# 			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[3]/div[2]/div/div[1]/label/span").click #Revenue type revenue selections
# 				browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[3]/div[2]/div/div[2]/label/span").click #Shadow option
# 					browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[3]/div[2]/div/div[3]/label/span").click #NonBillable option
# 			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[3]/div[2]/div/div[1]/label/span").click #Clicks "FFS" again
#
# 	#P & L and Balance Sheet Mapping
# 			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[4]/div[1]/div/div/div[1]/input").click #P&L - Department drop down
# 				browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(5) > div:nth-child(1) > div > div > div.selectize-input.items.not-full.has-options > input").send_keys "10" #enters a selection
# 					browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(5) > div:nth-child(1) > div > div > div.selectize-input.items.not-full.has-options > input").send_keys :return #selects the selection
#
# 			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[4]/div[2]/div/div/div[1]").click #P&L - Root Account drop down
# 				browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(5) > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options.focus.input-active.dropdown-active > input[type='text']").send_keys "4510" #enters a selection
# 					browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(5) > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options.focus.input-active.dropdown-active > input[type='text']").send_keys :return #selects the selection
#
# 			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[4]/div[3]/div/div/div[1]/input").click #P&L - Product line drop down
# 				browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(5) > div:nth-child(3) > div > div > div.selectize-input.items.not-full.has-options > input").send_keys "11" #enters a selection
# 					browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(5) > div:nth-child(3) > div > div > div.selectize-input.items.not-full.has-options > input").send_keys :return #selects the selection
#
# 			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[4]/div[4]/div/div/div[1]/input").click #P&L - Service line drop down
# 				browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(5) > div:nth-child(4) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "00" #enters a selection
# 					browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(5) > div:nth-child(4) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
#
# 			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[5]/div[1]/div/div/div[1]/input").click #Balance Sheet - Department line drop down
# 				browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(7) > div:nth-child(1) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "00" #enters a selection
# 					browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(7) > div:nth-child(1) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
#
# 			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[5]/div[2]/div/div/div[1]/input").click #Balance Sheet - Root account drop down
# 				browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(7) > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "1250" #enters a selection
# 					browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(7) > div:nth-child(2) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
#
# 			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[5]/div[3]/div/div/div[1]/input").click #Balance Sheet - Product line drop down
# 				browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(7) > div:nth-child(3) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "00" #enters a selection
# 					browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(7) > div:nth-child(3) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
#
# 			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[1]/div[5]/div[4]/div/div/div[1]/input").click #Balance Sheet - Service line drop down
# 				browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(7) > div:nth-child(4) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys "00" #enters a selection
# 					browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(2) > div:nth-child(7) > div:nth-child(4) > div > div > div.selectize-input.items.not-full.has-options > input[type='text']").send_keys :return #selects the selection
#
# 	#Billing Rules
# 			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[2]/div[1]/div/div/div[1]/label/span").click #Rule type selections
# 				browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[2]/div[1]/div/div/div[2]/label/span").click #Event option
# 					browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[2]/div[1]/div/div/div[3]/label/span").click #PerDiem option
# 			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[2]/div[1]/div/div/div[1]/label/span").click #Clicks "Time" again
#
# 	#Billing Frequency Limits - THIS WAS REMOVED FROM THE ADD SERVICE SCREEN
# 			#browser.find_element(id: "min-units").click #Min units field focus
# 				#browser.find_element(id: "min-units").send_keys "25" #Enters Min units
# 			#browser.find_element(id: "max-units").click #Max units field focus
# 				#browser.find_element(id: "max-units").send_keys "95" #Enters Max units
# 			#browser.find_element(id: "billing-limits").click #Puts focus a field
#
# 			browser.find_element(id: "billing-limits").click #Field focus for billing frequencies
# 			browser.find_element(id: "billing-limits").click #Field focus for billing frequencies
# 				browser.find_element(id: "billing-limits").send_keys "14" #enters a selection
# 					#browser.find_element(id: "billing-limits").send_keys :return #selects the selection
# 			#browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[2]/div[2]/div[3]/div/div/div[1]").click #Per drop down
# 			browser.find_element(id: "add-frequency").click #Clicks "Apply Frequency Limits button"
#
# 	#Define Measure
# 			browser.find_element(id: "ServiceModel_NumberOfUnits").click #Number of units field focus
# 				browser.find_element(id: "ServiceModel_NumberOfUnits").send_keys "1000" #Enters Min units
# 			browser.find_element(id: "ServiceModel_Duration").click #Duration (minutes) field focus
# 				browser.find_element(id: "ServiceModel_Duration").send_keys "5" #Enters duration minutes units
# 			browser.find_element(id: "ServiceModel_DurationFloor").click #Duration Floor (minutes) field focus
# 				browser.find_element(id: "ServiceModel_DurationFloor").send_keys "15" #Enters duraction floor units
# 			browser.find_element(id: "ServiceModel_DurationCeiling").click #Duration Ceiling (minutes) field focus
# 				browser.find_element(id: "ServiceModel_DurationCeiling").send_keys "25" #Enters duration ceiling units
#
# 	#Request Start and End Time (By default, switch is NO - Comment the below line out if you want this to be true)
# 			browser.find_element(xpath: "//*[@id='model_time']/div/div/label[2]/span").click #Switches to YES
#
# 	#Authorization Rules (By default, switch is NO - Comment any of the below lines out if you want this to be true)
# 			browser.find_element(xpath: "//*[@id='bundling_vue']/div[1]/div[1]/div/label[2]/span").click #Required authorization; switches to YES
# 				browser.find_element(xpath: "//*[@id='bundling_vue']/div[2]/div/div/label[2]/span").click #Requiree Referral for authorization; switches to YES
# 					browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[3]/div[2]/div/div/label[2]/span").click #Requires Diagnosis; switches to YES
# 	#Authorization Type
# 			browser.find_element(xpath: "//*[@id='bundling_vue']/div[1]/div[2]/div[2]/label/span").click #Sets to "Unmanaged" which lights up "Allow Bundle Authorizations"
# 				#Allow Bundled Authorization switch - By default, it's NO - Comment the below line out if wanting to keep NO selected
# 				browser.find_element(xpath: "//*[@id='bundling_vue']/div[2]/div[2]/div/div/label[2]/span").click #Switches "Allow Bundled Authorization" to YES
#
# 	#Enforce (under Authorization Rules)
# 			browser.find_element(id: "enforcement-limit").click #Limit field focus
# 				browser.find_element(id: "enforcement-limit").send_keys "35" #Enters limit amount
# 			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[3]/div[3]/div[2]/div/div/div[1]/input").click #Per drop down
# 				browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[3]/div[3]/div[2]/div/div/div[1]/input").send_keys "Day"
# 				#browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(3) > div:nth-child(4) > div:nth-child(3) > div > div > div.selectize-input.items.has-options.full.has-items").send_keys "14" #enters a selection
# 					#browser.find_element(css: "body > div > div.page-content > div > form > section:nth-child(3) > div:nth-child(4) > div:nth-child(3) > div > div > div.selectize-input.items.has-options.full.has-items").send_keys :return #selects the selection
# 			browser.find_element(id: "add-limit").click #Clicks "Apply Frequency Limits button"
#
# 	#Clinical Rules (By default, all switches are set to NO)
# 			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[4]/div[1]/div[1]/div/label[2]/span").click #QA Review Required; switches to YES
# 				browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[4]/div[2]/div[1]/div/label[2]/span").click #Entry for Multiple Staff; switches to YES
# 					browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[4]/div[3]/div[1]/div/label[2]/span").click #Entry for Multiple Clients; switches to YES
# 						browser.find_element(xpath: "//*[@id='services_vue']/div[1]/div[1]/div/label[2]/span").click #Attending Provider Required; switches to YES
# 						browser.find_element(xpath: "//*[@id='services_vue']/div[2]/div[1]/div/div/div/label[2]/span").click #Provisionally Licensed OK; switches to YES
# 							browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[4]/div[2]/div[2]/div/label[2]/span").click #Calocus / Locus Required; switches to YES
# 								browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[4]/div[3]/div[2]/div/label[2]/span").click #Link to PCP or SP; switches to YES
# 									browser.find_element(xpath: "//*[@id='services_vue']/div[1]/div[2]/div/label[2]/span").click #Note Required; switches to YES
# 								#If above line is YES, Note Type field appears
# 									browser.find_element(xpath: "//*[@id='services_vue']/div[2]/div[2]/div/div/div/div[1]/label/span").click #PIE note type
# 									browser.find_element(xpath: "//*[@id='services_vue']/div[2]/div[2]/div/div/div/div[2]/label/span").click #NB note type
# 									browser.find_element(xpath: "//*[@id='services_vue']/div[2]/div[2]/div/div/div/div[3]/label/span").click #EM note type
# 				#Encounter Type (By default, set to "FTF")
# 					#browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[4]/div[1]/div[2]/div[2]/label/span").click
# 						#browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[4]/div[1]/div[2]/div[1]/label/span").click
#
# 	#Rounding Rules
# 		#Service Type
# 			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[5]/div/div[1]/div/div[1]/label/span").click #Unit option
# 				browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[5]/div/div[1]/div/div[2]/label/span").click #Time option
# 		#Always Round
# 			browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[5]/div/div[2]/div/div[1]/label/span").click #Up option
# 				browser.find_element(xpath: "/html/body/div/div[2]/div/form/section[5]/div/div[2]/div/div[2]/label/span").click #Down option
#
#
# sleep(1)
#
# 			#Saves the Service
# 				browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div/ul/li[2]/button").click
# 					browser.find_element(xpath: "/html/body/div[1]/div[2]/div/form/div/ul/li[2]/button").click
# =begin
#
# 	#wait.until(ExpectedConditions.elementToBeClickable(By.class "selectize-control"));
# 	#/WebDriverWait wait = new WebDriverWait(webDriver, timeoutInSeconds);
# 	#wait.until(ExpectedConditions.visibilityOfElementLocated(By.class "selectize-control"));/
# 	#browser.find_element(link_text: "Images").click
# 	#browser.find_elements(tag_name: "img").size
#
# 		#Logout
# 			browser.find_element(id: "signout-icon").click
#
# =end
#
# browser.close
