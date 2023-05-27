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
    
