# Deploy react by simple way

#### 1. mindset deploy (đơn giản nhất)

* Build react app để lấy folder build 
* copy toàn bộ folder  build vào folder ```/var/www/html/ ``` đây là nơi server các file html 
(nginx hoặc httpd của apache đều dùng chung )

```bash
 cp -r build/* /var/www/html/
#  -r là recusive đệ quy, lý do là folder là cây nên phải đệ quy 
```
</br>
Chú ý: Phải có máy chủ web nginx , mở tường lửa nếu có.

#### 2. demo trên docker.
có thể xem file ```dockerfile```  để build ra images 

```bash 
cd thư mục pj 
docker build -t react_ubuntu_ngin:1.0.1 -f Dockerfile .
# -t tên
# -f file (ở đây là Dockerfile )

# run images 
docker run -p 80:80 <imagesid >
# ánh xạ port 80 ra để test 


docker iamges #Khá nặng 
REPOSITORY          TAG       IMAGE ID       CREATED          SIZE
react_ubuntu_ngin   1.0.1     620f1d32c220   22 minutes ago   1.11GB
```




###### Chú ý 


```zsh 
-y : say yes 
DEBIAN_FRONTEND='noninteractive'. : bỏ qua phần chọn khu vực khi cài npm 

chay deamon 
CMD ["nginx", "-g", "daemon off;"]

```


