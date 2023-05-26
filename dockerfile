FROM node:latest

# Make directory to place the code of BKB.
RUN mkdir /etc/bkb

RUN npm i -g pnpm
ENV PNPM_HOME /bin

# Install waffle, mocha, chai with npm
WORKDIR /etc/bkb
COPY . /etc/bkb
RUN pnpm install -g truffle
RUN pnpm install --save-dev mocha chai ts-node typescript @types/mocha
