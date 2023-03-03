FROM node:lts-alpine3.17

ENV BASE_URL="https://get.helm.sh"

RUN apk add --no-cache --update curl bash openssl && \
    rm -rf /var/cache/apk/* && \
    curl -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod +x get_helm.sh && \
    ./get_helm.sh

COPY . /usr/src/
ENTRYPOINT ["node", "/usr/src/index.js"]
