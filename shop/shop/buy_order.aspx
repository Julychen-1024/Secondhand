<%@ Page Title="" Language="C#" MasterPageFile="~/iframe2.Master" AutoEventWireup="true" CodeBehind="buy_order.aspx.cs" Inherits="shop.buy_order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" type="text/css" href="styles/bootstrap-4.1.3/bootstrap.css"/>
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css"/>
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css"/>
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css"/>
<link rel="stylesheet" type="text/css" href="styles/cart.css"/>
<link rel="stylesheet" type="text/css" href="styles/cart_responsive.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
     <!-- Home -->

	<div class="home">
		<div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="images/product_background.jpg" data-speed="0.8"></div>
		<div class="home_container">
			<div class="home_content">
				<div class="home_title">我的订单</div>
			</div>
		</div>
	</div>

	<!-- Cart -->

	<div class="cart_section">
		<div class="section_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="cart_container">
							
							<!-- Cart Bar -->
							<div class="cart_bar">
								<ul class="cart_bar_list item_list d-flex flex-row align-items-center justify-content-start">
                                    <li>订单状态</li>
                                    <li>订单号</li>
                                    <li>卖家</li>
                                    <%--<li>商品</li>--%>
									<li>商品ID</li>
									<li>数量</li>
									<li>总价</li>
								</ul>
							</div>

							<!-- Cart Items -->
							<div class="cart_items">
								<ul class="cart_items_list" id="item" runat ="server">
									<!-- Cart Item -->
									<li class="cart_item item_list d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-start">
										<div class="product d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-start">
											<div><div class="product_image"><img src="C:\Users\11830\Desktop\1.jpg" alt=""/></div></div>
											<div class="product_name"><a href="product.html">Brown Shoulder Bag</a></div>
										</div>
										<div class="product_color text-lg-center product_text"><span>Color: </span>Brown</div>
										<div class="product_size text-lg-center product_text"><span>Size: </span>One Size</div>
										<div class="product_price text-lg-center product_text"><span>Price: </span>$19.50</div>
										<div class="product_quantity_container">
											<div class="product_quantity ml-lg-auto mr-lg-auto text-center">
												<span class="product_text product_num">1</span>
												<div class="qty_sub qty_button trans_200 text-center"><span>-</span></div>
												<div class="qty_add qty_button trans_200 text-center"><span>+</span></div>
											</div>
										</div>
										<div class="product_total text-lg-center product_text"><span>Total: </span>$19.50</div>
									</li>
								</ul>
							</div>

							<!-- Cart Buttons -->
						</div>
					</div>
				</div>
			</div>
		</div>

		

	<!-- Newsletter -->


<script src="plugins/greensock/TweenMax.min.js"></script>
<script src="plugins/greensock/TimelineMax.min.js"></script>
<script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="plugins/greensock/animation.gsap.min.js"></script>
<script src="plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="plugins/parallax-js-master/parallax.min.js"></script>
<script src="js/cart.js"></script>

         <script>
       
            $(document).ready(function () {

                //点击添加购物车
                $(".btn_delete").click(function () {
                    var value = $(this).html();
                    //alert(value);
                    //<span style=\"display:none\">"+ ds2.Tables[0].Rows[i][6].ToString() + "</span><i class=\"fa fa-times\" aria-hidden=\"true\"></i>
                    var regExp = new RegExp("<span style=\"display:none\">"); // /^(.{0,10}).*$/
                    value = value.replace(regExp, " ");
                    value = value.replace("</span><i class=\"fa fa-times\" aria-hidden=\"true\"></i>", "");
                    alert(value);

                    $.post("order_delete.aspx",
                        {
                            o_id: value
                        },
                        function (data, status) {
                            //alert(data);
                            
                        });

                });

        });
    </script>
</asp:Content>
