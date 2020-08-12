# terraform-aws-s3-origin

[![CircleCI](https://circleci.com/gh/azavea/terraform-aws-s3-origin.svg?style=svg)](https://circleci.com/gh/azavea/terraform-aws-s3-origin)

A Terraform module to create an origin S3 bucket (for use with CloudFront) with read-only access for anonymous users.

# Usage
```hcl
module "static_site" {
  source                      = "github.com/azavea/terraform-aws-s3-origin"
  bucket_name                 = "mysite-bucket"
  logs_bucket_name             = "mysite-logs-bucket"
  project                     = "Unknown"
  environment                 = "Unknown"
}


#
# Cloudfront Distribution
#
resource "aws_cloudfront_distribution" "site" {
  origin {
    domain_name = "${module.static_site.site_bucket}.s3.amazonaws.com"
    origin_id   = "SwaggerSiteOriginEastId"
  }
...

}
```


# Variables

- `bucket_name` - Name of bucket where the site will be hosted.
- `logs_bucket_name` - Name of the access logs bucket.
- `cors_allowed_headers` - Allowed CORS headers (default: `["Authorization"]`)
- `cors_allowed_methods` - Allowed CORS methods (default: `["GET"]`)
- `cors_allowed_origins` - Allowed CORS origins (default: `["*"]`)
- `cors_expose_headers` - Headers to expose in the response (default: `[]`)
- `cors_max_age_seconds` - Maximum seconds a browser can cache a response (default: `3000`)
- `project` - Name of the project that this site is for (default: `Unknown`)
- `environment` - Name of the environment this site is targeting (default: `Unknown`)
- `tags` - A mapping of keys and values to apply as tags to all resources that support them.

# Outputs

- `site_bucket` - Name of the site bucket
- `logs_bucket` - Name of the logs bucket

