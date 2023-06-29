### Custom Validation Rules

```
variable "short_variable" {
  type = string

  validation {
    condition = length(var.short_variable) < 4
    error_message = "The short_variable value must be less than 4 characters!"
  }
}
```

## External


- [tflint](https://github.com/terraform-linters/tflint)
- [checkov](https://github.com/bridgecrewio/checkov)
- [terrascan](https://github.com/accurics/terrascan)
- [terraform-compliance](https://terraform-compliance.com/)
- [snyk](https://support.snyk.io/hc/en-us/articles/360010916577-Scan-and-fix-security-issues-in-your-Terraform-files)
- [Terraform Sentinel](https://www.terraform.io/docs/cloud/sentinel/index.html)
