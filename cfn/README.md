## Pipeline Deployment

Before run the Cloud Formation template to deploy the CI-CD Pipeline create a github connection

### Create the GitHub connection

```bash
aws codestar-connections create-connection --provider-type GitHub --connection-name MyConnection
```

https://docs.aws.amazon.com/codepipeline/latest/userguide/connections-github.html

### Deploy the pipeline

Change the variables OWNER/REPO to your GitHub account and repository e.g. `owner/repo` and replace the ARN_GITHUB_CONNECTION variable for your github connection ARN e.g. `arn:aws:codestar-connections:eu-west-1:1234456789:connection\\/111111-aaaaa-bbbbb-ccccc-222222`

```
aws cloudformation create-stack --profile mgmt-acc \
 --stack-name cicd-testing \
 --template-body file://${PWD}/cfn/pipeline.yaml \
 --capabilities CAPABILITY_IAM \
 --parameters
    ParameterKey=RepositoryName,
    ParameterValue=(OWNER/REPO)
    ParameterKey=GitHubConnectionARN,
    ParameterValue=(ARN_GITHUB_CONNECTION)
```
