<?php
use MongoDB\Driver\Query;
session_start();
include "includes/db.php";
if(isset($_SESSION['email'])){
    echo($_SESSION['email']);
    $sql = "SELECT * FROM `user` where `email`='".$_SESSION['email']."' and `password`='".$_SESSION['password']."'";
$result = $con->query($sql);
$row = $result->fetch_assoc();
if (!isset($_SESSION['email']) && $row['role'] != 'admin'&& $row['password']!=$_SESSION['password']) {
    echo ("<script>window.open('login.php','_self')</script>");
} else {

?>

    <?php include('../includes/db.php'); ?>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang Admin</title>
        <link rel="stylesheet" href="styles/desktop.css" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="../js/jquery-3.6.0.js"></script>
    </head>

    <body>
        <div class="container">
            <div class="header">
                <div class="navbar-header">
                    <h3>
                        <a class="admin_name">
                            Admin Area- <?php

                                        if (isset($_SESSION['email'])) {
                                            echo ($_SESSION['email']);
                                        } else {
                                            // echo ($_SESSION['name']);
                                        }

                                        ?>
                        </a>
                    </h3>
                </div>
                <!--/.navbar-header-->
                <div class="navbar-right-header">

                    <ul class="dropdown-navbar-right">
                        <li>
                            
                            <a><i class="fa fa-user"></i>&nbsp;<i class="fa fa-caret-down"></i></a>
                            <ul class="subnavbar-right">
                                <li><a href="../my_account.php?action=edit_account">Edit profile</a></li>
                                <li><a href="login.php">????ng xu???t</a></li>
                            </ul>
                        </li>
                    </ul>

                    <ul class="dropdown-navbar-right">
                        <li>
                            <a><i class="fa fa-bell"></i>&nbsp;<i class="fa fa-caret-down"></i></a>
                            <ul class="subnavbar-right">
                                <li><a>Th??ng B??o</a></li>

                            </ul>
                        </li>
                    </ul>
                    <ul class="dropdown-navbar-right">
                        
                        <li>
                            <a class="icon_home" href="../index.php" style="text-decoration: none;"><i class="fa fa-home" aria-hidden="true"></i>
                                &nbsp;
                                <!-- <p style="margin-left: -16px;">Website</p> -->
                            </a>
                            
                        </li>
                    </ul>
                </div>
                <!--/.navbar-right-header-->
            </div>
            <!--/.header-->
            <div class="body_container">
                <div class="left_sidebar">
                    <div class="left_sidebar_box">
                        <ul class="left_sidebar_first_level">
                            <li><a  target="_blank" class="my_web"><i class="fa fa-dashboard"></i> Qu???n tr??? web</a></li>
                            <li>
                                <!--i class="arrow fa fa-angle-left"></i>-->
                                <a class="title_edit_admin" href="#"><i class="fa fa-th-large"></i> &nbsp;S???n ph???m <i class="arrow fa fa-angle-left"></i></a>
                                <ul class="left_sidebar_second_level">

                                    <li><a href="index.php?action=add_pro">Th??m S???n ph???m</a></li>
                                    <li><a href="index.php?action=view_pro">Qu???n l?? S???n Ph???m</a></li>
                                </ul>
                                <!--/.left_sidebar_second_level-->
                            </li>

                            <li>
                                <a class="title_edit_admin" href="#"><i class="fa fa-plus"></i> &nbsp;Th??? lo???i S???n ph???m <i class="arrow fa fa-angle-left"></i></a>
                                <ul class="left_sidebar_second_level">
                                    <li><a href="index.php?action=add_cat">Th??m Lo???i S???n ph???m m???i</a></li>
                                    <li><a href="index.php?action=view_cat">Qu???n l?? C??c th??? lo???i</a></li>
                                </ul>
                                <!--/.left_sidebar_second_level-->
                            </li>
                            <li>
                                <a class="title_edit_admin" href="#"><i class="fa fa-plus"></i> &nbsp;Th????ng Hi???u <i class="arrow fa fa-angle-left"></i></a>
                                <ul class="left_sidebar_second_level">
                                    <li><a href="index.php?action=add_brand">Th??m Th????ng hi???u m???i</a></li>
                                    <li><a href="index.php?action=view_brands">Qu???n ?? C??c Th????ng hi???u</a></li>
                                </ul>
                                <!--/.left_sidebar_second_level-->
                            </li>
                            <li>
                                <a class="title_edit_admin" href="#"><i class="fa fa-gift"></i> &nbsp;Ng?????i D??ng <i class="arrow fa fa-angle-left"></i></a>
                                <ul class="left_sidebar_second_level">
                                    
                                    <li><a href="index.php?action=view_users">Qu???n l?? Ng?????i D??ng</a></li>
                                </ul>
                                <!--/.left_sidebar_second_level-->
                            </li>
                        </ul>
                        <!--/.left_sidebar_first_level-->
                    </div>
                    <!--/.left_sidebar_box-->

                </div>
                <!--/.left_sidebar-->
                <div class="content">
                    <div class="content_box">
                        <?php
                        if (isset($_GET['action'])) {
                            $action = $_GET['action'];
                        } else {
                            $action = '';
                        }

                        switch ($action) {
                            case 'add_pro';
                                include 'includes/insert_product.php';
                                break;

                            case 'view_pro';
                                include 'includes/view_products.php';
                                break;

                            case 'edit_pro';
                                include 'includes/edit_product.php';
                                break;

                            case 'add_cat';
                                include 'includes/insert_category.php';
                                break;

                            case 'view_cat';
                                include 'includes/view_categories.php';
                                break;

                            case 'edit_cat';
                                include 'includes/edit_category.php';
                                break;

                            case 'add_brand';
                                include 'includes/insert_brand.php';
                                break;
                            case 'view_brands';
                                include 'includes/view_brands.php';
                                break;

                            case 'edit_brand';
                                include 'includes/edit_brand.php';
                                break;

                            case 'view_users';
                                include 'includes/view_users.php';
                                break;
                        }
                        ?>
                    </div>
                    <!--/.content_box-->
                </div>
                <!--/.content-->
            </div>
            <!--/.body-container-->
        </div>
        <!--/.container-->
    </body>

    </html>



    <!-- hi???u ???ng t???o thanh menu tr?????t -->

    <!--C??i js n??y l?? :sau khi click v??o bi???u t?????ng or... th?? n?? s??? x??? l??.
        th?? ??? ????y th?? ta s??? th???c hi???n t??m ki???m class ????? x??? l?? b???ng h??m find() ,
        r???i ti???p t???c s??? d???ng h??m slideToggle() : n?? t???a nh?? ch???c n??ng :hover
        v???i t???c ????? l?? fast -->
    <script>
        //thanh products,categories
        $(document).ready(function() {
            $(".dropdown-navbar-right").on('click', function() {
                $(this).find(".subnavbar-right").slideToggle('fast');
            });
            // th??ng b??o,account
            $(".left_sidebar_first_level li").on('click', this, function() {
                $(this).find(".left_sidebar_second_level").slideToggle('fast');
            });
        });
    </script>
<?php 
    }
}else{
    echo ("<script>window.open('login.php','_self')</script>");
}
 ?>