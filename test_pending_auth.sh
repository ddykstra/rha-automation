DIR=$(pwd)
export USERNAME='rhadevadmin@rhadev.onmicrosoft.com'
export PASSWORD='RHAdev9892'
export ENVIRONMENT_UNDER_TEST='https://rha.azurewebsites.net/'
export CLIENT_FIRST_NAME='Mario'
export CLIENT_LAST_NAME='Gordon'
cd Clients/AddSearchSelectClients/
ruby addClient.rb &
cd $DIR
wait
cd Clients/Referrals/
ruby addReferral.rb &
cd $DIR
wait
cd Clients/Assignments/
ruby addAssignments.rb &
cd $DIR
wait
cd Clients/Payers/
ruby addPayers.rb &
cd $DIR
wait
cd Clients/Authorizations/
ruby addPendingManagedAuthorization.rb &
cd $DIR
wait
cd Clients/ClinicalCharts/
ruby addClinicalProgressNote.rb &
cd $DIR
wait
cd Bar/
ruby pending_authorization.rb &
wait
cd $DIR
