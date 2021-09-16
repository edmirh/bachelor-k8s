locals {
  cluster_name                 = "bacholer.k8s.local"
  master_autoscaling_group_ids = [aws_autoscaling_group.master-ap-southeast-2a-masters-bacholer-k8s-local.id]
  master_security_group_ids    = [aws_security_group.masters-bacholer-k8s-local.id]
  masters_role_arn             = aws_iam_role.masters-bacholer-k8s-local.arn
  masters_role_name            = aws_iam_role.masters-bacholer-k8s-local.name
  node_autoscaling_group_ids   = [aws_autoscaling_group.nodes-ap-southeast-2a-bacholer-k8s-local.id, aws_autoscaling_group.nodes-ap-southeast-2b-bacholer-k8s-local.id, aws_autoscaling_group.nodes-ap-southeast-2c-bacholer-k8s-local.id]
  node_security_group_ids      = [aws_security_group.nodes-bacholer-k8s-local.id]
  node_subnet_ids              = [aws_subnet.ap-southeast-2a-bacholer-k8s-local.id, aws_subnet.ap-southeast-2b-bacholer-k8s-local.id, aws_subnet.ap-southeast-2c-bacholer-k8s-local.id]
  nodes_role_arn               = aws_iam_role.nodes-bacholer-k8s-local.arn
  nodes_role_name              = aws_iam_role.nodes-bacholer-k8s-local.name
  region                       = "ap-southeast-2"
  route_table_public_id        = aws_route_table.bacholer-k8s-local.id
  subnet_ap-southeast-2a_id    = aws_subnet.ap-southeast-2a-bacholer-k8s-local.id
  subnet_ap-southeast-2b_id    = aws_subnet.ap-southeast-2b-bacholer-k8s-local.id
  subnet_ap-southeast-2c_id    = aws_subnet.ap-southeast-2c-bacholer-k8s-local.id
  vpc_cidr_block               = aws_vpc.bacholer-k8s-local.cidr_block
  vpc_id                       = aws_vpc.bacholer-k8s-local.id
}

output "cluster_name" {
  value = "bacholer.k8s.local"
}

output "master_autoscaling_group_ids" {
  value = [aws_autoscaling_group.master-ap-southeast-2a-masters-bacholer-k8s-local.id]
}

output "master_security_group_ids" {
  value = [aws_security_group.masters-bacholer-k8s-local.id]
}

output "masters_role_arn" {
  value = aws_iam_role.masters-bacholer-k8s-local.arn
}

output "masters_role_name" {
  value = aws_iam_role.masters-bacholer-k8s-local.name
}

output "node_autoscaling_group_ids" {
  value = [aws_autoscaling_group.nodes-ap-southeast-2a-bacholer-k8s-local.id, aws_autoscaling_group.nodes-ap-southeast-2b-bacholer-k8s-local.id, aws_autoscaling_group.nodes-ap-southeast-2c-bacholer-k8s-local.id]
}

output "node_security_group_ids" {
  value = [aws_security_group.nodes-bacholer-k8s-local.id]
}

output "node_subnet_ids" {
  value = [aws_subnet.ap-southeast-2a-bacholer-k8s-local.id, aws_subnet.ap-southeast-2b-bacholer-k8s-local.id, aws_subnet.ap-southeast-2c-bacholer-k8s-local.id]
}

output "nodes_role_arn" {
  value = aws_iam_role.nodes-bacholer-k8s-local.arn
}

output "nodes_role_name" {
  value = aws_iam_role.nodes-bacholer-k8s-local.name
}

output "region" {
  value = "ap-southeast-2"
}

output "route_table_public_id" {
  value = aws_route_table.bacholer-k8s-local.id
}

output "subnet_ap-southeast-2a_id" {
  value = aws_subnet.ap-southeast-2a-bacholer-k8s-local.id
}

output "subnet_ap-southeast-2b_id" {
  value = aws_subnet.ap-southeast-2b-bacholer-k8s-local.id
}

