
## Using TAS (PCF) SSO plan and TAS Spring Cloud Gateway to protect a static website.

# create a website

npx @docusaurus/init@next init my-website classic

# set the baseurl in docusaurus.config.ja
Note the use of a  baseurl is required for use with the sprint cloud gateway service.

```
baseUrl: '/site1/'
```

# build the site

npm run build

# push to pcf (see manifest.yml file)

Note the use of an 'internal' route. This means the application will not be accessible other than through the gateway.

```
cf push
```

# create the sso plan ( p-identity.<system-domain>)

# create the sso service instance based on the plan

# manage the service instance and register a new app.

Set the redirect uri to your app based on the gateway name (see below)
eg. 
s1g.<apps-domain>/site1/login

Your sso plan will either have an identity provider conifgured eg. ldap or you will have to manage users.

- create an app with enough admin privilidges (see service-to-service type)


# create the gateway instance and bind to the app
```
cf create-service p.gateway standard site1-gateway -c '{ "sso": { "plan": "angular" }, "host":"s1g" }'

cf bs site1 site1-gateway -c ./static-route.json

cf restage site1
```




# Website

This website is built using [Docusaurus 2](https://v2.docusaurus.io/), a modern static website generator.

### Installation

```
$ yarn
```

### Local Development

```
$ yarn start
```

This command starts a local development server and open up a browser window. Most changes are reflected live without having to restart the server.

### Build

```
$ yarn build
```

This command generates static content into the `build` directory and can be served using any static contents hosting service.

### Deployment

```
$ GIT_USER=<Your GitHub username> USE_SSH=true yarn deploy
```

If you are using GitHub pages for hosting, this command is a convenient way to build the website and push to the `gh-pages` branch.
# pcf-static-site-sso
