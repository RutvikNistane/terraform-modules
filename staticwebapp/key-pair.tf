resource "aws_key_pair" "mykp" {
  key_name   = local.key_name
  public_key = file(var.key_path)
}