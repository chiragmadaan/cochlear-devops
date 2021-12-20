## About the app
Actually, there are two separated apps. The Client which serves the FrontEnd (using React), and the API (in Node/Express).

## How to run the API and Client using docker-compose
1. In your terminal, navigate to the root directory of the project.
2. Run `sudo docker-compose up --build -d` to build the docker images and run them.


## Check if they are connected
1. With the two apps running, in your browser open http://localhost:3000/.
2. If you see a webpage saying `Welcome to React`, it means the FrontEnd is working.
3. If the same webpage has the phrase `API is working properly`, it means the API is working.


## How to end the docker session
1. In your terminal, navigate to the root directory of the project.
2. Run `sudo docker-compose down` to shut down all the containers.


## About the docker files
1. `api/Dockerfile` uses the base node image, installs the dependencies, exposes the port 9000, copies all the required files, and then starts the backend service.
2. `client/Dockerfile` uses the base node image, installs the dependencies, exposes the port 3000, copies all the required files, and then starts the frontend service.
3. `./docker-compose.yml` builds the backend service, frontend service, and a new common network for communication.


## ECR + Terraform
Terraform code is in `main.tf`. For security reasons, the AWS account numbers have been replaced by generic placehold text.
1. Command to initiate terraform is `terraform init`
2. Command to create resources is `terraform apply -auto-approve`. Make sure AWS CLI is configured.
3. The command to login to ECR from the Cochlear AWS account is `aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin chirag-account-id.dkr.ecr.ap-southeast-2.amazonaws.com`. Make sure an IAM role exists that allows the secondary AWS account to access the ECR service.