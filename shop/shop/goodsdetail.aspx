<%@ Page Title="" Language="C#" MasterPageFile="~/iframe.Master" AutoEventWireup="true" CodeBehind="goodsdetail.aspx.cs" Inherits="shop.goodsdetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" type="text/css" href="styles/bootstrap-4.1.3/bootstrap.css"/>
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css"/>
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css"/>
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css"/>
<link rel="stylesheet" type="text/css" href="styles/product.css"/>
<link rel="stylesheet" type="text/css" href="styles/product_responsive.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="home">
		<div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="images/product_background.jpg" data-speed="0.8"></div>
		<div class="home_container">
			<div class="home_content">
				<div class="home_title">商品详细</div>
			</div>
		</div>
	</div>

	<!-- Products -->

	<div class="product">


		<!-- Product Content -->
		<div class="section_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="product_content_container d-flex flex-lg-row flex-column align-items-start justify-content-start">
							<div class="product_content order-lg-1 order-2" id="image" runat="server">
								<div class="product_content_inner">
									<div class="product_image_row d-flex flex-md-row flex-column align-items-md-end align-items-start justify-content-start">
										<div class="product_image_1 product_image">
											<img src="images/product_single_1.jpg" alt=""/>
										</div>
										<div class="product_image_2 product_image"><img src="images/product_single_2.jpg" alt=""/></div>
									</div>
									<div class="product_image_row">
										<div class="product_image_3 product_image"><img src="images/product_single_3.jpg" alt=""/></div>
									</div>
									<div class="product_image_row d-flex flex-md-row flex-column align-items-start justify-content-start">
										<div class="product_image_4 product_image"><img src="images/product_single_4.jpg" alt=""/></div>
										<div class="product_image_5 product_image"><img src="images/product_single_5.jpg" alt=""/></div>
									</div>
								</div>
							</div>
							<div class="product_sidebar order-lg-2 order-1">
								<form action="#" id="product_form" class="product_form" runat="server">
                                    <div id="goods" runat="server">
									<div class="product_name">Brown Shoulder Bag</div>
									<div class="product_price">$19.50</div>
									<div class="product_color">Color: <span>Brown</span></div>
                                    </div>
                                    <div class="product_size">
										<div class="product_size_title">数量：</div>
										<div class="product_size_list">
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
										</div>
									</div>
                                    <asp:Button ID="Button1" runat="server" Text="加入购物车" class="cart_button trans_200" onclick="Button1_Click"/>
									<%--<button class="cart_button trans_200">加入购物车</button>--%>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script src="plugins/greensock/TweenMax.min.js"></script>
<script src="plugins/greensock/TimelineMax.min.js"></script>
<script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="plugins/greensock/animation.gsap.min.js"></script>
<script src="plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="plugins/parallax-js-master/parallax.min.js"></script>
<script src="plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="plugins/Isotope/fitcolumns.js"></script>
<script src="js/product.js"></script>

</asp:Content>
