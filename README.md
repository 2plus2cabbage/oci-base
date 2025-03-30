![oci-base](https://github.com/2plus2cabbage/2plus2cabbage/blob/main/images/oci-base.png)

# OCI Windows Instance Terraform Deployment

Deploys a Windows Server 2022 VM in Oracle Cloud Infrastructure (OCI) with RDP and internet access.

## Files
The project is split into multiple files to illustrate modularity and keep separate constructs distinct, making it easier to manage and understand.
- `main.tf`: Terraform provider block (`hashicorp/oci`).
- `ociprovider.tf`: OCI provider config with `tenancy_ocid`, `user_ocid`, etc.
- `variables.tf`: Variables and locals for tenancy, compartment, region, etc.
- `terraform.tfvars.template`: Template for sensitive/custom values; rename to `terraform.tfvars` and add your credentials.
- `locals.tf`: Local variables for naming conventions.
- `networking.tf`: VCN, subnet, internet gateway.
- `securitylist.tf`: Security list for RDP (TCP 3389) and outbound traffic.
- `routing-static.tf`: Route table for internet access.
- `windows.tf`: Windows VM, outputs public/private IPs.

## How It Works
- **Networking**: VCN and subnet provide connectivity. Internet gateway and route table enable inbound/outbound traffic.
- **Security**: Allows RDP from your IP and all outbound traffic.
- **Instance**: Windows Server 2022 VM with public IP, firewall disabled via `user_data`.

## Prerequisites
- An OCI account with a compartment.
- An API key pair with noted `tenancy_ocid`, `user_ocid`, `fingerprint`, `private_key_path`, `region`.
- Terraform installed on your machine.
- Examples are demonstrated using Visual Studio Code (VSCode).

## Deployment Steps
1. Update `terraform.tfvars` with OCI credentials and your public IP in `my_public_ip`.
2. Run `terraform init`, then (optionally) `terraform plan` to preview changes, then `terraform apply` (type `yes`).
3. Get the public IP from the `oci_vm_public_ip` output on the screen, or run `terraform output oci_vm_public_ip`, or check in the OCI Console under **Compute > Instances**.
4. Get the initial password in the OCI Console under **Compute > Instances > [click running instance] > Click Show next to Initial Password**.
5. Use Remote Desktop to log in with the `opc` user and initial password; change the password on first login.
6. To remove all resources, run `terraform destroy` (type `yes`).

## Potential costs and licensing
- The resources deployed using this Terraform configuration should generally incur minimal to no costs, provided they are terminated promptly after creation.
- It is important to fully understand your cloud provider's billing structure, trial periods, and any potential costs associated with the deployment of resources in public cloud environments.
- You are also responsible for any applicable software licensing or other charges that may arise from the deployment and usage of these resources.