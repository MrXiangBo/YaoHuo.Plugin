<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WapLogin.aspx.cs" Inherits="YaoHuo.Plugin.WapLogin" %>

<%@ Import Namespace="YaoHuo.Plugin.Tool" %>
<%
    if (this.INFO == "OK")
    {
        wmlVo.timer = "0"; //5����Զ���ת
        wmlVo.strUrl = backurl;
    }
    StringBuilder strhtml = new StringBuilder();
    //��ʾͷ
    if (ver == "1")
    {
        //��ʾWAP1.0
        Response.Redirect("/waplogin.aspx?sid=-2");
    }
    else
    {
        //��ʾWAP2.0
        strhtml.Append("<!DOCTYPE html><html>");
        strhtml.Append("<head>");
        strhtml.Append("<meta charset='utf-8'>");
        strhtml.Append("<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'>");
        strhtml.Append("<meta name='keywords' content='����,������,������̳'/>");
        strhtml.Append("<meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'>");
        strhtml.Append("<title>��¼ - ������</title>");
        strhtml.Append("<meta http-equiv='Content-type' content='text/html;charset=UTF-8'>");
        strhtml.Append("<link rel='stylesheet' href='/CSS/img/login/000.css'>");
        strhtml.Append("<script src='/CSS/img/login/bundle-home.js'></script>");
        strhtml.Append("<script src='/css/img/login/zero.js'></script>");
        //�ײ�������Դ�ļ�
        if (!string.IsNullOrEmpty(this.RecaptchaV2_Key))
        {
            //strhtml.Append("<script src='https://www.google.com/recaptcha/api.js'></script>");
            strhtml.Append("<script src='https://recaptcha.google.cn/recaptcha/api.js'></script>");
        }
        strhtml.Append("</head>");
        if (this.INFO == "OK")
        {
            strhtml.Append("<meta http-equiv='refresh' content='0;url=wapindex.aspx?sid=-2'><div class='wrap'><div style='text-align: center; color: #FFFFFF; font-weight: 500; padding-bottom: 10px; letter-spacing: 2px; margin-top: 120px;'><h1>��¼�ɹ�</h1></div></div>");
        }
        if (this.INFO == "IDNULL")
        {
            strhtml.Append("<div class='tip'>");
            strhtml.Append("" + this.GetLang("�������˺�|�������˺�|username not null!") + "</div>");
        }
        else if (this.INFO == "PASSNULL")
        {
            strhtml.Append("<div class='tip'>");
            strhtml.Append("" + this.GetLang("����������|����������|password not null!") + "</div>");
        }
        else if (this.INFO == "NOTEXIST")
        {
            strhtml.Append("<div class='tip'>");
            strhtml.Append("" + this.GetLang("��ȷ���˺���ȷ|��ȷ���˺���ȷ|username not exist ") + "</div>");
        }
        else if (this.INFO == "PASSERR")
        {
            strhtml.Append("<div class='tip'>");
            strhtml.Append("" + this.GetLang("��ȷ��������ȷ|��ȷ��������ȷ|Password error!") + "</div>");
        }
        else if (this.INFO == "USERLOCK")
        {
            strhtml.Append("<div class='tip'>");
            strhtml.Append("" + this.GetLang("�û�������|�û�������|user locked!") + "</div>");
        }
        else if (this.INFO == "MAXLOGIN")
        {
            strhtml.Append("<div class='tip'>");
            strhtml.Append("" + this.GetLang("��¼ʧ�ܳ��� " + this.KL_LoginTime + " ���ˣ�����������") + "</div>");
        }
        else if (this.INFO == "NOTGOOGLERECAPTCHA")
        {
            strhtml.Append("<div class='tip'>");
            strhtml.Append("" + this.GetLang("�˻���֤ʧ�ܣ�������") + "</div>");
        }
        else if (this.INFO == "weixin")
        {
            strhtml.Append("<div class='tip'>");
            if (publicID != "")
            {
                strhtml.Append("����΢�żӱ�վ�����ʺ�:" + publicName + " �� " + publicID + " ����ע���Զ�ע���Ϊ��Ա������������΢���Ϸ��ͣ�����+XXXX���鿴ע���ʺ���Ϣ���ͣ��ʺ�");
            }
            else
            {
                strhtml.Append("��վ����Ա��û������΢�Ź��ʺš�");
            }
            strhtml.Append("</div>");
        }
        if (errorinfo == "config")
        {
            strhtml.Append("<div class='tip'>");
            strhtml.Append("<b>������ǽ����¼���棬����ϵվ���ڡ���վĬ�����ơ���[55].�������淽ʽ��ѡ[1]</b></div>");
        }
        //���Ǵ���html��
        string isWebHtml = this.ShowWEB_view(this.classid);
        if (this.INFO != "OK")
        {
            strhtml.Append("<body id='login' class='unloaded'><div class='wrapper'><div class='zero'></div><div class='login'> <form action='/waplogin.aspx' method='post' name='login' class='container offset1 loginform'> <div id='owl-login'> <div class='eyes'></div> <div class='arm-up-right'></div> <div class='arm-up-left'></div> <div class='arm-down-left'></div> <div class='arm-down-right'></div> </div><div class='pad'> <div class='control-group'> <div class='controls'> <label for='email' class='control-label fa fa-envelope'></label> <input type='text' name='logname' id='logname' placeholder='�ֻ���ID��' tabindex='1' autofocus='autofocus' required class='form-control input-medium' value='" + this.logname + "'/> </div> </div> <div class='control-group'> <div class='controls'> <label for='password' class='control-label fa fa-asterisk'> </label> <input id='password' type='password' name='logpass' placeholder='����������' tabindex='2' required class='form-control input-medium' value='" + this.logpass + "'/> <input type='hidden' name='action' value='login'><input type='hidden' name='classid' value='0'><input type='hidden' name='siteid' value='1000'><input type='hidden' name='backurl' value='" + backurl + "'/><input type='hidden' name='savesid' value='0' ></div></div>");
            //�ȸ��˻���֤����
            if (!string.IsNullOrEmpty(this.RecaptchaV2_Key))
            {
                strhtml.Append("<div style='margin-bottom: -20px;' class='g-recaptcha' data-sitekey='" + this.RecaptchaV2_Key + "'></div>");
            }
            strhtml.Append("</div><div class='form-actions'> <a tabindex='5' href='/bbs-138352.html' class='btn pull-left btn-link text-muted'>ע��</a> <button type='submit' tabindex='4' class='btn btn-primary'>��¼</button> </div></form></div></div></html>");
        }
        if (isWebHtml != "")
        {
            Response.Clear();
            Response.Write(WapTool.ToWML(isWebHtml, wmlVo).Replace("[view]", strhtml.ToString()));
            Response.End();
        }
        Response.Write(strhtml);
    }
    //��ʾ�ײ�
    Response.Write(WapTool.showDown(wmlVo));
%>
