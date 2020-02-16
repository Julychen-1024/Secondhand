<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="corder.aspx.cs" Inherits="shop.corder" %>

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
  <div>
         <div class="left">
			<div class="bigTitle">我的商店</div>
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
                </style>
			</div>
		</div>
		<div class="top"  style="background-color: #e3f2fd">
			<div class="leftTiyle" id="flTitle">客户订单</div>
            <div class="thisUser"><a href="index.aspx">退出</a></div>
		</div>
		<div class="content" style="font-weight: bold; font-family: 华文楷体; font-size: 25px;">
            未确认订单<br />
             <asp:GridView ID="GridView1" align="center" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Font-Size="15px" Width="50%">
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
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="确认订单" OnClick="Button1_Click" />
		</div>
      <div style="text-align:center;">
      </div>
    </div>
    </form>
</body>
</html>