output "subnet_ap-southeast-2c_id" {
  value = aws_subnet.ap-southeast-2c-bacholer-k8s-local.id
}

output "vpc_cidr_block" {
  value = aws_vpc.bacholer-k8s-local.cidr_block
}

output "vpc_id" {
  value = aws_vpc.bacholer-k8s-local.id
}

provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_autoscaling_group" "master-ap-southeast-2a-masters-bacholer-k8s-local" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.master-ap-southeast-2a-masters-bacholer-k8s-local.id
    version = aws_launch_template.master-ap-southeast-2a-masters-bacholer-k8s-local.latest_version
  }
  load_balancers        = [aws_elb.api-bacholer-k8s-local.id]
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "master-ap-southeast-2a.masters.bacholer.k8s.local"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "bacholer.k8s.local"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "master-ap-southeast-2a.masters.bacholer.k8s.local"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "master-ap-southeast-2a"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"
    propagate_at_launch = true
    value               = "master"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/master"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "master-ap-southeast-2a"
  }
  tag {
    key                 = "kubernetes.io/cluster/bacholer.k8s.local"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.ap-southeast-2a-bacholer-k8s-local.id]
}

resource "aws_autoscaling_group" "nodes-ap-southeast-2a-bacholer-k8s-local" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.nodes-ap-southeast-2a-bacholer-k8s-local.id
    version = aws_launch_template.nodes-ap-southeast-2a-bacholer-k8s-local.latest_version
  }
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "nodes-ap-southeast-2a.bacholer.k8s.local"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "bacholer.k8s.local"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes-ap-southeast-2a.bacholer.k8s.local"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-ap-southeast-2a"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"
    propagate_at_launch = true
    value               = "node"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/node"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-ap-southeast-2a"
  }
  tag {
    key                 = "kubernetes.io/cluster/bacholer.k8s.local"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.ap-southeast-2a-bacholer-k8s-local.id]
}

resource "aws_autoscaling_group" "nodes-ap-southeast-2b-bacholer-k8s-local" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.nodes-ap-southeast-2b-bacholer-k8s-local.id
    version = aws_launch_template.nodes-ap-southeast-2b-bacholer-k8s-local.latest_version
  }
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "nodes-ap-southeast-2b.bacholer.k8s.local"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "bacholer.k8s.local"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes-ap-southeast-2b.bacholer.k8s.local"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-ap-southeast-2b"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"
    propagate_at_launch = true
    value               = "node"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/node"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-ap-southeast-2b"
  }
  tag {
    key                 = "kubernetes.io/cluster/bacholer.k8s.local"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.ap-southeast-2b-bacholer-k8s-local.id]
}

resource "aws_autoscaling_group" "nodes-ap-southeast-2c-bacholer-k8s-local" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.nodes-ap-southeast-2c-bacholer-k8s-local.id
    version = aws_launch_template.nodes-ap-southeast-2c-bacholer-k8s-local.latest_version
  }
  max_size              = 0
  metrics_granularity   = "1Minute"
  min_size              = 0
  name                  = "nodes-ap-southeast-2c.bacholer.k8s.local"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "bacholer.k8s.local"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes-ap-southeast-2c.bacholer.k8s.local"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-ap-southeast-2c"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"
    propagate_at_launch = true
    value               = "node"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/node"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-ap-southeast-2c"
  }
  tag {
    key                 = "kubernetes.io/cluster/bacholer.k8s.local"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.ap-southeast-2c-bacholer-k8s-local.id]
}

