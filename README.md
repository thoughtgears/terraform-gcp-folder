# GCP Folder module

![Terraform Version](https://img.shields.io/badge/tf-%3E%3D1.0.x-blue.svg)

## Usage

```hcl
module "my" {
  source  = "git::git@github.com:thoughtgears/terraform-gcp-folder.git?ref=latest"

  folder = {
    name = "folder1"
  }

  organization_id = "1234"
  
  permissions = {
    roles/viewer = ["user:user@example.com"]
  }
}
```

## What's in this repo

This repo has the following folder structure:

- [examples](https://github.com/thoughtgears/terraform-gcp-folder/examples): The example folder contains an one or more examples of how to use the modules.

- [root](https://github.com/thoughtgears/terraform-gcp-folder/blob/main): This root contains the module code.

- [test](https://github.com/thoughtgears/terraform-gcp-folder/blob/main/test): Automated tests modules and examples.

## What's a Module?

A Module is a canonical, reusable, best-practices definition for how to run a single piece of infrastructure, such as a database or server cluster.  
Each Module is written using a combination of [Terraform](https://www.terraform.io/) and scripts (mostly bash) and include automated tests, documentation, and examples.  
It is maintained both by the open source community and companies that provide commercial support.

Instead of figuring out the details of how to run a piece of infrastructure from scratch, you can reuse  existing code that has been proven in production.  
And instead of maintaining all that infrastructure code yourself, you can leverage the work of the Module community to pick up infrastructure improvements through a version number bump.

## How is this Module versioned?

This Module follows the principles of [Semantic Versioning](http://semver.org/). You can find each new release, along with the changelog, in the [Releases Page](https://github.com/thoughtgears/gcp-xxx-modules/releases).

During initial development, the major version will be 0 (e.g., `0.x.y`), which indicates the code does not yet have a stable API.  
Once we hit `1.0.0`, we will make every effort to maintain a backwards compatible API and use the MAJOR, MINOR, and PATCH versions on each release to indicate any incompatibilities.

## Module resource documentation

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_folder.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |
| [google_folder_iam_binding.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder_iam_binding) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_folder"></a> [folder](#input\_folder) | An object for the folder:<br>name = string<br>parent\_folder = folder\_id<br><br>If the parent folder is not present, it will use the organization as a part and put it at the top level of the organization | <pre>object({<br>    name          = string<br>    parent_folder = optional(string)<br>  })</pre> | n/a | yes |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | Google Cloud Platform Organization ID | `string` | n/a | yes |
| <a name="input_permissions"></a> [permissions](#input\_permissions) | A map of role type with a list of members to set authoritative permissions on the folder | `map(list(string))` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_folder_id"></a> [folder\_id](#output\_folder\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END_TF_DOCS -->