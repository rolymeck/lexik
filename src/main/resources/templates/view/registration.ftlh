<#import "fragment/common.ftlh" as c>
<#import "fragment/account.ftlh" as acc>

<@c.page "Сообщения | Lexik.me">
    <h1>Регистрация</h1>
    <#if message??>
        <div>${message}</div>
    </#if>
    <@acc.loginForm "/registration"/>
</@c.page>