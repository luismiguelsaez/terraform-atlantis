
https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip

./ngrok http 4141

https://www.runatlantis.io/guide/testing-locally.html#create-a-webhook-secret
https://github.com/luismiguelsaez/terraform-atlantis/settings/hooks/new
    - Payload URL: https://d0a2dfeb9617.ngrok.io
    - Content type: application/json
    - Secret: 0986578714

https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/#creating-a-token

```
export SECRET=0986578714
export TOKEN=7e4535f2897f0fa747962fc7f0574da10ddce745
export USERNAME=luismiguelsaez
export REPO_ALLOWLIST="github.com/luismiguelsaez/terraform-atlantis"
```

```
docker run --rm \
runatlantis/atlantis:v0.15.1 server --default-tf-version 0.13.4 \
--atlantis-url="https://d0a2dfeb9617.ngrok.io" \
--gh-user="$USERNAME" \
--gh-token="$TOKEN" \
--gh-webhook-secret="$SECRET" \
--repo-allowlist="$REPO_ALLOWLIST"
```

```
docker run --rm \
    -v $PWD/terraform:/terraform \
    -e AWS_ACCESS_KEY_ID \
    -e AWS_SECRET_ACCESS_KEY \
    -e AWS_DEFAULT_REGION \
    -w /terraform \
    --user 1000:1000 \
    hashicorp/terraform:0.13.4 init
```
