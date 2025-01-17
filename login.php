<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<?php
	session_start();
	require_once('config.php');
    require_once('database/dbhelper.php');
	if(isset($_POST['submit'])){
        $user_admin = $_POST['tendangnhap'];
        $pass_admin = $_POST['matkhau'];
		$tendangnhap = $_POST['tendangnhap'];
		$matkhau = $_POST['matkhau'];
        $sql = "SELECT * FROM tbl_dangky WHERE tendangnhap='".$tendangnhap."' AND matkhau='".$matkhau."' LIMIT 1";
        $sql_admin = "SELECT * FROM tbl_admin WHERE tendangnhap='".$user_admin."' AND matkhau='".$pass_admin."' LIMIT 1";
		$row = mysqli_query($mysqli,$sql);
        $row_admin = mysqli_query($mysqli,$sql_admin);
		$count = mysqli_num_rows($row);
        $count_admin = mysqli_num_rows($row_admin);
		if($count>0){
			$_SESSION['submit'] = $tendangnhap;
			echo '<script>alert("Đăng nhập thành công.");
                window.location.href="index.php";
                </script>';
            session_start();
            setcookie("tendangnhap", $tendangnhap, time() + 30 * 24 * 60 * 60, '/');
            setcookie("matkhau", $matkhau, time() + 30 * 24 * 60 * 60, '/');
		}
        elseif($count_admin > 0){
            $_SESSION['submit'] = $user_admin;
            echo '<script>alert("Xin chào Admin ^^");
                window.location.href="index.php";
                </script>';
          	$tendangnhap = trim(strip_tags($_POST['tendangnhap']));
            $matkhau = trim(strip_tags($_POST['matkhau']));
            session_start();
            setcookie("tendangnhap", $tendangnhap, time() + 30 * 24 * 60 * 60, '/');
            setcookie("matkhau", $matkhau, time() + 30 * 24 * 60 * 60, '/');
        }
        else{
			echo '<script>alert("Tài khoản hoặc Mật khẩu không đúng,vui lòng nhập lại.");</script>';
			
		}
    }
?>
<?php 
include("Layout/header.php"); 
?>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="./login.css">
    <script src="https://kit.fontawesome.com/1147679ae7.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <link rel="shortcut icon" type="image/png" href="/Web/admin/product/uploads/avt3.png"/>
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="style.css">
  
</head>
<body>
    <div id="wrapper" style="padding-top:10%;">
        <div style="margin: 0;
                                        top: 150px;
                                        left: 50%;
                                        position: absolute;
                                        text-align: center;
                                        transform: translateX(-50%);
                                        background-color: rgb(248, 248, 248);
                                        border-radius: 15px;
                                        border-top: 5px solid #000000;
                                        border-bottom: 5px solid #000000;
                                        border-left: 5px solid #000000;
                                        border-right: 5px solid #000000;
                                        width: 410px;
                                        height: 550px;
                                        margin-bottom:300px;">

        <div class="container" style="  margin: 0;
                                        top: 0px;
                                        left: 46%;
                                        position: absolute;
                                        text-align: center;
                                        transform: translateX(-50%);
                                        height: 550px;
                                        margin-bottom:300px;">
            <form action="login.php" method="POST">
            <h4 style="text-align: center;  font-size: 20px;margin-top:70px;padding-left:32px;">DirtyCoin</h4>
            <h5 style="text-align: center;  font-size: 16px;color: #696a6c;letter-spacing: 1.5px;margin-top: 15px;margin-bottom: 70px;padding-left:33px;">Sign in to your account</h5>
                <div class="form-group">
                    <input type="text" name="tendangnhap" class="form-control" placeholder="Tài khoản" style="  display: block;margin: 20px auto;background: #efeff0;border: 0;border-radius: 5px;padding: 14px 10px;width: 320px;outline: none;color: #000000;">
                </div>
                <div class="form-group">

                    <input type="password" name="matkhau" class="form-control" placeholder="Mật khẩu" style="  display: block;margin: 20px auto;background: #efeff0;border: 0;border-radius: 5px;padding: 14px 10px;width: 320px;outline: none;color: black;">
                </div>
                <a href="forget.php" style="  position: relative;float: right;right: -28px;">Quên mật khẩu</a>
                <div style="padding-top: 5px;" class="form-group">
                    <input type="submit" name="submit" class="btn btn-primary" value="Đăng nhập" style="  border:0;background: #070707;color: #dfdeee;border-radius: 100px;width: 340px;height: 49px;font-size: 16px;position: absolute;top: 79%;left: 1%;transition: 0.3s;cursor: pointer;">

                    <p style="position:absolute;top: 92%;left: 19%;">Bạn chưa có tài khoản? <a href="dangky.php">Đăng ký</a></p>
                </div>
            </form>
        </div>
        </div>
    </div>
    

</body>
<footer class="section-p1">
    <div class="col">
        <h4>HỆ THỐNG CỬA HÀNG</h4><
        <p>Quận 10 - 561 Sư Vạn Hạnh, Phường 13.</p>
        <p>Quận Tân Bình - 136 Nguyễn Hồng Đào, Phường 14.</p>
        <p>Quận Gò Vấp - 41 Quang Trung, Phường 3.</p>
        <p>Đống Đa - 49-51 Hồ Đắc Di, Phường Nam Đồng.</p>
    </div> 
    <div class="col">
        <h4>THÔNG TIN LIÊN HỆ</h4>
        <p>Tuyển dụng:<a href ="liên kết "> link Website </a> </p>
        <p>Website:<a href ="liên kết "> link Website </a></p>
        <p>Liên hệ CSKH: support@<a href ="liên kết "> link Website </a></p>
        <p>For business: contact@<a href ="liên kết "> link Website </a></p>
    </div>
    <div class="col">
        <h4>FOLLOW US ON SOCIAL MEDIA</h4>
        <li><i class="fa fa-facebook"></i></li>
        <li><i class="fa fa-instagram"></i></li>
        <li><i class="fa fa-youtube"></i></li>            
    </div>    
</footer>
<style>


footer{
    background:rgb(0, 0, 0);
    display:flex;
    margin-top:650px;
    justify-content: space-around;
    margin-bottom:0px;
    padding-bottom: 20px;  
    padding-left:150px;
    
}
footer.col{
    
    display:flex;
    flex-direction:column;
    align-items: flex-start;
    margin-top: 100p;
}
footer h4{  
    color:rgb(255, 255, 255);
    font-size: 16px;
    padding-bottom:30px;
    margin-top:40px;
    font-weight: bold;
}
footer p{  
    color:rgb(255, 255, 255);
    font-size: 13px;
    text-decoration:none;
    margin-bottom:15px;

 
}
footer li{ 
    color:#fff;
    margin-top: 3px;
    font-weight: bold;
    
   
}
  @media screen and  (max-width: 870px)  and (min-width:300px){
    body {
   width: 1500px;
    }
   
</style>

<style>