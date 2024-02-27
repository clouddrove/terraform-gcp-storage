<!-- This file was automatically generated by the `geine`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->

<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform gcp storage
</h1>

<p align="center" style="font-size: 1.2rem;"> 
    Terraform module to create default storage bucket with.
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v1.1.7-green" alt="Terraform">
</a>
<a href="LICENSE.md">
  <img src="https://img.shields.io/badge/License-APACHE-blue.svg" alt="Licence">
</a>
<a href="https://github.com/clouddrove/terraform-gcp-storage/actions/workflows/tfsec.yml">
  <img src="https://github.com/clouddrove/terraform-gcp-storage/actions/workflows/tfsec.yml/badge.svg" alt="tfsec">
</a>
<a href="https://github.com/clouddrove/terraform-gcp-storage/actions/workflows/terraform.yml">
  <img src="https://github.com/clouddrove/terraform-gcp-storage/actions/workflows/terraform.yml/badge.svg" alt="static-checks">
</a>


</p>
<p align="center">

<a href='https://facebook.com/sharer/sharer.php?u=https://github.com/clouddrove/terraform-gcp-storage'>
  <img title="Share on Facebook" src="https://user-images.githubusercontent.com/50652676/62817743-4f64cb80-bb59-11e9-90c7-b057252ded50.png" />
</a>
<a href='https://www.linkedin.com/shareArticle?mini=true&title=Terraform+gcp+storage&url=https://github.com/clouddrove/terraform-gcp-storage'>
  <img title="Share on LinkedIn" src="https://user-images.githubusercontent.com/50652676/62817742-4e339e80-bb59-11e9-87b9-a1f68cae1049.png" />
</a>
<a href='https://twitter.com/intent/tweet/?text=Terraform+gcp+storage&url=https://github.com/clouddrove/terraform-gcp-storage'>
  <img title="Share on Twitter" src="https://user-images.githubusercontent.com/50652676/62817740-4c69db00-bb59-11e9-8a79-3580fbbf6d5c.png" />
</a>

</p>
<hr>


We eat, drink, sleep and most importantly love **DevOps**. We are working towards strategies for standardizing architecture while ensuring security for the infrastructure. We are strong believer of the philosophy <b>Bigger problems are always solved by breaking them into smaller manageable problems</b>. Resonating with microservices architecture, it is considered best-practice to run database, cluster, storage in smaller <b>connected yet manageable pieces</b> within the infrastructure. 

This module is basically combination of [Terraform open source](https://www.terraform.io/) and includes automatation tests and examples. It also helps to create and improve your infrastructure with minimalistic code instead of maintaining the whole infrastructure code yourself.

We have [*fifty plus terraform modules*][terraform_modules]. A few of them are comepleted and are available for open source usage while a few others are in progress.




## Prerequisites

This module has a few dependencies: 






## Examples


**IMPORTANT:** Since the `master` branch used in `source` varies based on new modifications, we suggest that you use the release versions [here](https://github.com/clouddrove/terraform-gcp-storage/releases).


Here are some examples of how you can use this module in your inventory structure:
### Default Bucket
```hcl
module "bucket" {
source = "clouddrove/storage/google"
version     = "1.0.0"


name        = "storage-bucket"
environment = "test-main-bukcet"
label_order = ["name", "environment"]
location   = "US"
project_id = "clouddrove"

#website
website = {
main_page_suffix = "index.html"
not_found_page   = "404.html"
}

#logging
logging = {
log_bucket        = module.bucket_logs.bucket.id
log_object_prefix = "gcs-log"
}

#cors
cors = [{
origin          = ["http://image-store.com"]
method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
response_header = ["*"]
max_age_seconds = 3600
}]

# versioning
versioning = true

#lifecycle_rules
lifecycle_rules = [{
action = {
type          = "SetStorageClass"
storage_class = "NEARLINE"
}
condition = {
age                        = 60
created_before             = "2018-08-20"
with_state                 = "LIVE"
matches_storage_class      = ["STANDARD"]
num_newer_versions         = 10
custom_time_before         = "1970-01-01"
days_since_custom_time     = 1
days_since_noncurrent_time = 1
noncurrent_time_before     = "1970-01-01"
}
}]
}
```






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




## Testing
In this module testing is performed with [terratest](https://github.com/gruntwork-io/terratest) and it creates a small piece of infrastructure, matches the output like ARN, ID and Tags name etc and destroy infrastructure in your AWS account. This testing is written in GO, so you need a [GO environment](https://golang.org/doc/install) in your system. 

You need to run the following command in the testing folder:
```hcl
  go test -run Test
```



## Feedback 
If you come accross a bug or have any feedback, please log it in our [issue tracker](https://github.com/clouddrove/terraform-gcp-storage/issues), or feel free to drop us an email at [hello@clouddrove.com](mailto:hello@clouddrove.com).

If you have found it worth your time, go ahead and give us a ★ on [our GitHub](https://github.com/clouddrove/terraform-gcp-storage)!

## About us

At [CloudDrove][website], we offer expert guidance, implementation support and services to help organisations accelerate their journey to the cloud. Our services include docker and container orchestration, cloud migration and adoption, infrastructure automation, application modernisation and remediation, and performance engineering.

<p align="center">We are <b> The Cloud Experts!</b></p>
<hr />
<p align="center">We ❤️  <a href="https://github.com/clouddrove">Open Source</a> and you can check out <a href="https://github.com/clouddrove">our other modules</a> to get help with your new Cloud ideas.</p>

  [website]: https://clouddrove.com
  [github]: https://github.com/clouddrove
  [linkedin]: https://cpco.io/linkedin
  [twitter]: https://twitter.com/clouddrove/
  [email]: https://clouddrove.com/contact-us.html
  [terraform_modules]: https://github.com/clouddrove?utf8=%E2%9C%93&q=terraform-&type=&language=
