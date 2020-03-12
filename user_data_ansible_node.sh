#!/bin/bash
cretecred=`aws secretsmanager create-secret --name MyAnsibleSecretCred --description "My public key of ansible master" --secret-string file://mycreds.json --region us-east-1`
passkeytonode=`aws secretsmanager get-secret-value --secret-id MyAnsibleSecretCred --region us-east-1 | jq ".SecretString" | sed 's/\\n //g; s/\ \n//g; s/\\"/"/g; s/"\\n/"/g; s/^"//; s/"$//' | jq ".pub_key" | sed 's/\"//g' >> ~/.ssh/authorized_keys`
