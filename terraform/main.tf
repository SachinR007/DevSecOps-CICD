resource "aws_instance" "bad_example" {
  ami                    = "ami-0c02fb55956c7d316"  # updated AMI
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.ssh_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "Test-instance"
  }
}

resource "aws_s3_bucket" "public_bucket" {
  bucket = "devsecops-public-test-demo"
  force_destroy = true

  tags = {
    Name        = "Public S3 Bucket"
    Environment = "dev"
  }
}
