# override_project
## Quy trình git
![alt](https://images.viblo.asia/4d67b9cd-249f-43c3-9a73-363f876a6b1e.png)
## Quy tắc
Không làm việc trên nhánh master.\
Chỉ merge về branch developer.\
Đặt tên branch viết feature theo format feature/featureName ví dụ: feature/productManage
## Công cụ
![alt](https://git-scm.com/images/logo@2x.png)

Bạn có thể dùng git gồm **git bash** để sử dụng command và **git GUI** để sử dụng giao diện git thay cho github desktop.
https://git-scm.com/

## Quy trình làm việc của một cá nhân

Nếu chưa clone:
> git clone https://github.com/TikTzuki/override-project-document.git

Nếu đã clone:\
### 1 - Luôn bắt đầu phiên làm việc với:
```javacript
> git pull
```
### 2 - Kiểm tra branch hiện tại, thường khi sửa dụng git bash thì bạn cũng đã biết branch hiện tại của mình.\
- Nếu cần tách branch từ branch hiện tại:
```php
> git branch feature/productManage
```

- Nếu cần chuyển qua branch khác. Khi chuyển branch thì nội dung thư mục cũng sẽ thay đổi thành nội dung của branch đó:
```php
> git checkout feature/productManage
```
>Lưu ý: **luôn commit trước khi chuyển branch** nếu không muốn code của mình vừa cặm cuội viết mất tích.
- Tạo mới branch và chuyển luôn sang branch đấy để code:
```php
> git checkout -b feature/productManage
```
### 3 - Viết code lọc cọc
### 4 - Add những thay đổi vào local repository
```php
> git add *
```
### 5 - Commit để lưu thay đổi trong **branch hiện tại**
```php
> git commit -am "message"
```
### 6 - Push lên server repository
>Lưu ý: kiểm tra **tên remote** (vd: origin) và **tên branch** (vd: feature/productManage)
```php
> git push origin feature/productManage
```
>Tất cả những công việc trên bạn đều có thể dùng phần mềm giao diện nhưng không khuyến khích
---
Bạn có thể quay lại commit cũ bằng Git GUI một cách dễ dàng
> Repository -> Visualize All Branch History. Chuột phải vào commit: 

![alt](images/gitRevertCommit.png)

---

## Nỗi đau muôn thuở: git merge
### Để merge code từ nhánh B vào nhánh A.
- Checkout về nhánh A
```
> git checkout A
```
- Merge nhánh B vào
```
> git merge B
```
- Nhập message, lưu lại là xong.

### **Resolve conflict sau khi tạo merge request.**
Checkout về branch mà bạn dùng để gửi merge_request.
- Fetch mới lại target branch của merge request trên máy bạn:
```php
> git fetch <remote_name> <target_branch_name>:<target_branch_name>
```
- Rebase lại target branch
```php
> git rebase <target_branch>
```
Sau khi chạy lệnh rebase, những file bị conflict sẽ hiện thị với từ khóa conflict. Bạn mở các file đấy lên và xem những phần code bị conflict. Những đoạn code này sẽ được chia ra thành 2 phần, phần nửa trên là code hiện tại của target_branch, nửa dưới là code mà bạn đang sửa. Hãy đọc và giữ lại những phần code phù hợp. xóa bỏ các dấu == phân cách.
- Thêm lại các file sửa đổi vào commit và kết thúc rebase
```php
> git add .
> git rebase --continute
```
- Trường hợp bạn chưa biết resolve những đoạn conflict như nào, có thể huỷ bỏ quá trình rebase bằng cách:\
```php
> git rebase --abort
```