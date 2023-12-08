
# Cloud build automation

### What does it do?

Allows you to deploy a CI/CD with GCP using the native managed service cloudbuild
with speed. Taking care of the extra steps of configuring terraform, state, cloudbuild steps
and getting your repository connected to the pipline.

### Features

- Cookiecutter auto fill Terraform (python library)
- Bash script to run Terraform and implement state into GCS


Install `cruft` on your system:

```sh
pip3 install cruft
```

Then run the below

```sh
cruft create https://github.com/mammenarjun2/testcloudbuild.git
```

![Image Alt Text](/design/Cloud_build_automation.png)

