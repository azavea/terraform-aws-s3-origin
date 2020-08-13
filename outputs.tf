output "site_bucket" {
  value = aws_s3_bucket.site_bucket.id
}

output "site_bucket_regional_domain_name" {
  value = aws_s3_bucket.site_bucket.bucket_regional_domain_name
}

output "logs_bucket" {
  value = aws_s3_bucket.access_logs_bucket.id
}
