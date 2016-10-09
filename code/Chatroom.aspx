<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chatroom.aspx.cs" Inherits="LinqChat.Chatroom" Theme="Theme1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LINQ Chatroom</title>
    <script type="text/javascript">       
        function SetScrollPosition()
        {
            var div = document.getElementById('divMessages');
            div.scrollTop = 100000000000;
        }
        
        function SetToEnd(txtMessage)
        {                    
            if (txtMessage.createTextRange)
            {
                var fieldRange = txtMessage.createTextRange();
                fieldRange.moveStart('character', txtMessage.value.length);
                fieldRange.collapse();
                fieldRange.select();
            }
        }
               
        function ReplaceChars() 
        {
            var txt = document.getElementById('txtMessage').value;
            var out = "<"; // replace this
            var add = ""; // with this
            var temp = "" + txt; // temporary holder

            while (temp.indexOf(out)>-1) 
            {
                pos= temp.indexOf(out);
                temp = "" + (temp.substring(0, pos) + add + 
                temp.substring((pos + out.length), temp.length));
            }
            
            document.getElementById('txtMessage').value = temp;
        }
        
        function LogOutUser(result, context)
        {
            // don't do anything here
        }
        
        function LogMeOut()
        {
            LogOutUserCallBack();   
        }
    </script>
    <style type="text/css">
        .style1
        {
            color: #CC2800;
            background-color: #F1FED6;
        }
        .style2
        {
            font-size: x-large;
            font-weight: bold;
            color: #FF3385;
            background-color: #F1FED6;
        }
        .style3
        {
            width: 603px;
            height: 240px;
        }
        .style4
        {
            width: 11px;
            height: 240px;
        }
        .style5
        {
            background-color: #FEFFFF;
        }
        .style6
        {
            color: #CC2800;
            background-color: #FEFFFF;
        }
        .style7
        {
            font-size: x-large;
            font-weight: bold;
            color: #FF3385;
            background-color: #FEFFFF;
        }
        .style8
        {
            background-color: #FFFFFF;
        }
        .style11
        {
            background-color: #EBB548;
        }
        .style12
        {
            background-color: #EBB548;
        }
        .style13
        {
            height: 240px;
        }
    </style>
</head>
<body style="background-color: gainsboro;" onload="SetScrollPosition()" onunload="LogMeOut()">
    <form id="form1" defaultbutton="btnSend" defaultfocus="txtMessage" runat="server" >
    <div style="color: #CC6699; background-color: #F7E0B3; background-image: url('Images/background-001.jpg'); height: 742px; width: 1368px;">
        &nbsp;
        <asp:ScriptManager Id="ScriptManager1" runat="server" EnablePartialRendering="true" />
        &nbsp; <span class="style1">
        <span class="style12">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        </span><span class="style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label Id="lblRoomName" Font-Size="18px" runat="server" Font-Bold="True" 
            ForeColor="#F9F2E6" style="background-color: #EBB548" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        </span>
        </span><span class="style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Image ID="Image1" runat="server" AlternateText="Problem Occured!!" 
            Height="31px" ImageUrl="~/Images/letter-e-hi.png" Width="34px" />
