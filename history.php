
<?php
            session_start();
            if(isset($_GET['dangxuat'])&&$_GET['dangxuat']==1){
                unset($_SESSION['submit']);
                header('Location:index.php');
            }
?>
<?php
require_once('database/dbhelper.php');
require_once('utils/utility.php');


// $order_id = $order_details_List['order_id'];
// $product_id = $order_details_List['product_id'];
// $num = $order_details_List['num'];
// $price = $order_details_List['price'];
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="./login.css">
  <link rel="shortcut icon" type="image/png" href="/Web/admin/product/uploads/avt3.png"/>
    <script src="https://kit.fontawesome.com/1147679ae7.js" crossorigin="anonymous"></script><!--link lấy icon -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <title>Lịch sử giao hàng</title>
</head>

<?php 
include("Layout/header.php"); 
?>
<body>
    <div id="wrapper">
        

        <!-- END HEADR -->
        <main>
            <section class="cart">
                <div class="container-top">
                    <div class="panel panel-primary">
                        <div class="panel-heading" style="padding: 1rem 0;">
                            <ul class="nav nav-tabs">
                                <li class="nav-item">
                                    <a class="nav-link" href="cart.php">Giỏ hàng</a>
                                </li>
                                <li class="nav-item ">
                                    <a class="nav-link active" href="dashboard.php">Lịch sử mua hàng</a>
                                </li>
                            </ul>
                            <h2 style="padding-top:8rem" class="">Lịch sử mua hàng</h2>
                        </div>
                        <div class="panel-body"></div>
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr style="font-weight: 500;text-align: center;">
                                    <td width="50px">STT</td>
                                    <td>Ảnh</td>
                                    <td>Tên sản phẩm</td>
                                    <td>Giá</td>
                                    <td>Số lượng</td>
                                    <td>Tổng cộng</td>
                                    <td>Trạng thái</td>
                                    <!-- <td width="50px"></td> -->
                                </tr>
                            </thead>
                            <tbody>
                                <?php

                                if (isset($_COOKIE['tendangnhap']) && $user_admin == 'Admin_Chu' ) {
                                    $tendangnhap = $_COOKIE['tendangnhap'];

                                    $sql = "SELECT * FROM tbl_admin WHERE tendangnhap = '$tendangnhap'";
                                    $user = executeResult($sql); // in ra 1 dòng 
                                    foreach ($user as $item) {
                                        $userId = $item['id_admin'];
                                    }

                                    $sql = "SELECT * from order_details, product where product.id=order_details.product_id AND order_details.id_user = '$userId' ORDER BY order_id DESC";
                                    $order_details_List = executeResult($sql);
                                    $total = 0;
                                    $count = 0;
                                    // $sql = 'SELECT * FROM user where username = $username';
                                    foreach ($order_details_List as $item) {
                                        echo '
                                        <tr style="text-align: center;">
                                            <td width="50px">' . (++$count) . '</td>
                                            <td style="text-align:center">
                                                <img width="50px" src="admin/product/' . $item['thumbnail'] . '">
                                            </td>
                                            <td>' . $item['title'] . '</td>
                                            <td class="b-500 orange">' . number_format($item['price'], 0, ',', '.') . '<span> VNĐ</span></td>
                                            <td width="100px">' . $item['num'] . '</td>
                                            <td class="b-500 red">' . number_format($item['num'] * $item['price'], 0, ',', '.') . '<span> VNĐ</span></td>
                                            <td style="color:green; font-weight:600;">' . $item['status'] . '</td>
                                        </tr>
                                        ';
                                    }
                                }
								//fix-code
								if(isset($_COOKIE['tendangnhap'])) {
                                    $tendangnhap = $_COOKIE['tendangnhap'];

                                    $sql = "SELECT * FROM tbl_dangky WHERE tendangnhap = '$tendangnhap'";
                                    $user = executeResult($sql); // in ra 1 dòng 
                                    foreach ($user as $item) {
                                        $userId = $item['id_dangky'];
                                    }
                                    
                                    $sql = "SELECT * from order_details, product where product.id=order_details.product_id AND order_details.id_user = '$userId' ORDER BY order_id DESC";
                                    $order_details_List = executeResult($sql);
                                    $total = 0;
                                    $count = 0;
                                    // $sql = 'SELECT * FROM user where username = $username';
                                    foreach ($order_details_List as $item) {
                                        echo '
                                        <tr style="text-align: center;">
                                            <td width="50px">' . (++$count) . '</td>
                                            <td style="text-align:center">
                                                <img width="50px" src="admin/product/' . $item['thumbnail'] . '">
                                            </td>
                                            <td>' . $item['title'] . '</td>
                                            <td class="b-500 orange">' . number_format($item['price'], 0, ',', '.') . '<span> VNĐ</span></td>
                                            <td width="100px">' . $item['num'] . '</td>
                                            <td class="b-500 red">' . number_format($item['num'] * $item['price'], 0, ',', '.') . '<span> VNĐ</span></td>
                                            <td style="color:green; font-weight:600;">' . $item['status'] . '</td>
                                        </tr>
                                        ';
                                    }
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
        </main>
        
    </div>
    </script>
</body>
<style>
    main{
        padding-bottom: 4rem;
    }
    .b-500 {
        font-weight: 500;
    }

    .bold {
        font-weight: bold;
    }

    .red {
        color: rgba(207, 16, 16, 0.815);
    }

    .orange {
        color: #a25437;
    }
</style>

</html>
<!--------------------FOOTER--------------------------- -->
<footer class="section-p1"><!--mục footer -->
    <div class="col">
        <h4>HỆ THỐNG CỬA HÀNG</h4><!--Hệ thông cửa hàng -->
        <p>Quận 10 - 561 Sư Vạn Hạnh, Phường 13.</p>
        <p>Quận Tân Bình - 136 Nguyễn Hồng Đào, Phường 14.</p>
        <p>Quận Gò Vấp - 41 Quang Trung, Phường 3.</p>
        <p>Đống Đa - 49-51 Hồ Đắc Di, Phường Nam Đồng.</p>
    </div> 
    <div class="col">
        <h4>THÔNG TIN LIÊN HỆ</h4><!--Thông tin liên hệ -->
        <p>Tuyển dụng:<a href ="liên kết "> link Website </a> </p>
        <p>Website:<a href ="liên kết "> link Website </a></p>
        <p>Liên hệ CSKH: support@<a href ="liên kết "> link Website </a></p>
        <p>For business: contact@<a href ="liên kết "> link Website </a></p>
    </div>
    <div class="col">
        <h4>FOLLOW US ON SOCIAL MEDIA</h4><!--Follow us on social media-->
        <li><i class="fa fa-facebook"></i></li>
        <li><i class="fa fa-instagram"></i></li>
        <li><i class="fa fa-youtube"></i></li>            
    </div>    
</footer>
<style>
/*----------------FOOTER--------------------*/

footer{
    background:rgb(0, 0, 0);
    display:flex;
    margin-top:0px;
    justify-content: space-around;
    margin-bottom:0px;
    padding-bottom: 20px;   /*chỉnh size background đen */
    padding-left:150px;
    
}
footer.col{
    
    display:flex;
    flex-direction:column;
    align-items: flex-start;
    margin-top: 100p;
}
footer h4{   /*chỉnh size chữ H4*/
    color:rgb(255, 255, 255);
    font-size: 16px;
    padding-bottom:30px;
    margin-top:40px;
    font-weight: bold;
}
footer p{  /*chỉnh size chữ P*/
    color:rgb(255, 255, 255);
    font-size: 13px;
    text-decoration:none;
    margin-bottom:15px;

 
}
footer li{ /*chỉnh icon fb,instagram,youtube*/
    color:#fff;
    margin-top: 3px;
    font-weight: bold;
    
   
}
  @media screen and  (max-width: 870px)  and (min-width:300px){
    body {
   width: 1500px;
    }

</style>
