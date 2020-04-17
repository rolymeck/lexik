<#import "fragment/account.ftlh" as acc>
<#import "fragment/common.ftlh" as c>

<@c.page "Вход | Lexik.me">
    <h1>Вход</h1>
    <@acc.loginForm "/login"/>
    <a href="/registration">Регистрация</a>
</@c.page>