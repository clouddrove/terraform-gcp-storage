## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes (e.g. `1`). | `list(string)` | `[]` | no |
| bucket\_id | Used to find the parent resource to bind the IAM policy to | `string` | `""` | no |
| cors | The bucket's Cross-Origin Resource Sharing (CORS) configuration. Multiple blocks of this type are permitted. | `any` | `[]` | no |
| default\_event\_based\_hold | (Optional) Whether or not to automatically apply an eventBasedHold to new objects added to the bucket. | `bool` | `null` | no |
| default\_kms\_key\_name | The bucket's encryption configuration | `string` | `null` | no |
| enabled | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| force\_destroy | When deleting a bucket, this boolean option will delete all contained objects. If you try to delete a bucket that contains objects, Terraform will fail that run. | `bool` | `true` | no |
| google\_storage\_bucket\_iam\_member\_enabled | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| label\_order | Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] . | `list(any)` | `[]` | no |
| lifecycle\_rules | The bucket's Lifecycle Rules configuration. | `any` | `[]` | no |
| location | (Required) The GCS location. | `string` | n/a | yes |
| logging | The bucket's Access & Storage Logs configuration. | `any` | `null` | no |
| member | Identities that will be granted the privilege in role | `string` | `""` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| project\_id | GCS Project ID. | `string` | `""` | no |
| public\_access\_prevention | Prevents public access to a bucket. Acceptable values are `inherited` or `enforced`. If `inherited`, the bucket uses public access prevention. only if the bucket is subject to the public access prevention organization policy constraint. Defaults to `inherited`. | `string` | `""` | no |
| requester\_pays | Enables Requester Pays on a storage bucket | `string` | `true` | no |
| retention\_policy | Configuration of the bucket's data retention policy for how long objects in the bucket should be retained. | `any` | `null` | no |
| storage\_class | (Required if action type is SetStorageClass) The target Storage Class of objects affected by this Lifecycle Rule. Supported values include: STANDARD, MULTI\_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE. | `string` | `"STANDARD"` | no |
| uniform\_bucket\_level\_access | Enables Uniform bucket-level access access to a bucket. | `bool` | `true` | no |
| versioning | The bucket's Versioning configuration. | `bool` | `true` | no |
| website | Map of website values. Supported attributes: main\_page\_suffix, not\_found\_page | `map(any)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket | All attributes of the created `google_storage_bucket` resource. |
| id | GCS bucket id. |
| name | GCS bucket name. |
| self\_link | URI of the GCS bucket. |
| url | The base URL of the bucket, in the format gs://<bucket-name> |

