variable "ec2_instances" {
  type = list(map)
  default = [
    { name = "worker1",
    ip = "10.0.1.20" },
    { name = "worker2",
    ip = "10.0.1.21" },
    { name = "master1",
    ip = "10.0.1.10" },
    { name = "master2",
    ip = "10.0.1.11" }
  ]

}
