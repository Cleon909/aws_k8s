variable "ec2_instances" {
    type = list(string)
    default  = [
        "worker1",
        "worker2",
        "master1",
        "master2"
    ]

}