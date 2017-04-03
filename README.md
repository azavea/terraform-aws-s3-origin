# terraform-aws-s3-origin
A Terraform module to create an origin S3 bucket (for use with CloudFront) with read-only access for anonymous users.

# Usage
```hcl
module "static_site" {
  source                      = "github.com/azavea/terraform-aws-s3-origin?ref=0.1.0"
  bucket_name                 = "mysite-bucket"
  logs_bucket_name             = "mysite-logs-bucket"
  project                     = "Unknown"
  environment                 = "Unknown"
  region                      = "us-east-1"
}


#
# Cloudfront Distribution
#
resource "aws_cloudfront_distribution" "site" {
  origin {
    domain_name = "${module.static_site.site_bucket}.s3.amazonaws.com"
    origin_id   = "SwaggerSiteOriginEastId"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }
...

}
```


# Variables
`bucket_name` - Name of bucket where the site will be hosted.
`logs_bucket_name` - Name of the access logs bucket.
`project` - Name of the project that this site is for (default: `Unknown`)
`environment` - Name of the environment this site is targeting (default: `Unknown`)
`region`  - Name of the region where buckets should be created (default: `us-east-1`)

# Outputs
`site_bucket` - Name of the site bucket
`logs_bucket` - Name of the logs bucket

