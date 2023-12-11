variable "project" { 
    type = string
    default ="{{cookiecutter.project_name}}" 
  
}

variable "app_id" { 
    type = string
    default ="{{cookiecutter.app_id}}"
  
}

variable "region" { 
    type = string
    default ="{{cookiecutter.region}}"
  
}
