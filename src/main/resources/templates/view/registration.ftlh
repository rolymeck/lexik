<#import "fragment/account.ftlh" as acc>

<!DOCTYPE html>
<html>
<head>
    <title>Spring Security Example </title>
</head>
<body>
<h1>Регистрация</h1>
<#if message??>
<div>${message}</div>
</#if>
<@acc.loginForm "/registration"/>
</body>
</html>