resource "aws_ebs_volume" "a-etcd-events-bacholer-k8s-local" {
  availability_zone = "ap-southeast-2a"
  encrypted         = true
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                        = "bacholer.k8s.local"
    "Name"                                     = "a.etcd-events.bacholer.k8s.local"
    "k8s.io/etcd/events"                       = "a/a"
    "k8s.io/role/master"                       = "1"
    "kubernetes.io/cluster/bacholer.k8s.local" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_ebs_volume" "a-etcd-main-bacholer-k8s-local" {
  availability_zone = "ap-southeast-2a"
  encrypted         = true
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                        = "bacholer.k8s.local"
    "Name"                                     = "a.etcd-main.bacholer.k8s.local"
    "k8s.io/etcd/main"                         = "a/a"
    "k8s.io/role/master"                       = "1"
    "kubernetes.io/cluster/bacholer.k8s.local" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_elb" "api-bacholer-k8s-local" {
  cross_zone_load_balancing = false
  health_check {
    healthy_threshold   = 2
    interval            = 10
    target              = "SSL:443"
    timeout             = 5
    unhealthy_threshold = 2
  }
  idle_timeout = 300
  listener {
    instance_port     = 443
    instance_protocol = "TCP"
    lb_port           = 443
    lb_protocol       = "TCP"
  }
  name            = "api-bacholer-k8s-local-3n8f45"
  security_groups = [aws_security_group.api-elb-bacholer-k8s-local.id]
  subnets         = [aws_subnet.ap-southeast-2a-bacholer-k8s-local.id, aws_subnet.ap-southeast-2b-bacholer-k8s-local.id, aws_subnet.ap-southeast-2c-bacholer-k8s-local.id]
  tags = {
    "KubernetesCluster"                        = "bacholer.k8s.local"
    "Name"                                     = "api.bacholer.k8s.local"
    "kubernetes.io/cluster/bacholer.k8s.local" = "owned"
  }
}

resource "aws_iam_instance_profile" "masters-bacholer-k8s-local" {
  name = "masters.bacholer.k8s.local"
  role = aws_iam_role.masters-bacholer-k8s-local.name
  tags = {
    "KubernetesCluster"                        = "bacholer.k8s.local"
    "Name"                                     = "masters.bacholer.k8s.local"
    "kubernetes.io/cluster/bacholer.k8s.local" = "owned"
  }
}

resource "aws_iam_instance_profile" "nodes-bacholer-k8s-local" {
  name = "nodes.bacholer.k8s.local"
  role = aws_iam_role.nodes-bacholer-k8s-local.name
  tags = {
    "KubernetesCluster"                        = "bacholer.k8s.local"
    "Name"                                     = "nodes.bacholer.k8s.local"
    "kubernetes.io/cluster/bacholer.k8s.local" = "owned"
  }
}

resource "aws_iam_role" "masters-bacholer-k8s-local" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_masters.bacholer.k8s.local_policy")
  name               = "masters.bacholer.k8s.local"
  tags = {
    "KubernetesCluster"                        = "bacholer.k8s.local"
    "Name"                                     = "masters.bacholer.k8s.local"
    "kubernetes.io/cluster/bacholer.k8s.local" = "owned"
  }
}

resource "aws_iam_role" "nodes-bacholer-k8s-local" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_nodes.bacholer.k8s.local_policy")
  name               = "nodes.bacholer.k8s.local"
  tags = {
    "KubernetesCluster"                        = "bacholer.k8s.local"
    "Name"                                     = "nodes.bacholer.k8s.local"
    "kubernetes.io/cluster/bacholer.k8s.local" = "owned"
  }
}

resource "aws_iam_role_policy" "masters-bacholer-k8s-local" {
  name   = "masters.bacholer.k8s.local"
  policy = file("${path.module}/data/aws_iam_role_policy_masters.bacholer.k8s.local_policy")
  role   = aws_iam_role.masters-bacholer-k8s-local.name
}

resource "aws_iam_role_policy" "nodes-bacholer-k8s-local" {
  name   = "nodes.bacholer.k8s.local"
  policy = file("${path.module}/data/aws_iam_role_policy_nodes.bacholer.k8s.local_policy")
  role   = aws_iam_role.nodes-bacholer-k8s-local.name
}

