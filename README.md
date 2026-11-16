# Next.Ops.Live.Project
# ⚡ Next.Ops.Live – Thermal Power Plant DevOps Project

## 📌 Project Overview | परियोजना का परिचय

**Next.Ops.Live** is a real-world DevOps learning project based on a Thermal Power Plant.

Is project ka main objective hai ek application infrastructure ko Azure Cloud par deploy karna aur different DevOps tools ki help se automation, CI/CD, containerization, orchestration aur monitoring implement karna.

We are learning how different DevOps tools work together in a real-world project environment.

## 🎯 Project Objectives | प्रोजेक्ट के उद्देश्य

- Azure Cloud par infrastructure deploy karna.
- Terraform ke through Infrastructure as Code (IaC) implement karna.
- GitHub ka use karke source code manage karna.
- Jenkins ke through CI/CD pipeline banana.
- Docker se applications ko containerize karna.
- Kubernetes / AKS se containers manage karna.
- Prometheus aur Grafana se application monitoring karna.
- PostgreSQL ko database ke roop mein use karna.
- Monolithic aur Microservices architecture ko samajhna aur implement karna.

## 🛠️ Technology Stack | इस्तेमाल होने वाली Technologies

| Technology | Purpose (कहाँ और क्यों इस्तेमाल होगी) |
|---|---|
| Azure | Cloud infrastructure host karne ke liye |
| Terraform | Infrastructure ko code se create/manage karne ke liye |
| Git & GitHub | Source code version control ke liye |
| Ubuntu / Linux | Server management aur application hosting |
| PostgreSQL | Application data store karne ke liye |
| Docker | Application ko containerize karne ke liye |
| Jenkins | CI/CD automation ke liye |
| Kubernetes / AKS | Containers ko deploy aur manage karne ke liye |
| Prometheus | Metrics collect karne ke liye |
| Grafana | Monitoring dashboards aur visualization ke liye |

## ☁️ Azure Infrastructure | Azure पर बनाया गया Infrastructure

We have started building our project infrastructure on Microsoft Azure.

### Resource Group

- **Resource Group:** `nextops-dev-rg`
- **Region:** Central India
- **Environment:** Development

Resource Group Azure resources ko logically organize aur manage karne ke liye use hota hai.

### Virtual Network

- **VNet Name:** `nextops-dev-vnet`
- **Address Space:** `10.0.0.0/16`

VNet Azure resources ke beech private network communication provide karta hai.

### Subnets

| Subnet | Address Range | Purpose |
|---|---|---|
| Frontend | `10.0.1.0/24` | Frontend VM |
| Backend | `10.0.2.0/24` | Backend VM |
| Database | `10.0.3.0/24` | Database-related network segment |

Subnets ki help se hum network ko different logical sections mein divide karte hain.

### Network Security Groups (NSG)

| Port | Protocol | Purpose |
|---|---|---|
| 80 | TCP | HTTP |
| 443 | TCP | HTTPS |
| 8000 | TCP | Backend application |
| 5432 | TCP | PostgreSQL |

NSG rules network traffic ko control karne aur resources ko secure rakhne ke liye use hote hain.

### Virtual Machines

| VM Name | Operating System | Private IP | Purpose |
|---|---|---|---|
| `nextops-frontend-vm` | Ubuntu 22.04 | `10.0.1.4` | Frontend |
| `nextops-backend-vm` | Ubuntu 22.04 | `10.0.2.4` | Backend |

- Frontend VM ke saath Public IP configured hai.
- Backend VM private network par configured hai.

**Note:** PostgreSQL ko VM ke andar SSH ke through install karna planned hai. Abhi database installation complete nahi hui hai.

## 🏗️ Terraform Infrastructure as Code

We are using Terraform to create and manage Azure infrastructure.

Terraform se manually Azure Portal par resources create karne ki zarurat kam hoti hai. Hum infrastructure ko reusable code ke through manage kar sakte hain.

### Project Folder Structure

```text
Next.Ops.Live.Project/
│
├── Environment/
│   └── dev/
│       ├── versions.tf
│       ├── provider.tf
│       ├── main.tf
│       ├── variable.tf
│       ├── terraform.tfvars
│       └── output.tf
│
├── modules/
│   ├── azurerm_resource_groups/
│   ├── azurerm_virtual_networks/
│   ├── azurerm_subnets/
│   ├── azurerm_network_security_groups/
│   ├── azurerm_public_ips/
│   └── azurerm_virtual_machines/
│
└── README.md
```

