resource "aws_s3_bucket" "demobucket" {
  bucket = "my-demo-bucket"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = "my-kms"
      }

    }
  }

  logging {
    target_bucket = "logging-bucket"
  }
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_public_access_block" "demobucketpublicaccessblock" {
  bucket                  = aws_s3_bucket.demobucket.id
  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}
