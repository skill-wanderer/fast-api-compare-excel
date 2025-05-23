# FastAPI So Sánh Excel (FastAPI Excel Comparison)

[![FastAPI](https://img.shields.io/badge/FastAPI-0.100.0+-009688?style=flat&logo=fastapi)](https://fastapi.tiangolo.com)
[![Python](https://img.shields.io/badge/Python-3.9+-3776AB?style=flat&logo=python&logoColor=white)](https://www.python.org)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Ứng dụng web mạnh mẽ sử dụng FastAPI để so sánh dữ liệu từ các tệp Excel. Hỗ trợ nhiều trang tính và cung cấp các công cụ trực quan để phát hiện sự khác biệt.

*A powerful web application using FastAPI for comparing data from Excel files. Supports multiple worksheets and provides visual tools to detect differences.*

![Preview Screenshot](https://via.placeholder.com/800x450.png?text=FastAPI+Excel+Comparison+App)

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

1. Khởi động ứng dụng FastAPI:
   ```bash
   uvicorn app.main:app --reload
   ```

2. Mở trình duyệt web và truy cập [http://127.0.0.1:8000](http://127.0.0.1:8000)

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

## 📜 Giấy Phép (License)

Dự án này được cấp phép theo Giấy Phép MIT - xem tệp [LICENSE](LICENSE) để biết chi tiết.

## 📞 Liên Hệ (Contact)

Nếu bạn có bất kỳ câu hỏi hoặc đề xuất nào, vui lòng tạo Issue hoặc liên hệ với chúng tôi tại example@email.com.

---

© 2025 FastAPI So Sánh Excel. Đã đăng ký Bản quyền.
