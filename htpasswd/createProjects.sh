# !/bin/sh
# parametr 1 is the OpenShift API URL 
for i in {1..30}
do
    oc login $1 -u user$i -p openshift
    oc new-project od-user$i
    oc logout
done