resource "aws_internet_gateway" "bacholer-k8s-local" {
  tags = {
    "KubernetesCluster"                        = "bacholer.k8s.local"
    "Name"                                     = "bacholer.k8s.local"
    "kubernetes.io/cluster/bacholer.k8s.local" = "owned"
  }
  vpc_id = aws_vpc.bacholer-k8s-local.id
}

resource "aws_key_pair" "kubernetes-bacholer-k8s-local-8dbc58087c229d39c967162d06937961" {
  key_name   = "kubernetes.bacholer.k8s.local-8d:bc:58:08:7c:22:9d:39:c9:67:16:2d:06:93:79:61"
  public_key = file("${path.module}/data/aws_key_pair_kubernetes.bacholer.k8s.local-8dbc58087c229d39c967162d06937961_public_key")
  tags = {
    "KubernetesCluster"                        = "bacholer.k8s.local"
    "Name"                                     = "bacholer.k8s.local"
    "kubernetes.io/cluster/bacholer.k8s.local" = "owned"
  }
}

resource "aws_launch_template" "master-ap-southeast-2a-masters-bacholer-k8s-local" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 64
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.masters-bacholer-k8s-local.id
  }
  image_id      = "ami-04b1878ebf78f7370"
  instance_type = "t3.medium"
  key_name      = aws_key_pair.kubernetes-bacholer-k8s-local-8dbc58087c229d39c967162d06937961.id
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
  }
  monitoring {
    enabled = false
  }
  name = "master-ap-southeast-2a.masters.bacholer.k8s.local"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [aws_security_group.masters-bacholer-k8s-local.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                                                     = "bacholer.k8s.local"
      "Name"                                                                                                  = "master-ap-southeast-2a.masters.bacholer.k8s.local"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"                               = "master-ap-southeast-2a"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                                      = "master"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"                          = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "master-ap-southeast-2a"
      "kubernetes.io/cluster/bacholer.k8s.local"                                                              = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                                                     = "bacholer.k8s.local"
      "Name"                                                                                                  = "master-ap-southeast-2a.masters.bacholer.k8s.local"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"                               = "master-ap-southeast-2a"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                                      = "master"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"                          = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "master-ap-southeast-2a"
      "kubernetes.io/cluster/bacholer.k8s.local"                                                              = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                                                     = "bacholer.k8s.local"
    "Name"                                                                                                  = "master-ap-southeast-2a.masters.bacholer.k8s.local"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"                               = "master-ap-southeast-2a"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                                      = "master"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"                          = ""
    "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
    "k8s.io/role/master"                                                                                    = "1"
    "kops.k8s.io/instancegroup"                                                                             = "master-ap-southeast-2a"
    "kubernetes.io/cluster/bacholer.k8s.local"                                                              = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_master-ap-southeast-2a.masters.bacholer.k8s.local_user_data")
}

resource "aws_launch_template" "nodes-ap-southeast-2a-bacholer-k8s-local" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 128
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.nodes-bacholer-k8s-local.id
  }
  image_id      = "ami-04b1878ebf78f7370"
  instance_type = "t3.medium"
  key_name      = aws_key_pair.kubernetes-bacholer-k8s-local-8dbc58087c229d39c967162d06937961.id
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
  }
  monitoring {
    enabled = false
  }
  name = "nodes-ap-southeast-2a.bacholer.k8s.local"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [aws_security_group.nodes-bacholer-k8s-local.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "bacholer.k8s.local"
      "Name"                                                                       = "nodes-ap-southeast-2a.bacholer.k8s.local"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-ap-southeast-2a"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-ap-southeast-2a"
      "kubernetes.io/cluster/bacholer.k8s.local"                                   = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "bacholer.k8s.local"
      "Name"                                                                       = "nodes-ap-southeast-2a.bacholer.k8s.local"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-ap-southeast-2a"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-ap-southeast-2a"
      "kubernetes.io/cluster/bacholer.k8s.local"                                   = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "bacholer.k8s.local"
    "Name"                                                                       = "nodes-ap-southeast-2a.bacholer.k8s.local"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-ap-southeast-2a"
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/node"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                  = "nodes-ap-southeast-2a"
    "kubernetes.io/cluster/bacholer.k8s.local"                                   = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_nodes-ap-southeast-2a.bacholer.k8s.local_user_data")
}

