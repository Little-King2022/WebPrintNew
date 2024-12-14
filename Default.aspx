<%@ page language="C#" autoeventwireup="true" codefile="Default.aspx.cs" inherits="Print" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>5015在线打印 - 网页版</title>
    <link rel="stylesheet" href="style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
</head>

<body>
    <main class="agile-its">
        <h2>上传文件</h2>
        <div class="print">
            <div class="header">
                <div class="tips">
                    <span>支持格式:</span>
                    <ul class="listtype">
                        <li>PDF(.pdf)</li>
                        <li>图片(.png .jpg .tiff)</li>
                        <li>文本(.txt)</li>
                        <li>Word(.doc .docx .rtf)</li>
                    </ul>
                </div>
                <div class="warn">重要文件建议打印PDF格式，Word可能有排版问题</div>
                
            </div>
            <div id="messages">
                <asp:label id="Message" runat="server"></asp:label>
            </div>
            <form id="upload" method="POST" enctype="multipart/form-data">
                <div class="agileinfo">
                    <div id="filedrag">
                        <span class="uploadtip">点击上传 或 拖拽<br />
                            支持多个文件</span>
                    </div>
                    <input type="file" id="files" name="files[]" multiple="multiple" required="required"
                        accept=".pdf,.doc,.docx,.rtf,.txt,image/jpg,image/tiff,image/png" />
                </div>
                <div class="agileinfo inputbox">
                    <% if (needPwd) { string
                        pwd=String.IsNullOrEmpty(Request.Form["password"])?(String)Session["pwd"]:Request.Form["password"].Trim();
                        %>
                        <input type='password' name='password' id='password' onchange="savePassword()" onfocus="type='text'"
                            onblur="type='password'" placeholder='请输入打印密码' required='required' value='<%=pwd%>' />
                        <% } %>
                </div>
                <div class="agileinfo inputbox" id="copies">
                    <input name="copies" type="number" value="1" title="份数" placeholder="设置份数" required />
                </div>
                <button type="submit" id="submit" onsubmit="this.disabled=true" disabled>提交打印</button>
            </form>
        </div>
    </main>
    <footer>
        <p>
            <a href="https://github.com/NewFuture/WebPrint" target="_blank">
                <img alt="GitHub"
                    src="https://img.shields.io/badge/Github-%E9%A1%B9%E7%9B%AE%E5%9C%B0%E5%9D%80-blue" /> 
                <img alt="GitHub stars"
                    src="https://img.shields.io/github/stars/NewFuture/WebPrint.svg?style=social" />
            </a>
        </p>
    </footer>
    <script src="file.js"></script>
    <script>
        function savePassword() {
            var password = document.getElementById('password').value;
            if (password) {
                localStorage.setItem('printPassword', password);
            }
        }
        window.onload = function () {
            var savedPassword = localStorage.getItem('printPassword');
            if (savedPassword) {
                document.getElementById('password').value = savedPassword;
            }
        }
    </script>

</body>

</html>