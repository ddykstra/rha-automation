export USERNAME='rhadevadmin@rhadev.onmicrosoft.com'
export PASSWORD='RHAdev9892'
export ENVIRONMENT_UNDER_TEST='https://rha.azurewebsites.net/'
export CLIENT_FIRST_NAME='Lars'
export CLIENT_LAST_NAME='Ulrich'
ruby /Users/jakejohnson/Development/rha-automation/Clients/AddSearchSelectClients/addClient.rb &
wait
ruby /Users/jakejohnson/Development/rha-automation/Clients/Referrals/addReferral.rb &
wait
ruby /Users/jakejohnson/Development/rha-automation/Clients/Assignments/addAssignments.rb &
wait
ruby /Users/jakejohnson/Development/rha-automation/Clients/Payers/addPayers.rb &
wait
ruby /Users/jakejohnson/Development/rha-automation/Clients/Authorizations/addManagedAuthorization.rb
