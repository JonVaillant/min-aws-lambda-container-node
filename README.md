# AWS Lambda Node Container

## *(NO LONGER WORKING)*

This project was working for a few weeks but has since stopped working. As you will see if you read the code, this project is doing the bare minimum, and so it's quite surprising that it has broken so quickly.

It now produces the following error when tested in AWS: "Runtime.InvalidEntrypoint"

## About this project

The minimum you need to get Node running in a container using Amazon's image.

- **Note 1: this repository is not affiliated with Amazon.**
- **Note 2: Container images regularly break or become outdated and must be updated when resources are available.**

[Containers currently have about 10gb space to use,](https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-limits.html) whereas zip functions have about 250mb. So for many interesting use cases you will need to use a container.

This template exists because it is actually fairly hard to find pre-made lambda containers that work. Many lambda container images on GitHub don't work, including starter kits and templates. My theory is the other containers don't work because they don't use Amazon's image.


## Setup

### Local Setup

1. `docker build -t <image name> .`
    - or `docker build --platform linux/amd64 -t <image name> .` for arm
2. `docker run -p 9000:8080 <image name>`
3. `curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{"payload":"Hi"}'`


### Setup on AWS

1. Go to the AWS ECR Console (Elastic Container Registry)
    1. Go to Repositories
    2. Create a repository
    3. Click "view push commands" within the repository
    4. Run the commands the panel describes in a shell in the project folder
        - this builds the Docker container and pushes it to AWS ECR
2. Go to the AWS Lambda Console
    1. Go to Functions
    2. Create a function
        1. Choose "container image" at top
        2. Click "Browse Images"
        3. Click reload button and click "select repository"
        4. Select the repository and image
        5. Select the appropriate architecture etc
    3. Test
        1. Test with the test tab
        2. In configuration tab create a Function URL


## Reference

- [Docker image amazon/aws-lambda-nodejs](https://hub.docker.com/r/amazon/aws-lambda-nodejs)
