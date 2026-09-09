#!/bin/bash
docker pull yuvanbalaviswanathan/reactjs-e-commerce-prod:prod
docker stop reactjs-ecommerce-prod || true
docker rm reactjs-ecommerce-prod || true
docker run -d --name reactjs-ecommerce-prod -p 80:80 yuvanbalaviswanathan/reactjs-e-commerce-prod:prod