### Terraform Commands

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

**Commands ka use:**

- `terraform init` – Terraform providers aur modules initialize karta hai.
- `terraform fmt` – Terraform code format karta hai.
- `terraform validate` – Code ki configuration check karta hai.
- `terraform plan` – Changes ka preview dikhata hai.
- `terraform apply` – Approved infrastructure changes apply karta hai.

## 🏛️ Project Architecture | प्रोजेक्ट का Architecture

Current infrastructure ka basic flow:

```text
             Internet
                |
                |
         Frontend Public IP
                |
                |
        Frontend Ubuntu VM
          10.0.1.4
                |
                |
         Backend Ubuntu VM
          10.0.2.4
                |
                |
       PostgreSQL (Planned)
          VM Installation
```

Is architecture mein frontend user requests receive karega, backend application logic handle karega aur PostgreSQL data store karne ke liye use hoga.

**Note:** PostgreSQL installation aur application connectivity abhi upcoming tasks hain. Diagram planned application flow ko represent karta hai, completed deployment ko nahi.

## 📊 Monolithic & Microservices Architecture

We will explore two application architectures:

**1. Monolithic Architecture**

Is architecture mein application ke different components ek single application ke roop mein develop aur deploy hote hain.

**2. Microservices Architecture**

Is architecture mein application ko multiple small independent services mein divide kiya jata hai. Har service apna specific task perform karti hai.

Dono architectures ko Thermal Power Plant project ke context mein samajhna aur practice karna project ka part hai.

## 🔄 CI/CD Pipeline – Jenkins

Jenkins ka use build, test aur deployment process automate karne ke liye kiya jayega.

Expected workflow:

1. Developer GitHub par code push karega.
2. Jenkins pipeline trigger hogi.
3. Application build aur test hogi.
4. Docker image create hogi.
5. Image deploy environment mein release hogi.

## 🐳 Docker & Kubernetes

**Docker:** Application aur uski dependencies ko container mein package karne ke liye.

**Kubernetes / AKS:** Multiple containers ko deploy, scale aur manage karne ke liye.

## 📈 Monitoring – Prometheus & Grafana

**Prometheus:** Application aur infrastructure ke metrics collect karega.

**Grafana:** Collected metrics ko dashboards aur graphs ke through display karega.

Isse application aur infrastructure ki health monitor karna easy hoga.

## ✅ Current Project Progress

- [x] Azure Resource Group created
- [x] Azure Virtual Network created
- [x] Frontend, Backend and Database subnets created
- [x] Network Security Groups configured
- [x] Frontend Public IP created
- [x] Frontend Virtual Machine created
- [x] Backend Virtual Machine created
- [x] Terraform modules organized
- [ ] VM SSH connectivity and configuration
- [ ] PostgreSQL installation inside VM
- [ ] Application deployment
- [ ] Docker implementation
- [ ] Jenkins CI/CD pipeline
- [ ] Kubernetes / AKS deployment
- [ ] Prometheus and Grafana monitoring

## 🔐 Security Practices

- Never upload passwords or secrets to GitHub.
- Keep `terraform.tfvars` out of Git.
- Never commit Terraform state files.
- Use secure access methods for Virtual Machines.
- Follow least-privilege access principles.
- Configure NSG rules carefully.

## 🚀 Future Scope | आगे क्या करेंगे?

1. Configure frontend and backend VMs.
2. Install PostgreSQL inside a VM.
3. Deploy the Thermal Power Plant application.
4. Containerize applications using Docker.
5. Build CI/CD pipelines using Jenkins.
6. Deploy applications using Kubernetes / AKS.
7. Configure Prometheus and Grafana.
8. Implement application and infrastructure monitoring.

## 📚 Learning Outcomes

Through this project, we aim to gain practical knowledge of:

- Cloud Infrastructure Management
- Infrastructure as Code (Terraform)
- Linux and Server Administration
- Git and GitHub
- Database Management
- Docker and Kubernetes
- CI/CD Automation
- Monitoring and Observability
- Monolithic and Microservices Architecture

## 👨‍💻 Project Status

**Project:** Next.Ops.Live  
**Domain:** Thermal Power Plant  
**Environment:** Azure Cloud – Development  
**Current Phase:** Infrastructure Setup and DevOps Implementation

---

*Learning DevOps step by step by building a real-world project.*

**#DevOps #Azure #Terraform #Jenkins #Docker #Kubernetes #AKS #Prometheus #Grafana #PostgreSQL #GitHub #CloudComputing**
