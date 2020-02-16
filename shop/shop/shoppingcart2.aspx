<%@ Page Title="" Language="C#" MasterPageFile="~/iframe2.Master" AutoEventWireup="true" CodeBehind="shoppingcart2.aspx.cs" Inherits="shop.shoppingcart2" %>
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
    <form runat="server">
	<div class="home">
		<div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="images/product_background.jpg" data-speed="0.8"></div>
		<div class="home_container">
			<div class="home_content">
				<div class="home_title">购物车</div>
			</div>
		</div>
	</div>

	<!-- Cart -->

	<div class="cart_section" runat="server">
		<div class="section_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="cart_container">
							
							<!-- Cart Bar -->
							<div class="cart_bar">
								<ul class="cart_bar_list item_list d-flex flex-row align-items-center justify-content-start">
									<li>商品</li>
                                    <li>商品ID</li>
									<li>详细信息</li>
									<li>价格</li>
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
                                        <asp:HyperLink runat="server" Text='<%# Eval("gid") %>' NavigateUrl='<%# Eval("gid","~/goodsdetail.aspx?gid={0}") %>'></asp:HyperLink>
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
                                        <div>
                                            <div><asp:RadioButton ID="radSex22" runat="server" GroupName="goods_radio" /></div>
                                        </div>
									</li>
								</ul>
							</div>
                           

							<!-- Cart Buttons -->
<%--							<div class="cart_buttons d-flex flex-row align-items-start justify-content-start">
								<div class="cart_buttons_inner ml-auto d-flex flex-row align-items-start justify-content-start flex-wrap">
									<asp:button class="button button_clear trans_200" id="but_delall" runat="server" onclick="But_deleteall" Text="清空"/>
								</div>
							</div>--%>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="section_container cart_extra_container" runat="server">
			<div class="container" runat="server">
				<div class="row" runat="server">

					<!-- Shipping & Delivery -->
					<div class="col-xxl-6"  runat="server">
						<div class="cart_extra cart_extra_1"  runat="server">
							<div class="cart_extra_content cart_extra_coupon"  runat="server">
								<div class="shipping" runat="server">
									<div class="cart_extra_title">邮寄方式</div>
									<ul runat ="server">
										<li class="shipping_option d-flex flex-row align-items-center justify-content-start">
											<label class="radio_container">
												<input type="radio" id="radio_1" name="shipping_radio" class="shipping_radio"/>
												<span class="radio_mark"></span>
												<span class="radio_text">极速</span>
											</label>
											<div class="shipping_price ml-auto">$4.99</div>
										</li>
										<li class="shipping_option d-flex flex-row align-items-center justify-content-start">
											<label class="radio_container">
												<input type="radio" id="radio_2" name="shipping_radio" class="shipping_radio"/>
												<span class="radio_mark"></span>
												<span class="radio_text">普通</span>
											</label>
											<div class="shipping_price ml-auto">$1.99</div>
										</li>
										<li class="shipping_option d-flex flex-row align-items-center justify-content-start">
											<label class="radio_container">
												<input type="radio" id="radio_3" name="shipping_radio" class="shipping_radio" checked="checked"/>
												<span class="radio_mark"></span>
												<span class="radio_text">当面</span>
											</label>
											<div class="shipping_price ml-auto">Free</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>

					<!-- Cart Total -->
	<%--				<div class="col-xxl-6">
						<div class="cart_extra cart_extra_2">
							<div class="cart_extra_content cart_extra_total">
								<button class="checkout_button trans_200" onclick="but_click1" runat="server">确认付款</button>
							</div>
						</div>
					</div>--%>
				</div>
			</div>
		</div>
	</div>

	<!-- Newsletter -->

	<div class="newsletter">
		<div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="images/newsletter.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2">
					<div class="newsletter_content text-center">
						<div class="newsletter_title_container">
							<div class="newsletter_title">subscribe to our newsletter</div>
							<div class="newsletter_subtitle">we won't spam, we promise!</div>
						</div>
						<div class="newsletter_form_container">
							<form action="#" id="newsletter_form" class="newsletter_form">
								<input type="email" class="newsletter_input" placeholder="your e-mail here" required="required"/>
								<button class="newsletter_button">submit</button>
							</form>
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
<script src="js/cart.js"></script>
 </form>
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

                    $.post("cart_delete.aspx",
                        {
                            sc_id: value
                        },
                        function (data, status) {
                            //alert(data);
                            
                        });

                });
                $(".btn_buy").click(function () {
                    var value = $(this).html();
                    //alert(value);
                    //<span style=\"display:none\">"+ ds2.Tables[0].Rows[i][6].ToString() + "</span><i class=\"fa fa-times\" aria-hidden=\"true\"></i>
                    var regExp = new RegExp("<span style=\"display:none\">"); // /^(.{0,10}).*$/
                    value = value.replace(regExp, " ");
                    value = value.replace("</span>购买", "");
                    alert(value);

                    $.post("cart_buy.aspx",
                        {
                            sc_id: value
                        },
                        function (data, status) {
                            //alert(data);

                        });

                });

        });
    </script>
</asp:Content>
