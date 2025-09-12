terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.3.0"
    }
  }
}

variable "filename" {
  type    = list(string)
  default = ["file1.txt", "file2.txt", "file3.txt"]
}

resource "local_file" "pet" {
  for_each = toset(var.filename)
  filename = each.value
  content  = "Hello Terraform"
}
