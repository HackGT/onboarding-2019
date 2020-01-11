FROM ruby:2.4.1
WORKDIR /workspace
ADD . .
RUN "gem update --system"
RUN "./docker_resources/build.sh"

FROM nginx:stable-alpine
COPY --from=0 /workspace/_site/ /usr/share/nginx/html/