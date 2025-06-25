resource "aws_instance" "bad_example" {
  ami                    = "ami-0c55b159cbfafe1f0"  
  instance_type          = "t2.large"              # Should fail by scp
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.ssh_sg.id]
  associate_public_ip_address = true                # Public exposure

  tags = {
    Name = "vulnerable-instance"
  }
}

resource "aws_s3_bucket" "public_bucket" {
  bucket = "devsecops-public-test-demo"

  acl    = "public-read"   # Checkov should catch this
  force_destroy = true

  tags = {
    Name        = "Public S3 Bucket"
    Environment = "dev"
  }
}

resource "random_id" "bucket_id" {
  byte_length = 4
}
