<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mygoods.aspx.cs" Inherits="shop.myshop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>我的商店</title>
     <link rel="stylesheet" href="jyc/css/page.css" />
		<script type="text/javascript" src="jyc/js/jquery.min.js" ></script>
		<script type="text/javascript" src="jyc/js/index.js" ></script>
</head>
<body>
    <form id="form1" runat="server">
         <div class="left">
			<div class="bigTitle">Second Hand</div>
			<div class="lines">
				<div onclick="pageClick(this)"><img src="jyc/img/icon-2.png" /><a href="mygoods.aspx">我的商品</a></div>
				<div onclick="pageClick(this)"><img src="jyc/img/icon-3.png" /><a href="corder.aspx">客户订单</a></div>
                <style>
                    a:link,a:visited{
                        text-decoration:none;
                        color:chocolate;
                        font-weight:bold;
                        font-size:20px;
                    }
                    .auto-style1 {
                        height: 29px;
                    }
                    .auto-style2 {
                        width: 465px;
                    }
                    .auto-style3 {
                        height: 29px;
                        width: 416px;
                    }
                    .auto-style4 {
                        width: 416px;
                    }
                    .auto-style5 {
                        margin-left: 0px;
                    }
                </style>
			</div>
		</div>
		<div class="top" style="background-color: #e3f2fd">
			<div class="leftTiyle" id="flTitle" style="color: #0000FF">我的商品</div>
            <div class="thisUser"><a href="index.aspx">返回首页</a></div>
		</div>
		<div class="content" style="background-color: #ffffff">
            <asp:GridView ID="GridView1" runat="server" align="center" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="100%" Font-Size="15px">
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
            <br />
            <table align="center" border="1" style="background-color: #e3f2fd; width:50%" class="auto-style2">
                <tr>
                    <td class="auto-style1">商品号</td>
                    <td class="auto-style3"><asp:TextBox ID="TextBox1" runat="server" Width="220px" CssClass="auto-style5"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style1">商品名</td>
                    <td class="auto-style3"><asp:TextBox ID="TextBox2" runat="server" Width="220px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>价格</td>
                    <td class="auto-style4"><asp:TextBox ID="TextBox3" runat="server" Width="220px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>库存</td>
                    <td class="auto-style4"><asp:TextBox ID="TextBox4" runat="server" Width="220px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>图片1</td>
                    <td class="auto-style4"><asp:FileUpload ID="FileUpload1" runat="server" Width="220px" BorderStyle="Solid" /></td>
                </tr>
                 <tr>
                    <td>图片2</td>
                    <td class="auto-style4"><asp:FileUpload ID="FileUpload2" runat="server" Width="220px" BorderStyle="Solid" /></td>
                </tr>
                 <tr>
                    <td style="background-color: #e3f2fd">图片3</td>
                    <td class="auto-style4"><asp:FileUpload ID="FileUpload3" runat="server" Width="220px" BorderStyle="Solid" /></td>
                </tr>
                 <tr>
                    <td>图片4</td>
                    <td class="auto-style4"><asp:FileUpload ID="FileUpload4" runat="server" Width="220px" BorderStyle="Solid" /></td>
                </tr>
                <tr>
                    <td>详细描述</td>
                    <td class="auto-style4"><asp:TextBox ID="TextBox5" runat="server" Width="220px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>商品种类</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Value="1">生活百货</asp:ListItem>
                            <asp:ListItem Value="2">美妆</asp:ListItem>
                            <asp:ListItem Value="3">手机数码</asp:ListItem>
                            <asp:ListItem Value="4">运动户外</asp:ListItem>
                            <asp:ListItem Value="5">服饰</asp:ListItem>
                            <asp:ListItem Value="6">电器</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <asp:Button ID="Button1" runat="server" Text="添加" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="修改" OnClick="Button2_Click" />
            <asp:Button ID="Button3" runat="server" Text="删除" OnClick="Button3_Click" />
            </div>
		<div style="text-align:center;">
            </div>     		
    </form>
</body>
</html>