resource "aws_launch_template" "nodes-ap-southeast-2b-bacholer-k8s-local" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 128
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.nodes-bacholer-k8s-local.id
  }
  image_id      = "ami-04b1878ebf78f7370"
  instance_type = "t3.medium"
  key_name      = aws_key_pair.kubernetes-bacholer-k8s-local-8dbc58087c229d39c967162d06937961.id
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
  }
  monitoring {
    enabled = false
  }
  name = "nodes-ap-southeast-2b.bacholer.k8s.local"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [aws_security_group.nodes-bacholer-k8s-local.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "bacholer.k8s.local"
      "Name"                                                                       = "nodes-ap-southeast-2b.bacholer.k8s.local"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-ap-southeast-2b"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-ap-southeast-2b"
      "kubernetes.io/cluster/bacholer.k8s.local"                                   = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "bacholer.k8s.local"
      "Name"                                                                       = "nodes-ap-southeast-2b.bacholer.k8s.local"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-ap-southeast-2b"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-ap-southeast-2b"
      "kubernetes.io/cluster/bacholer.k8s.local"                                   = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "bacholer.k8s.local"
    "Name"                                                                       = "nodes-ap-southeast-2b.bacholer.k8s.local"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-ap-southeast-2b"
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/node"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                  = "nodes-ap-southeast-2b"
    "kubernetes.io/cluster/bacholer.k8s.local"                                   = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_nodes-ap-southeast-2b.bacholer.k8s.local_user_data")
}

resource "aws_launch_template" "nodes-ap-southeast-2c-bacholer-k8s-local" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 128
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.nodes-bacholer-k8s-local.id
  }
  image_id      = "ami-04b1878ebf78f7370"
  instance_type = "t3.medium"
  key_name      = aws_key_pair.kubernetes-bacholer-k8s-local-8dbc58087c229d39c967162d06937961.id
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
  }
  monitoring {
    enabled = false
  }
  name = "nodes-ap-southeast-2c.bacholer.k8s.local"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [aws_security_group.nodes-bacholer-k8s-local.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "bacholer.k8s.local"
      "Name"                                                                       = "nodes-ap-southeast-2c.bacholer.k8s.local"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-ap-southeast-2c"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-ap-southeast-2c"
      "kubernetes.io/cluster/bacholer.k8s.local"                                   = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "bacholer.k8s.local"
      "Name"                                                                       = "nodes-ap-southeast-2c.bacholer.k8s.local"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-ap-southeast-2c"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-ap-southeast-2c"
      "kubernetes.io/cluster/bacholer.k8s.local"                                   = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "bacholer.k8s.local"
    "Name"                                                                       = "nodes-ap-southeast-2c.bacholer.k8s.local"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-ap-southeast-2c"
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/node"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                  = "nodes-ap-southeast-2c"
    "kubernetes.io/cluster/bacholer.k8s.local"                                   = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_nodes-ap-southeast-2c.bacholer.k8s.local_user_data")
}

resource "aws_route" "route-0-0-0-0--0" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.bacholer-k8s-local.id
  route_table_id         = aws_route_table.bacholer-k8s-local.id
}

resource "aws_route_table" "bacholer-k8s-local" {
  tags = {
    "KubernetesCluster"                        = "bacholer.k8s.local"
    "Name"                                     = "bacholer.k8s.local"
    "kubernetes.io/cluster/bacholer.k8s.local" = "owned"
    "kubernetes.io/kops/role"                  = "public"
  }
  vpc_id = aws_vpc.bacholer-k8s-local.id
}

resource "aws_route_table_association" "ap-southeast-2a-bacholer-k8s-local" {
  route_table_id = aws_route_table.bacholer-k8s-local.id
  subnet_id      = aws_subnet.ap-southeast-2a-bacholer-k8s-local.id
}

