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
