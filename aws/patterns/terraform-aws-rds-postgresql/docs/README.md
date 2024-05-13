## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider_aws) (5.37.0)

- <a name="provider_random"></a> [random](#provider_random) (3.6.0)

## Modules

The following Modules are called:

### <a name="module_standard_pg_db"></a> [standard_pg_db](#module_standard_pg_db)

Source: github.com/star3am/terraform-modules-library//aws/modules/terraform-aws-rds

Version: main

## Resources

The following resources are used by this module:

- [aws_db_parameter_group.standard_pg_parameters](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) (resource)
- [aws_db_subnet_group.standard_pg_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) (resource)
- [aws_security_group.standard_pg_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) (resource)
- [random_string.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) (resource)
- [aws_subnets.data_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) (data source)
- [aws_vpc.default_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) (data source)

## Required Inputs

No required inputs.

## Optional Inputs

No optional inputs.

## Outputs

No outputs.
