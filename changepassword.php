<?php
    session_start();
    require_once('config.php');
    require_once('database/dbhelper.php');

    // Check if the user is logged in
    if (!isset($_SESSION['submit'])) {
        header("Location: login.php");
        exit;
    }

    // Fetch current user
    $current_user = $_SESSION['submit'];

    // Process the form submission
    if (isset($_POST['submit'])) {
        $old_password = $_POST['old_password'];
        $new_password = $_POST['new_password'];
        $confirm_password = $_POST['confirm_password'];

        // Validate new password and confirm password match
        if ($new_password !== $confirm_password) {
            echo '<script>alert("Mật khẩu mới và xác nhận mật khẩu không khớp.");</script>';
        } else {
            // Check if old password is correct
            $sql = "SELECT * FROM tbl_dangky WHERE tendangnhap='$current_user' AND matkhau='$old_password' LIMIT 1";
            $result = mysqli_query($mysqli, $sql);
            if (mysqli_num_rows($result) > 0) {
                // Update the password
                $update_sql = "UPDATE tbl_dangky SET matkhau='$new_password' WHERE tendangnhap='$current_user'";
                if (mysqli_query($mysqli, $update_sql)) {
                    echo '<script>alert("Mật khẩu đã được thay đổi thành công."); window.location.href="index.php";</script>';
                } else {
                    echo '<script>alert("Đã có lỗi xảy ra. Vui lòng thử lại.");</script>';
                }
            } else {
                echo '<script>alert("Mật khẩu cũ không chính xác.");</script>';
            }
        }
    }
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đổi Mật Khẩu</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #f8f8f8;
        }
        .container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-control {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }
        .btn-primary {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2 class="text-center">Đổi Mật Khẩu</h2>
        <form method="POST">
            <div class="form-group">
                <label for="old_password">Mật khẩu cũ:</label>
                <input type="password" id="old_password" name="old_password" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="new_password">Mật khẩu mới:</label>
                <input type="password" id="new_password" name="new_password" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="confirm_password">Xác nhận mật khẩu mới:</label>
                <input type="password" id="confirm_password" name="confirm_password" class="form-control" required>
            </div>
            <button type="submit" name="submit" class="btn btn-primary">Đổi mật khẩu</button>
        </form>
    </div>

</body>
</html>
