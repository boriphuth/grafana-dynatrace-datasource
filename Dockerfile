FROM grafana/grafana:latest

# # Add dynatrace plugin source
# ADD grafana-dynatrace-datasource /var/lib/grafana/plugins/grafana-dynatrace-datasource

USER root

# Install prerequisites
RUN apk update \
    && apk add gnupg \
    && apk add bash \
    && apk add --update nodejs npm \
    && npm install yarn -g

# Change into the dynatrace plugin directory
WORKDIR /var/lib/grafana/plugins/grafana-dynatrace-datasource

# Install dependencies and build the dynatrace plugin
# RUN npm install \
#     && npm run build \
#     && chown -R grafana:grafana /var/lib/grafana/plugins

# Bundle app source
COPY . .

USER grafana

WORKDIR /