#!/bin/sh
oc get secret htpasswd-secret -ojsonpath={.data.htpasswd} -n openshift-config | base64 --decode > users.htpasswd
curl https://raw.githubusercontent.com/alexgroom/rhods-od-deploy/htpasswd/htpasswd >> users.htpasswd
oc create secret generic htpasswd-secret --from-file=htpasswd=users.htpasswd --dry-run=client -o yaml -n openshift-config | oc replace -f -
oc adm policy add-cluster-role-to-user cluster-admin opentlc-mgr
rm users.htpasswd