resource "aws_route_table_association" "ap-southeast-2b-bacholer-k8s-local" {
  route_table_id = aws_route_table.bacholer-k8s-local.id
  subnet_id      = aws_subnet.ap-southeast-2b-bacholer-k8s-local.id
}

resource "aws_route_table_association" "ap-southeast-2c-bacholer-k8s-local" {
  route_table_id = aws_route_table.bacholer-k8s-local.id
  subnet_id      = aws_subnet.ap-southeast-2c-bacholer-k8s-local.id
}

resource "aws_security_group" "api-elb-bacholer-k8s-local" {
  description = "Security group for api ELB"
  name        = "api-elb.bacholer.k8s.local"
  tags = {
    "KubernetesCluster"                        = "bacholer.k8s.local"
    "Name"                                     = "api-elb.bacholer.k8s.local"
    "kubernetes.io/cluster/bacholer.k8s.local" = "owned"
  }
  vpc_id = aws_vpc.bacholer-k8s-local.id
}

resource "aws_security_group" "masters-bacholer-k8s-local" {
  description = "Security group for masters"
  name        = "masters.bacholer.k8s.local"
  tags = {
    "KubernetesCluster"                        = "bacholer.k8s.local"
    "Name"                                     = "masters.bacholer.k8s.local"
    "kubernetes.io/cluster/bacholer.k8s.local" = "owned"
  }
  vpc_id = aws_vpc.bacholer-k8s-local.id
}

resource "aws_security_group" "nodes-bacholer-k8s-local" {
  description = "Security group for nodes"
  name        = "nodes.bacholer.k8s.local"
  tags = {
    "KubernetesCluster"                        = "bacholer.k8s.local"
    "Name"                                     = "nodes.bacholer.k8s.local"
    "kubernetes.io/cluster/bacholer.k8s.local" = "owned"
  }
  vpc_id = aws_vpc.bacholer-k8s-local.id
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-22to22-masters-bacholer-k8s-local" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.masters-bacholer-k8s-local.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-22to22-nodes-bacholer-k8s-local" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.nodes-bacholer-k8s-local.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-443to443-api-elb-bacholer-k8s-local" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.api-elb-bacholer-k8s-local.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_security_group_rule" "from-api-elb-bacholer-k8s-local-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.api-elb-bacholer-k8s-local.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-masters-bacholer-k8s-local-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.masters-bacholer-k8s-local.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-masters-bacholer-k8s-local-ingress-all-0to0-masters-bacholer-k8s-local" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.masters-bacholer-k8s-local.id
  source_security_group_id = aws_security_group.masters-bacholer-k8s-local.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-masters-bacholer-k8s-local-ingress-all-0to0-nodes-bacholer-k8s-local" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-bacholer-k8s-local.id
  source_security_group_id = aws_security_group.masters-bacholer-k8s-local.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-bacholer-k8s-local-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.nodes-bacholer-k8s-local.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-nodes-bacholer-k8s-local-ingress-all-0to0-masters-bacholer-k8s-local" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.masters-bacholer-k8s-local.id
  source_security_group_id = aws_security_group.nodes-bacholer-k8s-local.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-bacholer-k8s-local-ingress-all-0to0-nodes-bacholer-k8s-local" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-bacholer-k8s-local.id
  source_security_group_id = aws_security_group.nodes-bacholer-k8s-local.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-bacholer-k8s-local-ingress-tcp-1to2379-masters-bacholer-k8s-local" {
  from_port                = 1
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-bacholer-k8s-local.id
  source_security_group_id = aws_security_group.nodes-bacholer-k8s-local.id
  to_port                  = 2379
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-bacholer-k8s-local-ingress-tcp-2382to4000-masters-bacholer-k8s-local" {
  from_port                = 2382
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-bacholer-k8s-local.id
  source_security_group_id = aws_security_group.nodes-bacholer-k8s-local.id
  to_port                  = 4000
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-bacholer-k8s-local-ingress-tcp-4003to65535-masters-bacholer-k8s-local" {
  from_port                = 4003
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-bacholer-k8s-local.id
  source_security_group_id = aws_security_group.nodes-bacholer-k8s-local.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-bacholer-k8s-local-ingress-udp-1to65535-masters-bacholer-k8s-local" {
  from_port                = 1
  protocol                 = "udp"
  security_group_id        = aws_security_group.masters-bacholer-k8s-local.id
  source_security_group_id = aws_security_group.nodes-bacholer-k8s-local.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "https-elb-to-master" {
  from_port                = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-bacholer-k8s-local.id
  source_security_group_id = aws_security_group.api-elb-bacholer-k8s-local.id
  to_port                  = 443
  type                     = "ingress"
}

resource "aws_security_group_rule" "icmp-pmtu-api-elb-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 3
  protocol          = "icmp"
  security_group_id = aws_security_group.api-elb-bacholer-k8s-local.id
  to_port           = 4
  type              = "ingress"
}

