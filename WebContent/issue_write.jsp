<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>�Խ��� - �۾���</title>
    
    <style type="text/css">
        #title{
            height : 16;
            font-family :'����';
            font-size : 12;
            text-align :center;
        }
    </style>
    
</head>
<body>
 
    <div align="center">
    <br>
    <b><font size="6" color="gray">�۾���</font></b>
    <br>
    </div>
    
    <form method="post" action="write" enctype="multipart/form-data">
    <table width="700" border="3" bordercolor="lightgray" align="center">
        <tr>
            <td id="title">�ۼ���</td>
            <td>������</td>
        </tr>
            <tr>
            <td id="title">
                �� ��
            </td>
            <td>
                <input name="title" type="text" size="70" maxlength="100" value=""/>
            </td>        
        </tr>
        <tr>
            <td id="title">
                �� ��
            </td>
            <td>
                <textarea name="content" cols="72" rows="20"></textarea>            
            </td>        
        </tr>
        <tr>
            <td id="title">
                ����÷��
            </td>
            <td>
                <input type="file" name="issueImg" />
            </td>    
        </tr>
 
        <tr align="center" valign="middle">
            <td colspan="5">
                <input type="reset" value="�ۼ����" >
                <input type="submit" value="���" >
                <input type="button" value="���" >            
            </td>
        </tr>
    </table>    
    </form>
    
</body>
</html>
