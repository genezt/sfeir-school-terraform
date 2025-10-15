# Sfeir Institute Terraform

## Module-4 : Tooling

### IDE plugins

#### VScode

Add Terraform extension (from HashiCorp) for VScode

## Generate Documentation

You can use [terraform-docs](https://github.com/terraform-docs/terraform-docs) to parse your code and generate the documentation.

-> Install terraform-docs in your Cloud Shell by following the instructions in the README of the project or on the [website](https://terraform-docs.io/user-guide/installation/#pre-compiled-binary).

### Quick and dirty documentation generation

With `terraform-docs md . > DOCS.md`, you will create/update your documentation in a file named DOCS.md.
But if you manually modify DOCS.md to add useful information to use your module, these modification will be overwritten with the next execution of the command.

-> Generate a first version of the documentation using terraform-docs.

### A better way to generate a (manually editable) documentation

With `terraform-docs --output-mode inject md . --output-file DOCS.md`,
you will create/update your documentation in the DOCS.md,
but terraform-docs will only update the content between BEGIN_TF_DOCS/END_TF_DOCS tags.
So you can freely edit the DOCS.md before BEGIN_TF_DOCS or after END_TF_DOCS.

-> Modify your DOCS.md file and add a title to your document.
-> Add the required tags so that terraform-docs update only the content it generates.

### The ultimate way to generate documentation

-> Create a `.terraform-docs.yml` configuration file in your project to make `--output-mode inject` `md`
and `--output-file DOCS.md` the default behaviour.

More information : https://terraform-docs.io/user-guide/configuration/

Hints: Generate content with `terraform-docs markdown table .`.

## Add an input

-> Expose the bucket's name as an input at the right place following best practices
and regenerate the doc.

## Add a provider

-> Add the provider `random` in the `providers.tf` file and regenerate the doc.

## Add an output

-> Use the random provider to add a random hexadecimal suffix to the bucket name,
expose the bucket's name as an output at the right place following best practices
and regenerate the doc.

Hints: Use `random_id` from the hashicorp `random` provider.


#### Bonus

-> Add a `terraform.tfvars` file to specify a name for your bucket.
Plan then apply the changes. See the bucket's name in the result of the apply and in the Cloud Console.
Finally, clean the resources with a destroy.

-> Try to only show the `providers`, `inputs` and `outputs` sections.
