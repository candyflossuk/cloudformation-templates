#!/bin/bash
# A script to create a stack from existing resources - template shown

# run GetTemplateSummary to learn which properties identify each resource type
# in th template.

aws cloudformation get-template-summary
    --template-body file://templateToImport.json

# Composse a list of the target resources your template and their unique ids
# "[{\"ResourceType\":\"AWS::DynamoDB::Table\",\"LogicalResourceId\":\"GamesTable\",\"ResourceIdentifier\":{\"TableName\":\"Games\"}}]"

aws cloudformation create-change-set
    --stack-name TargetStack --change-set-name ImportChangeSet
    --change-set-type IMPORT
    --resources-to-import "[{\"ResourceType\":\"AWS::DynamoDB::Table\",\"LogicalResourceId\":\"GamesTable\",\"ResourceIdentifier\":{\"TableName\":\"Games\"}},{\"ResourceType\":\"AWS::DynamoDB::Table\",\"LogicalResourceId\":\"ServiceTable\",\"ResourceIdentifier\":{\"TableName\":\"Service\"}}]"
    --template-body file://templateToImport.json

# Review changes
aws cloudformation describe-change-set --change-set-name ImportChangeSet

# Run the change set to import the resources
aws cloudformation execute-change-set --change-set-name ImportChangeSet

# Run drift detection on the IMPORT_COMPLETE stack to make sure the
# template and actual configuration of the imported resources match
aws cloudformation detect-stack-drift --stack-name TargetStack
{ "Stack-Drift-Detection-Id" : "624af370-311a-11e8-b6b7-500cexample" }

aws cloudformation describe-stack-drift-detection-status --stack-drift-detection-id 624af370-311a-11e8-b6b7-500cexample

aws cloudformation describe-stack-resource-drifts --stackname TargetStack
