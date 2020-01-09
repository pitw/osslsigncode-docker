# osslsigncode Image for Gitlab CI
A simple Docker container for running
[osslsigncode](https://sourceforge.net/projects/osslsigncode/) in Gitlab

# Example Config in gitlab.ci

```
SignWindowsExe:
  stage: sign
  image:
    name: pitwch/osslsigncode-docker
    entrypoint: [""]
  script:
    - osslsigncode -certs $SIGN_CERT_CRT
        -key $SIGN_CERT_PRIVATE -i https://www.example.com
        -in win-amd64/unsigned.exe
        -out win-amd64/$EXECUTABLE_NAME.exe
        -pass $SIGN_PASSWORD
        -n $EXECUTABLE_NAME
        -t http://timestamp.comodoca.com
        -h sha256
  artifacts:
    paths:
      - win-amd64/$EXECUTABLE_NAME.exe
  only:
    - tags
    - triggers
    - schedules

```

# Example Config with DualSign

```
SignWindowsExe:
  stage: sign
  image:
    name: pitwch/osslsigncode-docker
    entrypoint: [""]
  script:
    - osslsigncode -certs $SIGN_CERT_CRT
        -key $SIGN_CERT_PRIVATE -i https://www.pitw.ch
        -in win-amd64/unsigned.exe
        -out win-amd64/intermediate.exe
        -pass $SIGN_PASSWORD
        -n $EXECUTABLE_NAME
        -t http://timestamp.comodoca.com
        -h sha1 
    - osslsigncode -certs $SIGN_CERT_CRT
        -key $SIGN_CERT_PRIVATE -i https://www.pitw.ch
        -in win-amd64/intermediate.exe
        -out win-amd64/$EXECUTABLE_NAME.exe
        -pass $SIGN_PASSWORD
        -n $EXECUTABLE_NAME
        -t http://timestamp.comodoca.com
        -nest
        -h sha2
  artifacts:
    paths:
      - win-amd64/$EXECUTABLE_NAME.exe
  only:
    - tags
    - triggers
    - schedules
 ```
