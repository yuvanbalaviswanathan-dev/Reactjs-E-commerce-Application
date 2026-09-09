# Reactjs E-commerce Application

This is a Reactjs E-commerce Application deployed using Docker, Jenkins, Docker Hub and AWS EC2.

## Technologies Used

- Reactjs
- Docker
- Docker Compose
- Jenkins
- GitHub
- Docker Hub
- AWS EC2
- Uptime Kuma

## Docker

The application is Dockerized using a Dockerfile and runs on port 80.

Docker image:

`reactjs-ecommerce:dev`

Docker Compose is also included in the project.

## Bash Scripts

- `build.sh` - Used to build the Docker image.
- `deploy.sh` - Used to deploy the production Docker image.

## Docker Hub

### Dev Repository

`yuvanbalaviswanathan/reactjs-e-commerce-dev`

- Tag: `dev`
- Public repository

### Prod Repository

`yuvanbalaviswanathan/reactjs-e-commerce-prod`

- Tag: `prod`
- Private repository

## Jenkins

Jenkins is used for the CI/CD process.

The Jenkins pipeline:

1. Gets the code from GitHub.
2. Builds the Docker image.
3. Pushes the image to Docker Hub.
4. Pushes the dev image from the `dev` branch.
5. Pushes the prod image from the `master` branch.
6. Deploys the production image to AWS EC2.

## GitHub Branches

- `dev` - Development branch
- `master` - Production branch

The `dev` branch is merged into the `master` branch for production deployment.

## AWS EC2

The application is deployed on an AWS EC2 `t2.micro` instance.

Application URL:

http://13.233.131.201

The application runs on HTTP port `80`.

## Monitoring

Uptime Kuma is used to monitor the application.

The application is monitored using an HTTP health check.

- Monitor: Reactjs E-commerce Application
- Check interval: 1 minute
- Status: 200 - OK

## Screenshots

All the project screenshots are available in the `Screenshot` folder.

The screenshots include:

- Jenkins Login
- Jenkins Configuration
- Jenkins Build Execution
- AWS EC2 Instance
- AWS Security Group
- Docker Hub Images
- Deployed Application
- Monitoring Health Status

## GitHub Repository

https://github.com/yuvanbalaviswanathan-dev/Reactjs-E-commerce-Application

## Conclusion

This project demonstrates Dockerization, GitHub version control, Jenkins CI/CD, Docker Hub image management, AWS EC2 deployment and application monitoring.
