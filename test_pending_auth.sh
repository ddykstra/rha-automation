DIR=$(pwd)
export USERNAME='rhadevadmin@rhadev.onmicrosoft.com'
export PASSWORD='RHAdev9892'
export ENVIRONMENT_UNDER_TEST='https://rha.azurewebsites.net/'
export CLIENT_FIRST_NAME='Armando'
export CLIENT_LAST_NAME='Ryan'
ruby /Users/jakejohnson/Development/rha-automation/Clients/AddSearchSelectClients/addClient.rb &
wait
ruby /Users/jakejohnson/Development/rha-automation/Clients/Referrals/addReferral.rb &
wait
ruby /Users/jakejohnson/Development/rha-automation/Clients/Assignments/addAssignments.rb &
wait
ruby /Users/jakejohnson/Development/rha-automation/Clients/Payers/addPayers.rb &
wait
ruby /Users/jakejohnson/Development/rha-automation/Clients/Authorizations/addPendingManagedAuthorization.rb &
wait
cd Clients/ClinicalCharts/
ruby addClinicalProgressNote.rb &
cd $DIR
wait
cd Bar/
ruby pending_authorization.rb &
wait
cd $DIR
