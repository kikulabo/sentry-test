/*
[Providers Within Modules \- Configuration Language \- Terraform by HashiCorp](https://www.terraform.io/docs/language/modules/develop/providers.html)
Note:
 Only provider configurations are inherited by child modules, not provider source or version requirements.
 Each module must declare its own provider requirements.
 This is especially important for non-HashiCorp providers.
*/
terraform {
  required_providers {
    sentry = {
      source = "jianyuan/sentry"
      version = "0.7.0"
    }
  }
}

