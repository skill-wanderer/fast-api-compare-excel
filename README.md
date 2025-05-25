# FastAPI So Sánh Excel (FastAPI Excel Comparison)

[![FastAPI](https://img.shields.io/badge/FastAPI-0.100.0+-009688?style=flat&logo=fastapi)](https://fastapi.tiangolo.com)
[![Python](https://img.shields.io/badge/Python-3.9+-3776AB?style=flat&logo=python&logoColor=white)](https://www.python.org)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Ứng dụng web mạnh mẽ sử dụng FastAPI để so sánh dữ liệu từ các tệp Excel. Hỗ trợ nhiều trang tính và cung cấp các công cụ trực quan để phát hiện sự khác biệt.

*A powerful web application using FastAPI for comparing data from Excel files. Supports multiple worksheets and provides visual tools to detect differences.*


## ✨ Tính Năng (Features)

- 📊 So sánh dữ liệu từ nhiều trang tính Excel
- 🔍 Phát hiện và làm nổi bật sự khác biệt
- 📱 Giao diện người dùng thân thiện và đáp ứng
- 📋 Xuất kết quả so sánh thành tệp Excel mới
- 🚀 Xử lý hiệu quả với tập dữ liệu lớn
- 🌐 Hỗ trợ đa ngôn ngữ (Tiếng Việt và Tiếng Anh)

## 🚀 Bắt Đầu (Getting Started)

### Yêu Cầu Hệ Thống (Prerequisites)

- Python 3.9+
- Các thư viện Python được liệt kê trong `requirements.txt`

### Cài Đặt (Installation)

1. Sao chép kho lưu trữ (Clone the repository):
   ```bash
   git clone https://github.com/yourusername/fast-api-compare-excel.git
   cd fast-api-compare-excel
   ```

2. Tạo và kích hoạt môi trường ảo (Create and activate a virtual environment):
   ```bash
   python -m venv venv
   # Windows
   venv\Scripts\activate
   # macOS/Linux
   source venv/bin/activate
   ```

3. Cài đặt các phụ thuộc (Install dependencies):
   ```bash
   pip install -r requirements.txt
   ```

### Chạy Ứng Dụng (Running the Application)

1. Chạy ứng dụng FastAPI (Run the FastAPI app):
   ```bash
   # Windows
   python -m app.main
   # hoặc
   uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
   ```

2. Truy cập ứng dụng tại (Access the app at):
   ```
   http://localhost:8000
   ```

### Sử Dụng Docker (Using Docker)

1. Cài đặt Docker và Docker Compose (Install Docker and Docker Compose)

2. Sao chép tệp môi trường (Copy the environment file):
   ```powershell
   # PowerShell
   Copy-Item .env.example .env
   ```

3. Xây dựng và chạy container (Build and run the container):
   ```powershell
   # PowerShell
   docker-compose up --build
   ```

   Hoặc sử dụng script trợ giúp (Or use the helper script):
   ```powershell
   # PowerShell
   .\docker-helper.ps1 build

   # CMD
   .\docker-helper.bat build
   ```

4. Truy cập ứng dụng tại (Access the app at):
   ```
   http://localhost:8000
   ```

5. Quản lý container (Managing containers):
   ```powershell
   # PowerShell - Start containers
   .\docker-helper.ps1 start

   # PowerShell - View logs
   .\docker-helper.ps1 logs

   # PowerShell - Stop containers
   .\docker-helper.ps1 stop

   # CMD - Start containers
   .\docker-helper.bat start

   # CMD - View logs
   .\docker-helper.bat logs

   # CMD - Stop containers
   .\docker-helper.bat stop
   ```

## 📖 Cách Sử Dụng (Usage)

### So Sánh Tệp Excel

1. Nhấp vào "Tải Tệp Lên" trong thanh điều hướng
2. Tải lên tệp Excel của bạn
3. Chỉ định tên các trang tính mà bạn muốn so sánh
4. Nhấn "Tải Lên" để bắt đầu quá trình so sánh
5. Xem kết quả với các điểm khác biệt được tô sáng
6. Tải xuống tệp kết quả để phân tích chi tiết hơn

### Hướng Dẫn Chi Tiết

Để biết hướng dẫn chi tiết hơn về cách sử dụng ứng dụng, vui lòng truy cập trang **"Hướng Dẫn"** trong ứng dụng.

## 🛠️ Công Nghệ (Technology Stack)

- **Backend**: [FastAPI](https://fastapi.tiangolo.com/), Python
- **Xử Lý Dữ Liệu**: [Pandas](https://pandas.pydata.org/), [NumPy](https://numpy.org/)
- **Xử Lý Excel**: [openpyxl](https://openpyxl.readthedocs.io/)
- **Frontend**: HTML, CSS, JavaScript
- **Rendering Template**: Jinja2

## 🤝 Đóng Góp (Contributing)

Đóng góp luôn được chào đón! Vui lòng đọc [hướng dẫn đóng góp](CONTRIBUTING.md) trước khi bắt đầu.

## 🔄 CI/CD và Docker Images (CI/CD and Docker Images)

Dự án này sử dụng GitHub Actions để tự động hóa quy trình CI/CD. Workflow bao gồm:

- **Build và Push Docker Image**: Tự động xây dựng và đẩy Docker image cho cả kiến trúc x86-64 (amd64) và ARM64.
- **Testing**: Thực hiện kiểm thử tự động khi có PR hoặc push vào nhánh chính.
- **Security Scan**: Quét lỗ hổng bảo mật trên image sử dụng Trivy.

### Sử dụng Docker Images (Using Docker Images)

Bạn có thể kéo và sử dụng các image đa kiến trúc từ GitHub Container Registry:

```bash
# Pull the latest image
docker pull ghcr.io/yourusername/fast-api-compare-excel:latest

# Run the container
docker run -p 8000:8000 ghcr.io/yourusername/fast-api-compare-excel:latest
```

Phiên bản sẽ tự động chọn image phù hợp với kiến trúc của hệ thống của bạn (amd64 hoặc arm64).

## ☸️ Triển Khai Lên Kubernetes (Deploying to Kubernetes)

Phần này hướng dẫn cách triển khai ứng dụng lên cụm Kubernetes. Các tệp cấu hình Kubernetes (Deployment, Service, Ingress) nằm trong thư mục `k8s/`.

### Yêu Cầu (Prerequisites)

- Một cụm Kubernetes đang hoạt động.
- `kubectl` được cài đặt và cấu hình để giao tiếp với cụm của bạn.
- Một Ingress controller (ví dụ: NGINX Ingress Controller) được cài đặt trong cụm nếu bạn muốn sử dụng Ingress.
- Docker image của ứng dụng đã được build và đẩy lên một container registry (ví dụ: GHCR, Docker Hub). Workflow GitHub Actions trong dự án này đã tự động hóa việc này lên GHCR.

### Cấu Hình (Configuration)

1.  **Cập nhật Image trong Deployment**:
    Mở tệp `k8s/deployment.yaml` và đảm bảo trường `spec.template.spec.containers[0].image` trỏ đến Docker image chính xác của bạn trên container registry. Ví dụ:
    ```yaml
    image: ghcr.io/yourusername/fast-api-compare-excel:latest
    ```
    Thay thế `yourusername` bằng tên người dùng hoặc tổ chức GitHub của bạn.

2.  **Cấu hình Ingress (Tùy chọn)**:
    Nếu bạn sử dụng Ingress để expose ứng dụng:
    - Mở tệp `k8s/ingress.yaml`.
    - Cập nhật trường `spec.rules[0].host` thành tên miền bạn muốn sử dụng. Ví dụ:
      ```yaml
      host: your-app-domain.com
      ```
    - Đảm bảo `spec.ingressClassName` phù hợp với Ingress controller bạn đang sử dụng (ví dụ: `nginx`).

### Các Bước Triển Khai (Deployment Steps)

1.  **Áp dụng Deployment**:
    Triển khai Pods của ứng dụng lên cụm:
    ```powershell
    kubectl apply -f k8s/deployment.yaml
    ```

2.  **Áp dụng Service**:
    Tạo Service để expose Deployment trong cụm:
    ```powershell
    kubectl apply -f k8s/service.yaml
    ```
    Service mặc định có type `LoadBalancer`. Nếu bạn đang chạy trên một môi trường không hỗ trợ LoadBalancer (ví dụ: Minikube cục bộ mà không có metallb), bạn có thể muốn đổi type thành `NodePort` hoặc `ClusterIP` (nếu chỉ truy cập qua Ingress).

3.  **Áp dụng Ingress (Tùy chọn)**:
    Nếu bạn đã cấu hình Ingress, hãy áp dụng nó:
    ```powershell
    kubectl apply -f k8s/ingress.yaml
    ```

### Kiểm Tra Trạng Thái (Verifying the Deployment)

1.  **Kiểm tra Pods**:
    ```powershell
    kubectl get pods -l app=fast-api-excel-compare
    ```
    Đảm bảo các Pods đang ở trạng thái `Running`.

2.  **Kiểm tra Service**:
    ```powershell
    kubectl get svc fast-api-excel-compare-svc
    ```
    Nếu Service type là `LoadBalancer`, bạn sẽ thấy một `EXTERNAL-IP` sau khi cloud provider cấp phát. Nếu là `NodePort`, bạn sẽ thấy port được expose trên các node.

3.  **Kiểm tra Ingress (Nếu có)**:
    ```powershell
    kubectl get ingress fast-api-excel-compare-ingress
    ```
    Kiểm tra cột `ADDRESS` để xem địa chỉ IP hoặc hostname của Ingress.

### Truy Cập Ứng Dụng (Accessing the Application)

-   **Qua LoadBalancer/NodePort**: Nếu Service của bạn là `LoadBalancer`, truy cập bằng `EXTERNAL-IP` và port 80. Nếu là `NodePort`, truy cập bằng IP của một trong các node và `NodePort` được chỉ định.
-   **Qua Ingress**: Truy cập ứng dụng thông qua tên miền bạn đã cấu hình trong `k8s/ingress.yaml` (ví dụ: `http://your-app-domain.com`).

### Gỡ Bỏ (Cleaning Up)

Để gỡ bỏ các tài nguyên đã triển khai:
```powershell
kubectl delete -f k8s/ingress.yaml # Nếu đã áp dụng
kubectl delete -f k8s/service.yaml
kubectl delete -f k8s/deployment.yaml
```

### Badge Trang Thái (Status Badges)

[![Build and Push Docker Images](https://github.com/skill-wanderer/fast-api-compare-excel/actions/workflows/docker-build.yml/badge.svg)](https://github.com/skill-wanderer/fast-api-compare-excel/actions/workflows/docker-build.yml)
[![Test Build and Validate](https://github.com/skill-wanderer/fast-api-compare-excel/actions/workflows/test.yml/badge.svg)](https://github.com/skill-wanderer/fast-api-compare-excel/actions/workflows/test.yml)

## 📜 Giấy Phép (License)

Dự án này được cấp phép theo Giấy Phép MIT - xem tệp [LICENSE](LICENSE) để biết chi tiết.