resource "aws_subnet" "ap-southeast-2a-bacholer-k8s-local" {
  availability_zone = "ap-southeast-2a"
  cidr_block        = "172.20.32.0/19"
  tags = {
    "KubernetesCluster"                        = "bacholer.k8s.local"
    "Name"                                     = "ap-southeast-2a.bacholer.k8s.local"
    "SubnetType"                               = "Public"
    "kubernetes.io/cluster/bacholer.k8s.local" = "owned"
    "kubernetes.io/role/elb"                   = "1"
    "kubernetes.io/role/internal-elb"          = "1"
  }
  vpc_id = aws_vpc.bacholer-k8s-local.id
}

resource "aws_subnet" "ap-southeast-2b-bacholer-k8s-local" {
  availability_zone = "ap-southeast-2b"
  cidr_block        = "172.20.64.0/19"
  tags = {
    "KubernetesCluster"                        = "bacholer.k8s.local"
    "Name"                                     = "ap-southeast-2b.bacholer.k8s.local"
    "SubnetType"                               = "Public"
    "kubernetes.io/cluster/bacholer.k8s.local" = "owned"
    "kubernetes.io/role/elb"                   = "1"
    "kubernetes.io/role/internal-elb"          = "1"
  }
  vpc_id = aws_vpc.bacholer-k8s-local.id
}

resource "aws_subnet" "ap-southeast-2c-bacholer-k8s-local" {
  availability_zone = "ap-southeast-2c"
  cidr_block        = "172.20.96.0/19"
  tags = {
    "KubernetesCluster"                        = "bacholer.k8s.local"
    "Name"                                     = "ap-southeast-2c.bacholer.k8s.local"
    "SubnetType"                               = "Public"
    "kubernetes.io/cluster/bacholer.k8s.local" = "owned"
    "kubernetes.io/role/elb"                   = "1"
    "kubernetes.io/role/internal-elb"          = "1"
  }
  vpc_id = aws_vpc.bacholer-k8s-local.id
}

resource "aws_vpc" "bacholer-k8s-local" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "KubernetesCluster"                        = "bacholer.k8s.local"
    "Name"                                     = "bacholer.k8s.local"
    "kubernetes.io/cluster/bacholer.k8s.local" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "bacholer-k8s-local" {
  domain_name         = "ap-southeast-2.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]
  tags = {
    "KubernetesCluster"                        = "bacholer.k8s.local"
    "Name"                                     = "bacholer.k8s.local"
    "kubernetes.io/cluster/bacholer.k8s.local" = "owned"
  }
}

resource "aws_vpc_dhcp_options_association" "bacholer-k8s-local" {
  dhcp_options_id = aws_vpc_dhcp_options.bacholer-k8s-local.id
  vpc_id          = aws_vpc.bacholer-k8s-local.id
}

terraform {
  required_version = ">= 0.12.26"
  required_providers {
    aws = {
      "source"  = "hashicorp/aws"
      "version" = ">= 3.34.0"
    }
  }
}
