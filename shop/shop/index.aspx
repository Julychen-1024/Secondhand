<%@ Page Title="" Language="C#" MasterPageFile="~/iframe.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="shop.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       
    .post-img{
		overflow: hidden;
	}
	.post-img img{
		width: 100%; 
		height: auto;
		transform: scale(1);
		transition: all 1s ease-in-out 0s;
	}
	.post-slide:hover .post-img img{
		transform: scale(1.08);
	}
    </style>
   

</asp:Content>
 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div style="background-color: #e3f2fd; padding-top:10px" >
	    <div class="container " runat="server">
            <form id="form1" runat="server">
                <div class="row dropdown " style="padding-top:10px; padding-left:20px" runat="server">
                    <div class="dropdown form-inline col-md-3 justify-content-end" runat="server">
                        <label class="mr-md-4">排序:</label>
                        <asp:DropDownList ID="DropDownList2" CssClass="btn  btn-outline-info btn-sm" runat="server" >
                        </asp:DropDownList>
                    </div>
                    <div class="dropdown form-inline col-md-3 text-left">
                       <label class="mr-md-4">选择种类:</label>
                       <asp:DropDownList ID="li_cer_type" CssClass="btn  btn-outline-info btn-sm" runat="server" >
                       </asp:DropDownList>
                    </div>
                    <div class="form-inline my-2 my-lg-0 col-md-6 input-group-sm" runat="server" >
                        <input class="form-control mr-sm-2 col-9" id="input" type="search" runat="server" placeholder="Search" aria-label="Search"/>
                      
                        <asp:Button class="btn btn-outline-success my-2 my-sm-0 btn-sm" runat="server" ID="submit"  Text="Search" OnClick="submit_Click" ></asp:Button >
                    </div>
                 </div>
                
                
            </form>
		 </div>
    </div>

    <!--卡片展示商品信息-->



    <div class=" container mt-1" id="product3" runat="server" >
          <div class="row p-2 rows">
              <div class="col-sm-3">
                <div class="card post-slide">
                  <div class="post-img " style="margin:0px;padding:0px;">
				        <a  href="#"><img src="image/3.png" class="card-img-top" alt=""/></a>
			       </div>
                  <div class="card-body">
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    
                      <a class="btn btn-light"><small class="text-muted"><strong>Price:$45.00</strong></small></a>
                      <a href="#" class="btn btn-outline-info"><i class="fa fa-cart-arrow-down good" aria-hidden="true"><span style="display:none"></span></i></a>
                  </div>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="card post-slide" style="width: 18rem;">
                  <div class="post-img " style="margin:0px;padding:0px;">
				        <a href="#"><img src="image/3.png" class="card-img-top" alt=""/></a>
			       </div>
                  <div class="card-body">
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <div class="">

                      </div>
                    <a class="btn btn-light"><small class="text-muted"><strong>Price:$45.00</strong></small></a>
                      <a href="#" class="btn btn-outline-info"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></a>
                  </div>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="card post-slide" style="width: 18rem;">
                  <div class="post-img " style="margin:0px;padding:0px;">
				        <a href="#"><img src="image/3.png" class="card-img-top" alt=""/></a>
			       </div>
                  <div class="card-body">
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <div class="">

                      </div>
                    <a class="btn btn-light"><small class="text-muted"><strong>Price:$45.00</strong></small></a>
                      <a href="#" class="btn btn-outline-info"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></a>
                  </div>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="card post-slide" style="width: 18rem;">
                  <div class="post-img " style="margin:0px;padding:0px;">
				        <a href="#"><img src="image/3.png" class="card-img-top" alt=""/></a>
			       </div>
                  <div class="card-body">
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <div class="">

                      </div>
                    <a class="btn btn-light"><small class="text-muted"><strong>Price:$45.00</strong></small></a>
                      <a href="#" class="btn btn-outline-info"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></a>
                  </div>
                </div>
              </div>
          </div>
          <div class="row p-2 rows" id="two">
              <div class="col-sm-3">
                <div class="card post-slide" style="width: 18rem;">
                  <div class="post-img " style="margin:0px;padding:0px;">
				        <a href="#"><img src="image/3.png" class="card-img-top" alt=""/></a>
			       </div>
                  <div class="card-body">
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <div class="">

                      </div>
                    <a class="btn btn-light"><small class="text-muted"><strong>Price:$45.00</strong></small></a>
                      <a href="#" class="btn btn-outline-info"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></a>
                  </div>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="card post-slide" style="width: 18rem;">
                  <div class="post-img " style="margin:0px;padding:0px;">
				        <a href="#"><img src="image/3.png" class="card-img-top" alt=""/></a>
			       </div>
                  <div class="card-body">
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <div class="">

                      </div>
                    <a class="btn btn-light"><small class="text-muted"><strong>Price:$45.00</strong></small></a>
                      <a href="#" class="btn btn-outline-info"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></a>
                  </div>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="card post-slide" style="width: 18rem;">
                  <div class="post-img " style="margin:0px;padding:0px;">
				        <a href="#"><img src="image/3.png" class="card-img-top" alt=""/></a>
			       </div>
                  <div class="card-body">
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <div class="">

                      </div>
                    <a class="btn btn-light"><small class="text-muted"><strong>Price:$45.00</strong></small></a>
                      <a href="#" class="btn btn-outline-info"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></a>
                  </div>
                </div>
              </div>
               
          </div>
    </div>
    <!--卡片展示商品信息-->
    <script>
        $(document).ready(function () {

            //点击添加购物车
            $(".good").click(function () {
                var value = $(this).html();
                var regExp = new RegExp("<i class=\"fa fa-cart-arrow-down \" aria-hidden=\"true\"><span style=\"display:none\">"); // /^(.{0,10}).*$/
                value = value.replace(regExp, " ");
                value = value.replace("</span></i>", "");
                //alert(value);

                $.post("addCart_pdl.aspx",
                    {
                        g_id:value
                    },
                    function (data, status) {
                        //alert(data);
                        //no login
                        if (data == "no") {
                            var val = $("#login_targer").text();
                            if (val != null && "我的信息" == val) {
                                window.location.href = "myinfo.aspx";//TO DO 将请求调转到我的信息页面
                            }
                            else {
                                //alert("数据：" + data + "\n状态：" + status);
                                $("#username").text("");
                                $("#userpwd").text("");

                                $("#result").removeClass("text-success")
                                $("#result").addClass("text-danger");
                                $("#result").html("");
                                $('#result').fadeIn("slow");
                                $('#exampleModalScrollable').modal('show');
                            }
                            //alert(data);
                        }
                        else if (data == "true") {
                            alert("添加成功");
                        }
                        else {
                            alert("添加失败");
                        }
                    });
              
            });

        });
    </script>
</asp:Content>
