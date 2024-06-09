resource "aws_key_pair" "k8s" {
    key_name = "k8s_the_hard_way"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDNddCh5De9aZxUv/Cl+S/hcEaEQA3pGUFjyVF2zfHvqIinvNAGnF24JVETGnSOShCC2TFm1rATETNuSTRafP3V8I30OjW2w0Iy61raztayQ6kwEOc8F5xZFbXfQNNJn1SDLMzZl0tNo4JotFEqapPF7wcuBAP63fYsyYVcXpx4ZEJ2qakiRRgpAPr3xSGm8aux1fMo+Ej5aeZv/AQvWRmKWCWS6gHIpQw9SJ57sb/vALbmkBGF2+VJll+89//wbmX0rEBbLz9G2Pp8UxUjBBbpY0TXtwoo0wdBhsP4C3dXLT1Lzhwe9JfsW41prq5WXZpOalo8LFM3D5x52+5w9PcH+f9YnUeiFaF6YxYpgx3FSRNGVEG13mQdsCQ1zxY54cCvefDSB0So/sHdaalBEo68C4ja8x8rjJH7xPm6vLxlfgu4D/PaiOAhbYy2M8Xr91jDfL9JcR33HZ1/SGrGoT55+pM9rE2OOAybEcGy4djP3uCyp7Bjp4zKbr6sv91UFxc= michaelcorcoran@Michaels-iMac.local"
}

resource 

resource "aws_instance" "k8s" {
    for_each = var.ec2_instances
    ami = GETAMIIMAGE
    key_name = aws_key_pair.k8s.id
    security_groups = aws_security_group.k8s.id
    instance_type = "t2.micro"

}