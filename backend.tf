terraform {
  backend "s3" {
    bucket       = "thisismyterraformbucket2026"
    key          = "demoEFS/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}