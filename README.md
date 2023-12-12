
# Cloud Build Automation - Terraform

### What does it do?

Allows you to deploy a CI/CD using a templating library in python called cookiecutter with the natively managed service on the GCP platform called Cloud Build, by taking care of the extra steps of configuring terraform,terraform state,CI/CD yaml steps
and assisting in getting your Github repository connected to the pipeline via terraform.

### Features 

- Cookiecutter to auto fill Terraform (python library).
- Bash script to run Terraform and implement state into GCS bucket.


Install `cookiecutter` on your system:

```sh
pip3 install cookiecutter
```

Then run the below.

```sh
cookiecutter https://github.com/mammenarjun2/Cloud-Build-Automation-Terraform.git
```

Ensure you have access to the project in GCP you want to deploy this on.

```sh
gcloud auth application-default login
gcloud config set project {your_project_gcp}
```

Finally run **bash.sh** to deploy terraform. 
You can delete the script once it has completed.

![Image Alt Text](/design/Cloud_build_automation.png)

### Addtional Installation notes

In the GCP console you head to https://console.cloud.google.com/cloud-build/repositories/
in your project and login to your Github and authenticate the repository you want to use.
Once the connection is complete Github will create a secret in secret manager called github-token-(random-values).
Copy out the secret and create a new sceret within secret manager in the console called **github-token** for your terraform to use.
You can also then delete github-token-(random-values). Ideally we don't want to create secrets via terraform.

**Remove the connection made in https://console.cloud.google.com/cloud-build/repositories/ in the GCP console, so the
terraform can be applied**

In order to find your app_id head to **Github - Settings - Applications - Google Cloud Build (configure) - in the
URl of that page you will see the app_id e.g installations/22222222**