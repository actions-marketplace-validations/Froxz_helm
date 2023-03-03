FROM node:lts-alpine3.17

RUN apk add --no-cache --update git curl bash openssl && \
    rm -rf /var/cache/apk/* && \
    curl -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod +x get_helm.sh && \
    ./get_helm.sh

COPY . /usr/src/

RUN npm ci --prefix /usr/src

ENTRYPOINT ["node", "/usr/src/index.js"]
