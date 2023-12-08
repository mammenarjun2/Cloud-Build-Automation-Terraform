variable "project" { 
    type = string
    default = "{{ cookiecutter.gcp_project }}"
  
}

variable "app_id" { 
    type = string
    default = "{{ cookiecutter.app_id }}"
  
}

variable "region" { 
    type = string
    default = "{{ cookiecutter.region }}"
  
}
