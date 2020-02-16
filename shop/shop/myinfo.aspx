<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myinfo.aspx.cs" Inherits="shop.myinfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>我的信息</title>
    <link rel="stylesheet" href="jyc/css/page.css" />
    <script type="text/javascript" src="jyc/js/jquery.min.js" ></script>
    <script type="text/javascript" src="jyc/js/index.js" ></script>
</head>
<body>
    <form id="form1" runat="server">
     <div>
    <div class="left">
			<div class="bigTitle">我的信息</div>
			<div class="lines">
				
				<div onclick="pageClick(this)"><img src="jyc/img/icon-2.png" /><a href="myinfo.aspx">我的信息</a></div>
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
			<div class="leftTiyle" id="flTitle">我的信息</div>
			<div class="thisUser"><a href="index.aspx">退出</a></div>
		</div>
		<div class="content">
           <table align="center" border="1" style="background-color: #e3f2fd; width:50%" class="auto-style2">
                <tr>
                    <td class="auto-style1">账号</td>
                    <td class="auto-style3"><asp:TextBox ID="TextBox1" runat="server" Width="220px" CssClass="auto-style5" ReadOnly="True"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style1">用户名</td>
                    <td class="auto-style3"><asp:TextBox ID="TextBox2" runat="server" Width="220px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td class="auto-style4"><asp:TextBox ID="TextBox3" runat="server" Width="220px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>电话</td>
                    <td class="auto-style4"><asp:TextBox ID="TextBox4" runat="server" Width="220px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>邮箱</td>
                    <td class="auto-style4"><asp:TextBox ID="TextBox5" runat="server" Width="220px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>地址</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBox6" runat="server" Width="220px"></asp:TextBox>
                    </td>
                </tr>
                </table>
            <asp:Button ID="Button1" runat="server" Text="确认修改" OnClick="Button1_Click" Width="77px" />
		</div>
		<div style="text-align:center;">
</div>
    </div>
    </form>
</body>
</html>