&nbsp;<asp:Label ID="Label18" runat="server" Font-Size="XX-Large" ForeColor="#FF0066" 
            Text="Welcome to "></asp:Label>
        </span><span class="style2"><span 
            class="style5"><span class="style8">
        <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="XX-Large" 
            ForeColor="#FF7F00" Text="eMath ."></asp:Label>
        </span></span>
        <br />
        <span class="style1">
        <span class="style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label Id="lbltitle" Font-Size="Medium" runat="server" ForeColor="#CA0098" >Dear 
        Participants! Make use of this site to discuss your curriculum topics.</asp:Label>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp; </span><span class="style6">
        &nbsp;&nbsp;</span></span><span class="style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label1" 
            runat="server" Font-Size="Medium" ForeColor="#6600FF" 
            Text="It's as simple as chatting with your friends." 
            style="background-color: #FFFFFF"></asp:Label>
        <br />
        </span><span class="style7">&nbsp;&nbsp;</span></span><span class="style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Find your friends online."></asp:Label>
        <asp:Label ID="Label3" runat="server" ForeColor="#00BB00" 
            Text="Begin your discussion."></asp:Label>
        </span>
        <span class="style1">
        <span class="style5">
        <br />
        </span></span>
        <span class="style6">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span><span class="style1">
        <span class="style5"><asp:Label Id="lblRoomId" Visible="false" runat="server" />
                            </span></span><asp:UpdatePanel Id="UpdatePanel1" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlId="Timer1" />
            </Triggers>
            <ContentTemplate>
                <asp:Timer Id="Timer1" Interval="7000" OnTick="Timer1_OnTick" runat="server" />
                <table border="0" cellpadding="0" cellspacing="0" 
                    style="height: 256px; width: 1005px">
                    <tr>
                        <td class="style3">
                            <div id="divMessages" 
                                style="border: 1px solid Black; background-color: White; height:239px; width:710px; overflow-y:scroll; font-size: 11px; padding: 4px 4px 4px 4px; color: #000000;" 
                                onresize="SetScrollPosition()">
                                <asp:Literal Id="litMessages" runat="server" />
                                &nbsp;
                            </div>
                        </td>
                        <td class="style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                        <td class="style13">
                            <div id="divUsers" 
                                
                                style="border: 1px solid Black; background-color: #FFC6FF; height:240px; width:188px; overflow-y:scroll; font-size: medium;  padding: 4px 4px 4px 4px; color: #000000; font-family: Arial, Helvetica, sans-serif; background-image: none;">
                               <asp:Literal Id="litUsers" runat="server" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            &nbsp;<asp:TextBox Id="txtMessage" onkeyup="ReplaceChars()" onfocus="SetToEnd(this)" 
                                runat="server" MaxLength="100" Width="712px" Height="59px" 
                                style="background-color: #CCEDFF" BackColor="#F3D698" Font-Names="Miriam" 
                                Font-Size="Medium" />
                            &nbsp;
                            <asp:Button Id="btnSend" runat="server" Text="Send" 
                                OnClientClick="SetScrollPosition()" OnClick="BtnSend_Click" Height="34px" 
                                Width="87px" BackColor="#F9E8C6" BorderStyle="Solid" Font-Bold="True" 
                                Font-Names="Microsoft Sans Serif" Font-Size="Small" ForeColor="Black" 
                                BorderColor="#CC0000" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button Id="btnLogOut" Text="Log Out" runat="server" 
                                OnClick="BtnLogOut_Click" Width="90px" Height="35px" BackColor="#F3D698" 
                                BorderStyle="Solid" Font-Bold="True" Font-Names="Microsoft Sans Serif" 
                                BorderColor="#990033" Font-Size="Small" />
                        </td>
                    </tr>
                </table>                
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="about" runat="server" Font-Names="Consolas" 
                    Font-Size="Small" ForeColor="#9F7111">About</asp:HyperLink>
                &nbsp;&nbsp;<asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="Consolas" 
                    Font-Size="Small" Text="."></asp:Label>
                &nbsp;&nbsp;<asp:HyperLink ID="about0" runat="server" Font-Names="Consolas" 
                    Font-Size="Small" ForeColor="#9F7111">Blog</asp:HyperLink>
                &nbsp;&nbsp;<asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Names="Consolas" 
                    Font-Size="Small" Text="."></asp:Label>
                &nbsp;&nbsp;<asp:HyperLink ID="about1" runat="server" Font-Names="Consolas" 
                    Font-Size="Small" ForeColor="#9F7111">Help</asp:HyperLink>
                &nbsp;&nbsp;<asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Names="Consolas" 
                    Font-Size="Small" Text="."></asp:Label>
                &nbsp;&nbsp;<asp:HyperLink ID="about2" runat="server" Font-Names="Consolas" 
                    Font-Size="Small" ForeColor="#9F7111">Privacy</asp:HyperLink>
                &nbsp;&nbsp;<asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Consolas" 
                    Font-Size="Small" Text="."></asp:Label>
                &nbsp;&nbsp;<asp:HyperLink ID="about3" runat="server" Font-Names="Consolas" 
                    Font-Size="Small" ForeColor="#9F7111">Terms</asp:HyperLink>
                &nbsp;&nbsp;<asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Names="Consolas" 
                    Font-Size="Small" Text="."></asp:Label>
                &nbsp;&nbsp;<asp:HyperLink ID="about4" runat="server" Font-Names="Consolas" 
                    Font-Size="Small" ForeColor="#9F7111">Mobile</asp:HyperLink>
                &nbsp;&nbsp;<asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Names="Consolas" 
                    Font-Size="Small" Text="."></asp:Label>
                &nbsp;
                <asp:HyperLink ID="about5" runat="server" Font-Names="Consolas" 
                    Font-Size="Small" ForeColor="#9F7111">Language</asp:HyperLink>
            </ContentTemplate>
        </asp:UpdatePanel> 
    </div>
    </form>
</body>
</html>
