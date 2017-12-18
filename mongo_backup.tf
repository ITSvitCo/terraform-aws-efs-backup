module "mongo_backup" {
  source = "git::https://github.com/ITSvitCo/terraform-aws-mongo-backup.git?ref=tags/0.3.6"

  name                = "backup"
  stage               = "${terraform.workspace}"
  namespace           = "cs"
  vpc_id              = "${var.vpc_id}"
  security_group_id   = "${aws_security_group.cloudcms.id}"
  ip_address          = "${module.cloudcms.private_ip}"
  dbuser              = "${var.dbuser}"
  dbpassword          = "${var.dbpassword}"
  ssh_key_pair        = "${var.key_pair[terraform.workspace]}"
  datapipeline_config = "${var.datapipeline_config}"
}
