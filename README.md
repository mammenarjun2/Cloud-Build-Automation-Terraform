
# Cloud Build Automation

### What does it do?

Allows you to deploy a CI/CD with GCP using the native managed service Cloudbuild,
by taking care of the extra steps of configuring terraform,terraform state,cloudbuild configuration steps
and getting your Github repository connected to the pipline via terraform.


### Addtional notes

In the GCP console you head to https://console.cloud.google.com/cloud-build/repositories/
in your project and login to your Github and authenticate the repository you want to use.
Once the connection is complete Github will make a secret in secret manager called github-token-(random-values).
Copy out the secret and create a new sceret within secret manager in the console called **github-token** for your terraform to use. Ideally 
we don't want to create secrets via terraform.


### Features

- Cookiecutter auto fill Terraform (python library)
- Bash script to run Terraform and implement state into GCS


Install `cookiecutter` on your system:

```sh
pip3 install cookiecutter
```

Then run the below

```sh
cookiecutter https://github.com/mammenarjun2/testcloudbuild.git
```

![Image Alt Text](/design/Cloud_build_automation.png)

